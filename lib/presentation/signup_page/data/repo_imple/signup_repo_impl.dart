import 'package:ezovian/features/auth/models/user_models.dart';
import 'package:ezovian/presentation/signup_page/data/service/signup_service.dart';
import 'package:ezovian/presentation/signup_page/domain/repo/signup_repo.dart';

class SignupRepoImpl extends SignupRepo {
  @override
  Future<bool> signup(User user) async {
    return await SignupService().signup(user);
  }
}
