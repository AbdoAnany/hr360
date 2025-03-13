import 'dart:io';

class SignUpFormModel {
  // User credentials
  String username = '';
  String password = '';
  String confirmPassword = '';

  // Personal information
  String firstName = '';
  String lastName = '';
  String email = '';
  String phone = '';
  String address = '';
  String nationalId = '';
  DateTime? birthDate;
  String? gender;
  String? role;
  String? status = 'Active';
  File? avatarImage;

  // Field limits
  static const int maxUsernameLength = 30;
  static const int maxNameLength = 50;
  static const int maxEmailLength = 100;
  static const int maxPhoneLength = 15;
  static const int maxAddressLength = 200;
  static const int maxNationalIdLength = 20;

  // Form validation errors
  String? usernameError;
  String? emailError;
  String? phoneError;
  String? nationalIdError;

  // Convert form data to a map for API requests
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'phone': phone,
      'address': address,
      'nationalId': nationalId,
      'gender': gender,
      'role': role,
      'status': status,
      'birthDate': birthDate != null ? _formatDate(birthDate!) : null,
      'avatarPath': avatarImage?.path,
    };
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }
}
