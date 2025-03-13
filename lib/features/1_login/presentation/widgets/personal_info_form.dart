import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hr360/core/presentation/widgets/custom_dropdown.dart';
import 'package:hr360/core/presentation/widgets/custom_text_field.dart';
import 'package:hr360/core/utils/constants/colors.dart';
import 'package:hr360/features/1_login/data/models/signup_form_model.dart';
import 'package:hr360/features/1_login/utils/form_validators.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class PersonalInfoForm extends StatefulWidget {
  final SignUpFormModel formModel;
  final Map<String, TextEditingController> controllers;
  final bool isSmallScreen;
  final Function(File) onImagePicked;
  final Function(DateTime) onBirthDateSelected;
  final Function(String?) onGenderChanged;
  final Function(String?) onRoleChanged;
  final Function(String?) onStatusChanged;

  const PersonalInfoForm({
    Key? key,
    required this.formModel,
    required this.controllers,
    required this.isSmallScreen,
    required this.onImagePicked,
    required this.onBirthDateSelected,
    required this.onGenderChanged,
    required this.onRoleChanged,
    required this.onStatusChanged,
  }) : super(key: key);

  @override
  State<PersonalInfoForm> createState() => _PersonalInfoFormState();
}

class _PersonalInfoFormState extends State<PersonalInfoForm> {
  final _imagePicker = ImagePicker();

