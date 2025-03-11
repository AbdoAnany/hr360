import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr360/core/utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _signUpFormKey = GlobalKey<FormState>();
  final _pageController = PageController();
  int _currentPage = 0;
  bool _isLoading = false;
  File? _avatarImage;
  final _imagePicker = ImagePicker();
  DateTime? _selectedBirthDate;
  bool _passwordObscured = true;
  bool _confirmPasswordObscured = true;

  // Define form field limits
  final int _maxUsernameLength = 30;
  final int _maxNameLength = 50;
  final int _maxEmailLength = 100;
  final int _maxPhoneLength = 15;
  final int _maxAddressLength = 200;
  final int _maxNationalIdLength = 20;

  final _userCredentialsControllers = {
    'username': TextEditingController(),
    'password': TextEditingController(),
    'confirmPassword': TextEditingController(),
  };

  final _personalInfoControllers = {
    'firstName': TextEditingController(),
    'lastName': TextEditingController(),
    'email': TextEditingController(),
    'phone': TextEditingController(),
    'address': TextEditingController(),
    'nationalId': TextEditingController(),
  };

  String? _selectedGender;
  String? _selectedRole;
  String? _selectedStatus;
  String? _usernameError;
  String? _emailError;
  String? _phoneError;
  String? _nationalIdError;

  @override
  void initState() {
    super.initState();
    _selectedStatus = 'Active'; // Set default status
  }

  @override
  void dispose() {
    _pageController.dispose();
    _userCredentialsControllers.forEach((_, controller) => controller.dispose());
    _personalInfoControllers.forEach((_, controller) => controller.dispose());
    super.dispose();
  }

  Future<void> _signUp() async {
    if (!_validateCurrentPage()) return;
    if (!_signUpFormKey.currentState!.validate()) {
      _showErrorSnackbar('Please fix the errors in the form');
      return;
    }

    setState(() => _isLoading = true);
    try {
      // Collect all form data
      final userData = {
        ..._userCredentialsControllers.map((key, value) => MapEntry(key, value.text.trim())),
        ..._personalInfoControllers.map((key, value) => MapEntry(key, value.text.trim())),
        'gender': _selectedGender,
        'role': _selectedRole,
        'status': _selectedStatus,
        'birthDate': _selectedBirthDate != null
            ? DateFormat('yyyy-MM-dd').format(_selectedBirthDate!)
            : null,
        'avatarPath': _avatarImage?.path,
      };

      // Simulate API call delay
      await Future.delayed(const Duration(seconds: 2));

      // Show success message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Registration successful!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        _showErrorSnackbar('Registration failed: ${e.toString()}');
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 4),
      ),
    );
  }

  Future<void> _pickImage() async {
    try {
      final pickedFile = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 600,
        maxHeight: 600,
        imageQuality: 80,
      );
      if (pickedFile != null) {
        setState(() => _avatarImage = File(pickedFile.path));
      }
    } catch (e) {
      _showErrorSnackbar('Failed to pick image: ${e.toString()}');
    }
  }

  Future<void> _selectBirthDate() async {
    try {
      final initialDate = _selectedBirthDate ??
          DateTime.now().subtract(const Duration(days: 365 * 18));
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(1930),
        lastDate: DateTime.now(),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: AppColor.primary,
                onPrimary: AppColor.white,
                onSurface: Colors.black,
              ),
            ),
            child: child!,
          );
        },
      );
      if (picked != null && picked != _selectedBirthDate) {
        setState(() => _selectedBirthDate = picked);
      }
    } catch (e) {
      _showErrorSnackbar('Failed to open date picker: ${e.toString()}');
    }
  }

  bool _validateCurrentPage() {
    if (_currentPage == 0) {
      final username = _userCredentialsControllers['username']!.text.trim();
      final password = _userCredentialsControllers['password']!.text;
      final confirmPassword = _userCredentialsControllers['confirmPassword']!.text;

      if (username.isEmpty) {
        _showErrorSnackbar('Username is required');
        return false;
      }
      if (password.isEmpty) {
        _showErrorSnackbar('Password is required');
        return false;
      }
      if (confirmPassword.isEmpty) {
        _showErrorSnackbar('Please confirm your password');
        return false;
      }
      if (password.length < 8) {
        _showErrorSnackbar('Password must be at least 8 characters');
        return false;
      }
      if (!RegExp(r'\d').hasMatch(password)) {
        _showErrorSnackbar('Password must contain at least one number');
        return false;
      }
      if (password != confirmPassword) {
        _showErrorSnackbar('Passwords do not match');
        return false;
      }
      if (username.toLowerCase() == 'admin') {
        _usernameError = 'Username already taken';
        _showErrorSnackbar('Username already taken');
        return false;
      }
      return true;
    } else if (_currentPage == 1) {
      final firstName = _personalInfoControllers['firstName']!.text.trim();
      final lastName = _personalInfoControllers['lastName']!.text.trim();
      final email = _personalInfoControllers['email']!.text.trim();
      final phone = _personalInfoControllers['phone']!.text.trim();
      final nationalId = _personalInfoControllers['nationalId']!.text.trim();

      if (firstName.isEmpty || lastName.isEmpty) {
        _showErrorSnackbar('First name and last name are required');
        return false;
      }
      if (email.isEmpty) {
        _showErrorSnackbar('Email is required');
        return false;
      }
      if (_selectedGender == null) {
        _showErrorSnackbar('Please select a gender');
        return false;
      }
      if (_selectedRole == null) {
        _showErrorSnackbar('Please select a role');
        return false;
      }
      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
        _emailError = 'Invalid email format';
        _showErrorSnackbar('Please enter a valid email address');
        return false;
      }
      if (phone.isNotEmpty && !RegExp(r'^\+?[0-9]{10,15}$').hasMatch(phone)) {
        _phoneError = 'Invalid phone format';
        _showErrorSnackbar('Please enter a valid phone number');
        return false;
      }
      if (nationalId.isNotEmpty && !RegExp(r'^[A-Z0-9]{8,20}$').hasMatch(nationalId)) {
        _nationalIdError = 'Invalid national ID format';
        _showErrorSnackbar('Please enter a valid national ID');
        return false;
      }
      return true;
    }
    return true;
  }

  void _goToNextPage() {
    if (_validateCurrentPage()) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToPreviousPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 600;
    final formWidth = isSmallScreen ? screenWidth * 0.9 : 600.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: Form(
                  key: _signUpFormKey,
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: formWidth),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: LinearProgressIndicator(
                                      value: (_currentPage + 1) / 2,
                                      backgroundColor: Colors.grey[300],
                                      color: AppColor.primary,
                                      minHeight: 8.h,
                                    ),
                                  ),
                                  SizedBox(width: 10.w),
                                  Text(
                                    'Step ${_currentPage + 1} of 2',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.primary,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Container(
                              constraints: BoxConstraints(minHeight: 450.h,
                              maxHeight: 600.h,
                              ),
                              child: PageView(
                                controller: _pageController,
                                physics: const NeverScrollableScrollPhysics(),
                                onPageChanged: (page) => setState(() => _currentPage = page),
                                children: [
                                  _buildUserCredentialsForm(isSmallScreen),
                                  _buildPersonalInfoForm(isSmallScreen),
                                ],
                              ),
                            ),
                            SizedBox(height: 20.h),
                            if (isSmallScreen)
                              Column(
                                children: [
                                  if (_currentPage > 0)
                                    _buildNavigationButton(
                                      'Back',
                                      _goToPreviousPage,
                                      width: formWidth,
                                      isPrimary: false,
                                    ),
                                  SizedBox(height: _currentPage > 0 ? 10.h : 0),
                                  _buildNavigationButton(
                                    _currentPage < 1 ? 'Next' : 'Sign Up',
                                    _currentPage < 1 ? _goToNextPage : _signUp,
                                    width: formWidth,
                                    isLoading: _isLoading,
                                  ),
                                ],
                              )
                            else
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (_currentPage > 0)
                                    _buildNavigationButton(
                                      'Back',
                                      _goToPreviousPage,
                                      width: 120.w,
                                      isPrimary: false,
                                    ),
                                  SizedBox(width: _currentPage > 0 ? 10.w : 0),
                                  _buildNavigationButton(
                                    _currentPage < 1 ? 'Next' : 'Sign Up',
                                    _currentPage < 1 ? _goToNextPage : _signUp,
                                    width: _currentPage > 0 ? 250.w : formWidth,
                                    isLoading: _isLoading,
                                  ),
                                ],
                              ),
                            SizedBox(height: 20.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          if (_isLoading)
            Container(
              color: Colors.black.withOpacity(0.3),
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(20.r),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(AppColor.primary),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        'Creating your account...',
                        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildUserCredentialsForm(bool isSmallScreen) {
    final formWidth = isSmallScreen ? double.infinity : 350.w;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20.h),
          Text(
            'Create Your Account',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: AppColor.primary,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            'Please enter your credentials',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 30.h),
          _buildTextField(
            controller: _userCredentialsControllers['username']!,
            label: 'Username',
            icon: Iconsax.security_user,
            errorText: _usernameError,
            maxLength: _maxUsernameLength,
            width: formWidth,
            validator: (value) {
              if (value!.trim().isEmpty) return 'Please enter a username';
              if (value.trim().length < 3) return 'Username must be at least 3 characters';
              return _usernameError;
            },
          ),
          _buildTextField(
            controller: _userCredentialsControllers['password']!,
            label: 'Password',
            icon: Iconsax.lock,
            obscureText: _passwordObscured,
            width: formWidth,
            suffixIcon: IconButton(
              icon: Icon(_passwordObscured ? Iconsax.eye : Iconsax.eye_slash),
              onPressed: () => setState(() => _passwordObscured = !_passwordObscured),
            ),
            validator: (value) {
              if (value!.isEmpty) return 'Please enter a password';
              if (value.length < 8) return 'Password must be at least 8 characters';
              if (!RegExp(r'\d').hasMatch(value)) return 'Password must contain at least one number';
              return null;
            },
          ),
          _buildTextField(
            controller: _userCredentialsControllers['confirmPassword']!,
            label: 'Confirm Password',
            icon: Iconsax.lock,
            obscureText: _confirmPasswordObscured,
            width: formWidth,
            suffixIcon: IconButton(
              icon: Icon(_confirmPasswordObscured ? Iconsax.eye : Iconsax.eye_slash),
              onPressed: () => setState(() => _confirmPasswordObscured = !_confirmPasswordObscured),
            ),
            validator: (value) {
              if (value!.isEmpty) return 'Please confirm your password';
              if (value != _userCredentialsControllers['password']!.text) return 'Passwords do not match';
              return null;
            },
          ),
          SizedBox(height: 20.h),
          Container(
            width: formWidth,
            padding: EdgeInsets.all(15.r),
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Password Requirements:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp,
                    color: AppColor.primary,
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  '• At least 8 characters\n'
                      '• At least one number\n'
                      '• Avoid using personal information',
                  style: TextStyle(fontSize: 12.sp),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPersonalInfoForm(bool isSmallScreen) {
    final double formWidth = isSmallScreen ? double.infinity : 350.w;
    final fieldWidth = isSmallScreen ? formWidth : 170.w;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20.h),
          Text(
            'Personal Information',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: AppColor.primary,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            'Tell us about yourself',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 20.h),
          GestureDetector(
            onTap: _pickImage,
            child: Center(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColor.primary.withOpacity(0.5),
                        width: 2.w,
                      ),
                    ),
                    child: CircleAvatar(
                      radius: 50.r,
                      backgroundColor: Colors.grey[200],
                      backgroundImage: _avatarImage != null ? FileImage(_avatarImage!) : null,
                      child: _avatarImage == null
                          ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Iconsax.gallery, size: 30.sp, color: Colors.grey[600]),
                          SizedBox(height: 5.h),
                          Text(
                            'Add Photo',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      )
                          : null,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColor.primary,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 5,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(8.r),
                      child: Icon(
                        Iconsax.camera,
                        size: 20.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.h),
          if (isSmallScreen)
            Column(
              children: [
                _buildTextField(
                  controller: _personalInfoControllers['firstName']!,
                  label: 'First Name*',
                  icon: Iconsax.user,
                  width: formWidth,
                  maxLength: _maxNameLength,
                  validator: (value) => value!.trim().isEmpty ? 'Required' : null,
                ),
                _buildTextField(
                  controller: _personalInfoControllers['lastName']!,
                  label: 'Last Name*',
                  icon: Iconsax.profile_2user,
                  width: formWidth,
                  maxLength: _maxNameLength,
                  validator: (value) => value!.trim().isEmpty ? 'Required' : null,
                ),
              ],
            )
          else
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTextField(
                  controller: _personalInfoControllers['firstName']!,
                  label: 'First Name*',
                  icon: Iconsax.user,
                  width: fieldWidth,
                  maxLength: _maxNameLength,
                  validator: (value) => value!.trim().isEmpty ? 'Required' : null,
                ),
                SizedBox(width: 8.w),
                _buildTextField(
                  controller: _personalInfoControllers['lastName']!,
                  label: 'Last Name*',
                  icon: Iconsax.profile_2user,
                  width: fieldWidth,
                  maxLength: _maxNameLength,
                  validator: (value) => value!.trim().isEmpty ? 'Required' : null,
                ),
              ],
            ),
          _buildTextField(
            controller: _personalInfoControllers['email']!,
            label: 'Email*',
            icon: Iconsax.sms,
            width: formWidth,
            maxLength: _maxEmailLength,
            errorText: _emailError,
            validator: (value) {
              if (value!.trim().isEmpty) return 'Required';
              final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
              if (!emailRegExp.hasMatch(value.trim())) return 'Invalid email format';
              return _emailError;
            },
          ),
          _buildTextField(
            controller: _personalInfoControllers['phone']!,
            label: 'Phone Number',
            icon: Iconsax.call,
            width: formWidth,
            maxLength: _maxPhoneLength,
            keyboardType: TextInputType.phone,
            errorText: _phoneError,
            validator: (value) {
              if (value!.trim().isEmpty) return null; // Optional field
              final phoneRegExp = RegExp(r'^\+?[0-9]{10,15}$');
              if (!phoneRegExp.hasMatch(value.trim())) return 'Invalid phone format';
              return _phoneError;
            },
          ),
          _buildTextField(
            controller: _personalInfoControllers['address']!,
            label: 'Address',
            icon: Iconsax.home,
            width: formWidth,
            maxLength: _maxAddressLength,
            keyboardType: TextInputType.multiline,
            maxLines: 2,
          ),
          _buildTextField(
            controller: _personalInfoControllers['nationalId']!,
            label: 'National ID',
            icon: Iconsax.user_tick,
            width: formWidth,
            maxLength: _maxNationalIdLength,
            errorText: _nationalIdError,
            validator: (value) {
              if (value!.trim().isEmpty) return null; // Optional field
              final idRegExp = RegExp(r'^[A-Z0-9]{8,20}$');
              if (!idRegExp.hasMatch(value.trim())) return 'Invalid national ID format';
              return _nationalIdError;
            },
          ),
          InkWell(
            onTap: _selectBirthDate,
            child: Container(
              width: formWidth,
              padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 0),
              child: InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Birth Date',
                  prefixIcon: Icon(Iconsax.calendar),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: AppStyle.borderRadius15,
                    borderSide: BorderSide(color: Colors.black.withOpacity(.2)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: AppStyle.borderRadius15,
                    borderSide: BorderSide(color: Colors.black.withOpacity(.2)),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: AppStyle.borderRadius15,
                    borderSide: BorderSide(color: Colors.black.withOpacity(.2)),
                  ),
                ),
                child: Text(
                  _selectedBirthDate != null
                      ? DateFormat('yyyy-MM-dd').format(_selectedBirthDate!)
                      : 'Select date',
                ),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          if (isSmallScreen)
            Column(
              children: [
                _buildDropdown(
                  label: 'Gender*',
                  value: _selectedGender,
                  width: formWidth,
                  items: const ['Male', 'Female', 'Other'],
                  onChanged: (value) => setState(() => _selectedGender = value),
                ),
                _buildDropdown(
                  label: 'Role*',
                  value: _selectedRole,
                  width: formWidth,
                  items: const ['Student', 'Teacher', 'Employee', 'Admin', 'Other'],
                  onChanged: (value) => setState(() => _selectedRole = value),
                ),
              ],
            )
          else
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildDropdown(
                  label: 'Gender*',
                  value: _selectedGender,
                  width: fieldWidth,
                  items: const ['Male', 'Female', 'Other'],
                  onChanged: (value) => setState(() => _selectedGender = value),
                ),
                SizedBox(width: 8.w),
                _buildDropdown(
                  label: 'Role*',
                  value: _selectedRole,
                  width: fieldWidth,
                  items: const ['Student', 'Teacher', 'Employee', 'Admin', 'Other'],
                  onChanged: (value) => setState(() => _selectedRole = value),
                ),
              ],
            ),
          SizedBox(height: 10.h),
          _buildDropdown(
            label: 'Status',
            value: _selectedStatus,
            width: formWidth,
            items: const ['Active', 'Pending', 'Not Active'],
            onChanged: (value) => setState(() => _selectedStatus = value),
          ),
          SizedBox(height: 20.h),
          Container(
            width: formWidth,
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.amber.withOpacity(0.5), width: 1),
              borderRadius: BorderRadius.circular(10.r),
              color: Colors.amber.withOpacity(0.1),
            ),
            child: Row(
              children: [
                Icon(Icons.info_outline, color: Colors.amber[800], size: 20.sp),
                SizedBox(width: 10.w),
                Expanded(
                  child: Text(
                    '* Required fields must be completed for registration',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.amber[800],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    double? width = 350,
    required IconData icon,
    bool obscureText = false,
    Widget? suffixIcon,
    String? Function(String?)? validator,
    int? maxLength,
    String? errorText,
    TextInputType? keyboardType,
    int? maxLines=1,
  }) {
    return Container(
      width: width?.w,
      padding: EdgeInsets.symmetric(vertical: 8.0.w, horizontal: 0),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        maxLength: maxLength,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          suffixIcon: suffixIcon,
          errorText: errorText,
          enabledBorder: OutlineInputBorder(
            borderRadius: AppStyle.borderRadius15,
            borderSide: BorderSide(color: Colors.black.withOpacity(.2)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: AppStyle.borderRadius15,
            borderSide: BorderSide(color: Colors.black.withOpacity(.2)),
          ),
          border: OutlineInputBorder(
            borderRadius: AppStyle.borderRadius15,
            borderSide: BorderSide(color: Colors.black.withOpacity(.2)),
          ),
        ),
        validator: validator,
      ),
    );
  }

  Widget _buildDropdown({
    required String label,
    required String? value,
    double? width = 170,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      width: width?.w,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: AppStyle.borderRadius15,
            borderSide: BorderSide(color: Colors.black.withOpacity(.2)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: AppStyle.borderRadius15,
            borderSide: BorderSide(color: Colors.black.withOpacity(.2)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: AppStyle.borderRadius15,
            borderSide: BorderSide(color: Colors.black.withOpacity(.2)),
          ),
        ),
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
        validator: (value) => label.endsWith('*') && value == null ? 'Required' : null,
      ),
    );
  }

  Widget _buildNavigationButton(String label, VoidCallback onPressed, {double? width = 400, bool isPrimary = true, bool isLoading = false}) {
    return SizedBox(
      width: width?.w,
      height: 60.h,
      child: MaterialButton(
        onPressed: onPressed,
        color: isPrimary ? AppColor.primary : Colors.grey[300],
        shape: RoundedRectangleBorder(borderRadius: AppStyle.borderRadius15),
        child: isLoading
            ? CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        )
            : Text(
          label,
          style: TextStyle(color: isPrimary ? AppColor.white : Colors.black, fontSize: 16.sp),
        ),
      ),
    );
  }
}