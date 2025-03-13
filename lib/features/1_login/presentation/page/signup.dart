import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr360/core/presentation/widgets/custom_button.dart' as custom_widget;
import 'package:hr360/core/presentation/widgets/custom_button.dart';
import 'package:hr360/core/utils/constants/colors.dart';
import 'package:hr360/features/1_login/data/models/signup_form_model.dart';
import 'package:hr360/features/1_login/presentation/widgets/personal_info_form.dart';
import 'package:hr360/features/1_login/presentation/widgets/user_credentials_form.dart';
import 'package:hr360/features/1_login/utils/form_validators.dart';
import 'dart:io';

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
  
  // Create form model
  final _formModel = SignUpFormModel();
  
  // Controllers for form fields
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

  @override
  void initState() {
    super.initState();
    _formModel.status = 'Active'; // Set default status
  }

  @override
  void dispose() {
    _pageController.dispose();
    _userCredentialsControllers.forEach((_, controller) => controller.dispose());
    _personalInfoControllers.forEach((_, controller) => controller.dispose());
    super.dispose();
  }

  // Update form model with data from controllers
  void _updateFormModelFromControllers() {
    _formModel.username = _userCredentialsControllers['username']!.text.trim();
    _formModel.password = _userCredentialsControllers['password']!.text;
    _formModel.confirmPassword = _userCredentialsControllers['confirmPassword']!.text;
    
    _formModel.firstName = _personalInfoControllers['firstName']!.text.trim();
    _formModel.lastName = _personalInfoControllers['lastName']!.text.trim();
    _formModel.email = _personalInfoControllers['email']!.text.trim();
    _formModel.phone = _personalInfoControllers['phone']!.text.trim();
    _formModel.address = _personalInfoControllers['address']!.text.trim();
    _formModel.nationalId = _personalInfoControllers['nationalId']!.text.trim();
  }

  Future<void> _signUp() async {
    if (!_validateCurrentPage()) return;
    if (!_signUpFormKey.currentState!.validate()) {
      _showErrorSnackbar('Please fix the errors in the form');
      return;
    }

    setState(() => _isLoading = true);
    try {
      // Update form model with latest values
      _updateFormModelFromControllers();
      
      // Get all form data as a map
      final userData = _formModel.toJson();

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

  bool _validateCurrentPage() {
    _updateFormModelFromControllers();
    
    if (_currentPage == 0) {
      return FormValidators.validateUserCredentialsPage(_formModel);
    } else if (_currentPage == 1) {
      return FormValidators.validatePersonalInfoPage(_formModel);
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
    final isSmallScreen = screenWidth <= 768;
    final formWidth = isSmallScreen ? screenWidth * 0.9 : 768.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              return Form(
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
                          _buildProgressIndicator(),
                          SizedBox(height: 20.h),
                          Expanded(
                            // constraints: BoxConstraints(
                            //   minHeight: 450.h,
                            //   maxHeight: 900.h,
                            // ),
                            child: PageView(
                              controller: _pageController,
                              physics: const NeverScrollableScrollPhysics(),
                              onPageChanged: (page) => setState(() => _currentPage = page),
                              children: [
                                UserCredentialsForm(
                                  formModel: _formModel,
                                  controllers: _userCredentialsControllers,
                                  // isSmallScreen: isSmallScreen,
                                ),
                                PersonalInfoForm(
                                  formModel: _formModel,
                                  controllers: _personalInfoControllers,
                                  isSmallScreen: isSmallScreen,
                                  onImagePicked: (file) => setState(() => _formModel.avatarImage = file),
                                  onBirthDateSelected: (date) => setState(() => _formModel.birthDate = date),
                                  onGenderChanged: (value) => setState(() => _formModel.gender = value),
                                  onRoleChanged: (value) => setState(() => _formModel.role = value),
                                  onStatusChanged: (value) => setState(() => _formModel.status = value),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20.h),
                          _buildNavigationButtons(isSmallScreen, formWidth),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          if (_isLoading) _buildLoadingOverlay(),
        ],
      ),
    );
  }

  Widget _buildProgressIndicator() {
    return Padding(
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
              fontSize: 14.spMin,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigationButtons(bool isSmallScreen, double formWidth) {
    if (isSmallScreen) {
      return Column(
        children: [
          if (_currentPage > 0)
            custom_widget.CustomButton(
              label: 'Back',
              onPressed: _goToPreviousPage,
              width: formWidth,
              isPrimary: false,
            ),
          SizedBox(height: _currentPage > 0 ? 10.h : 0),
          CustomButton(
            label: _currentPage < 1 ? 'Next' : 'Sign Up',
            onPressed: _currentPage < 1 ? _goToNextPage : _signUp,
            width: formWidth,
            isLoading: _isLoading,
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (_currentPage > 0)
            CustomButton(
              label: 'Back',
              onPressed: _goToPreviousPage,
              width: 150.w,
              isPrimary: false,
            ),
          SizedBox(width: _currentPage > 0 ? 10.w : 0),
          CustomButton(
            label: _currentPage < 1 ? 'Next' : 'Sign Up',
            onPressed: _currentPage < 1 ? _goToNextPage : _signUp,
            width: _currentPage > 0 ? 150.w : 300.w,
            isLoading: _isLoading,
          ),
        ],
      );
    }
  }

  Widget _buildLoadingOverlay() {
    return Container(
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
                style: TextStyle(fontSize: 16.spMin, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}