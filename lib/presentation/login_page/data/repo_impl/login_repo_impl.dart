import 'package:ezovian/presentation/login_page/data/service/login_service.dart';
import 'package:ezovian/presentation/login_page/domain/repo/login_repo.dart';

class LoginRepoImpl extends LoginRepo {
  final LoginService loginService = LoginService();
  @override
  Future<bool> login(String email, String password) async {
    return await loginService.login(email, password);
  }
}
