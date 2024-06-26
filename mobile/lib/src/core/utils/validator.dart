import 'package:flutter/material.dart';
import 'package:validation_pro/validate.dart';

class CustomValidator {
  static isNotEmpty(String value) {
    if (value.trim().isEmpty) {
      return 'This field is required';
    }
  }

  static String? validateEmail(String email) {
    if (!Validate.isEmail(email.trim())) {
      return 'Invalid email address';
    }
    return null;
  }
  static String? validateName(String name) {
    if (name.trim().isEmpty || name.split(' ').length < 2) {
      return 'Full name is required';
    }
    return null;
  }
 static String? validatePassword(String password) {
    if (password.trim().isEmpty || password.trim().length < 6) {
      return 'Password length should be greater than 6';
    }

    if (!password.trim().contains(RegExp(r'[a-zA-Z]'))) {
      return 'Password must contain letters';
    }

    if (!password.trim().contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain special characters';
    }
    return null;
  }
  static bool validateForm(GlobalKey<FormState> formKey) {
    final isFormValid = formKey.currentState?.validate();

    if (isFormValid != true) {
      return false;
    }
    formKey.currentState!.save();
    return true;
  }


}
