import 'package:ezovian/features/auth/models/user_models.dart';

abstract class SignupRepo {
  Future<bool> signup(User user);
}
