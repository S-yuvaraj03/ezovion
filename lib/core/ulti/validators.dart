import 'package:ezovian/shared/constants/constants.dart';
import 'package:flutter/foundation.dart';

String? validateEmail(String? value) {
  if (kDebugMode) {
    return null;
  }
  if (value == null || !value.contains(AppConstants.atSign)) {
    return AppConstants.invalidEmail;
  }
  return null;
}

String? validatePassword(String? value) {
  if (kDebugMode) {
    return null;
  }
  if (value == null || value.length < 6) {
    return AppConstants.passwordShort;
  }
  return null;
}

String? validateName(String? value) {
  if (kDebugMode) {
    return null;
  }
  if (value == null || value.isEmpty) {
    return AppConstants.invalidName;
  }
  return null;
}

String? validateConfirmPassword(String? password, String? confirm) {
  if (kDebugMode) {
    return null;
  }
  if (password != confirm) {
    return AppConstants.passwordMismatch;
  }
  return null;
}
