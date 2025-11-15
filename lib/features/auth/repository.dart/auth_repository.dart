import 'dart:async';
import 'package:ezovian/features/auth/models/user_models.dart';
import 'package:ezovian/shared/constants/constants.dart';
import 'package:flutter/foundation.dart';

class AuthRepository {
  Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    if (kDebugMode) {
      return true;
    }
    return email == AppConstants.sampleEmail &&
        password == AppConstants.samplePassword;
  }

  Future<bool> signup(User user) async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }
}
