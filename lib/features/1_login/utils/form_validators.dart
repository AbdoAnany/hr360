import '../data/models/signup_form_model.dart';

class FormValidators {
  static String? validateUsername(String? value) {
    if (value == null || value.trim().isEmpty) return 'Username is required';
    if (value.trim().length < 3) return 'Username must be at least 3 characters';
    // Example of checking for existing username
    if (value.toLowerCase() == 'admin') return 'Username already taken';
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    if (value.length < 8) return 'Password must be at least 8 characters';
    if (!RegExp(r'\d').hasMatch(value)) return 'Password must contain at least one number';
    return null;
  }

  static String? validateConfirmPassword(String? value, String password) {
    if (value == null || value.isEmpty) return 'Please confirm your password';
    if (value != password) return 'Passwords do not match';
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) return 'Email is required';
    final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegExp.hasMatch(value.trim())) return 'Invalid email format';
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) return null; // Optional field
    final phoneRegExp = RegExp(r'^\+?[0-9]{10,15}$');
    if (!phoneRegExp.hasMatch(value.trim())) return 'Invalid phone format';
    return null;
  }

  static String? validateNationalId(String? value) {
    if (value == null || value.trim().isEmpty) return null; // Optional field
    final idRegExp = RegExp(r'^[A-Z0-9]{8,20}$');
    if (!idRegExp.hasMatch(value.trim())) return 'Invalid national ID format';
    return null;
  }

  static String? validateRequired(String? value, String fieldName) {
    return (value == null || value.trim().isEmpty) ? '$fieldName is required' : null;
  }

  static bool validateUserCredentialsPage(SignUpFormModel model) {
    final usernameError = validateUsername(model.username);
    final passwordError = validatePassword(model.password);
    final confirmPasswordError = validateConfirmPassword(model.confirmPassword, model.password);
    
    return usernameError == null && passwordError == null && confirmPasswordError == null;
  }

  static bool validatePersonalInfoPage(SignUpFormModel model) {
    final firstNameError = validateRequired(model.firstName, 'First name');
    final lastNameError = validateRequired(model.lastName, 'Last name');
    final emailError = validateEmail(model.email);
    final phoneError = validatePhone(model.phone);
    final nationalIdError = validateNationalId(model.nationalId);

    return firstNameError == null && 
           lastNameError == null && 
           emailError == null && 
           phoneError == null && 
           nationalIdError == null && 
           model.gender != null && 
           model.role != null;
  }
}
