import 'package:ezovian/features/auth/models/user_models.dart';
import 'package:ezovian/presentation/signup_page/data/repo_imple/signup_repo_impl.dart';
import 'package:ezovian/presentation/signup_page/domain/repo/signup_repo.dart';

class SignupUsecase {
  final SignupRepo signupRepository = SignupRepoImpl();
  Future<bool> call(User user) async {
    return await signupRepository.signup(user);
  }
}