  Future<void> _pickImage() async {
    try {
      final pickedFile = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 600,
        maxHeight: 600,
        imageQuality: 80,
      );
      if (pickedFile != null) {
        widget.onImagePicked(File(pickedFile.path));
      }
    } catch (e) {
      _showErrorSnackbar('Failed to pick image: ${e.toString()}');
    }
  }

  void _showErrorSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  Future<void> _selectBirthDate() async {
    try {
      final initialDate = widget.formModel.birthDate ??
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
      if (picked != null && picked != widget.formModel.birthDate) {
        widget.onBirthDateSelected(picked);
      }
    } catch (e) {
      _showErrorSnackbar('Failed to open date picker: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final double formWidth = widget.isSmallScreen ? double.infinity : 350.w;
    final fieldWidth = widget.isSmallScreen ? formWidth : 170.w;

    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20.h),
            Text(
              'Personal Information',
              style: TextStyle(
                fontSize: 24.spMin,
                fontWeight: FontWeight.bold,
                color: AppColor.primary,
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              'Tell us about yourself',
              style: TextStyle(
                fontSize: 14.spMin,
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
                        backgroundImage: widget.formModel.avatarImage != null 
                            ? FileImage(widget.formModel.avatarImage!) 
                            : null,
                        child: widget.formModel.avatarImage == null
                            ? Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Iconsax.gallery, size: 30.spMin, color: Colors.grey[600]),
                                  SizedBox(height: 5.h),
                                  Text(
                                    'Add Photo',
                                    style: TextStyle(
                                      fontSize: 12.spMin,
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
                          size: 20.spMin,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            _buildNameFields(fieldWidth, formWidth),
            CustomTextField(
              controller: widget.controllers['email']!,
              label: 'Email*',
              prefixIcon: Iconsax.sms,
              width: formWidth,
              maxLength: SignUpFormModel.maxEmailLength,
              errorText: widget.formModel.emailError,
              validator: FormValidators.validateEmail,
            ),
            CustomTextField(
              controller: widget.controllers['phone']!,
              label: 'Phone Number',
              prefixIcon: Iconsax.call,
              width: formWidth,
              maxLength: SignUpFormModel.maxPhoneLength,
              keyboardType: TextInputType.phone,
              errorText: widget.formModel.phoneError,
              validator: FormValidators.validatePhone,
            ),
            CustomTextField(
              controller: widget.controllers['address']!,
              label: 'Address',
              prefixIcon: Iconsax.home,
              width: formWidth,
              maxLength: SignUpFormModel.maxAddressLength,
              keyboardType: TextInputType.multiline,
              maxLines: 2,
            ),
            CustomTextField(
              controller: widget.controllers['nationalId']!,
              label: 'National ID',
              prefixIcon: Iconsax.user_tick,
              width: formWidth,
              maxLength: SignUpFormModel.maxNationalIdLength,
              errorText: widget.formModel.nationalIdError,
              validator: FormValidators.validateNationalId,
            ),
            _buildBirthDatePicker(formWidth),
            SizedBox(height: 10.h),
            _buildDropdowns(fieldWidth, formWidth),
            SizedBox(height: 20.h),
            _buildRequiredFieldsNote(formWidth),
          ],
        ),
      ),
    );
  }

  Widget _buildNameFields(double fieldWidth, double formWidth) {
    if (widget.isSmallScreen) {
      return Column(
        children: [
          CustomTextField(
            controller: widget.controllers['firstName']!,
            label: 'First Name*',
            prefixIcon: Iconsax.user,
            width: formWidth,
            maxLength: SignUpFormModel.maxNameLength,
            validator: (value) => FormValidators.validateRequired(value, 'First name'),
          ),
          CustomTextField(
            controller: widget.controllers['lastName']!,
            label: 'Last Name*',
            prefixIcon: Iconsax.profile_2user,
            width: formWidth,
            maxLength: SignUpFormModel.maxNameLength,
            validator: (value) => FormValidators.validateRequired(value, 'Last name'),
          ),
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(
            controller: widget.controllers['firstName']!,
            label: 'First Name*',
            prefixIcon: Iconsax.user,
            width: fieldWidth,
            maxLength: SignUpFormModel.maxNameLength,
            validator: (value) => FormValidators.validateRequired(value, 'First name'),
          ),
          SizedBox(width: 8.w),
          CustomTextField(
            controller: widget.controllers['lastName']!,
            label: 'Last Name*',
            prefixIcon: Iconsax.profile_2user,
            width: fieldWidth,
            maxLength: SignUpFormModel.maxNameLength,
            validator: (value) => FormValidators.validateRequired(value, 'Last name'),
          ),
        ],
      );
    }
  }

  Widget _buildBirthDatePicker(double formWidth) {
    return InkWell(
      onTap: _selectBirthDate,
      child: Container(
        width: formWidth,
        padding: EdgeInsets.symmetric(vertical: 8.0.h, horizontal: 0),
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: 'Birth Date',
            prefixIcon: Icon(Iconsax.calendar),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide(color: Colors.black.withOpacity(.2)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide(color: Colors.black.withOpacity(.2)),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.r),
              borderSide: BorderSide(color: Colors.black.withOpacity(.2)),
            ),
          ),
          child: Text(
            widget.formModel.birthDate != null
                ? DateFormat('yyyy-MM-dd').format(widget.formModel.birthDate!)
                : 'Select date',
          ),
        ),
      ),
    );
  }

  Widget _buildDropdowns(double fieldWidth, double formWidth) {
    if (widget.isSmallScreen) {
      return Column(
        children: [
          CustomDropdown(
            label: 'Gender*',
            value: widget.formModel.gender,
            width: formWidth,
            items: const ['Male', 'Female', 'Other'],
            onChanged: widget.onGenderChanged,
          ),
          CustomDropdown(
            label: 'Role*',
            value: widget.formModel.role,
            width: formWidth,
            items: const ['Student', 'Teacher', 'Employee', 'Admin', 'Other'],
            onChanged: widget.onRoleChanged,
          ),
          CustomDropdown(
            label: 'Status',
            value: widget.formModel.status,
            width: formWidth,
            items: const ['Active', 'Pending', 'Not Active'],
            onChanged: widget.onStatusChanged,
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomDropdown(
                label: 'Gender*',
                value: widget.formModel.gender,
                width: fieldWidth,
                items: const ['Male', 'Female', 'Other'],
                onChanged: widget.onGenderChanged,
              ),
              SizedBox(width: 8.w),
              CustomDropdown(
                label: 'Role*',
                value: widget.formModel.role,
                width: fieldWidth,
                items: const ['Student', 'Teacher', 'Employee', 'Admin', 'Other'],
                onChanged: widget.onRoleChanged,
              ),
            ],
          ),
          SizedBox(height: 10.h),
          CustomDropdown(
            label: 'Status',
            value: widget.formModel.status,
            width: formWidth,
            items: const ['Active', 'Pending', 'Not Active'],
            onChanged: widget.onStatusChanged,
          ),
        ],
      );
    }
  }

  Widget _buildRequiredFieldsNote(double formWidth) {
    return Container(
      width: formWidth,
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.amber.withOpacity(0.5), width: 1),
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.amber.withOpacity(0.1),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline, color: Colors.amber[800], size: 20.spMin),
          SizedBox(width: 10.w),
          Expanded(
            child: Text(
              '* Required fields must be completed for registration',
              style: TextStyle(
                fontSize: 12.spMin,
                color: Colors.amber[800],
              ),
            ),
          ),
        ],
      ),
    );
  }
}