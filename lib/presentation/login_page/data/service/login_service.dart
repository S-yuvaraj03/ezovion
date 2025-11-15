import 'package:ezovian/shared/constants/constants.dart';
import 'package:flutter/foundation.dart';

class LoginService {
  Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    if (kDebugMode) {
      return true;
    }
    return email == AppConstants.sampleEmail &&
        password == AppConstants.samplePassword;
  }
}
