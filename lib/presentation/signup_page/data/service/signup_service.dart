import 'package:ezovian/features/auth/models/user_models.dart';
import 'package:flutter/foundation.dart';

class SignupService {
  Future<bool> signup(User user) async {
    if (kDebugMode) {
      return true;
    }
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }
}
