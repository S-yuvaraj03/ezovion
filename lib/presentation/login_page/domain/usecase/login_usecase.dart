import 'package:ezovian/core/usecase/usecase.dart';
import 'package:ezovian/presentation/login_page/data/repo_impl/login_repo_impl.dart';
import 'package:ezovian/presentation/login_page/domain/repo/login_repo.dart';

class LoginUsecase extends Usecase {
  final LoginRepo loginRepo = LoginRepoImpl();
  Future<bool> call(String email, String password) async {
    return await loginRepo.login(email, password);
  }
}
