import 'package:ezovian/core/ulti/enum.dart';
import 'package:ezovian/core/ulti/routes.dart';
import 'package:ezovian/presentation/login_page/bloc/login_bloc.dart';
import 'package:flutter/material.dart';

class LoginBinder {
  BuildContext context;
  LoginBinder({required this.context});
  final LoginBloc bloc = LoginBloc();

  //___

  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void navigateToHome() {
    Navigator.pushReplacementNamed(
      context,
      AppRoutes.home,
      arguments: emailController.text,
    );
    variousMessage(message: 'Login successful', type: SnackBarType.success);
  }

  void variousMessage({required String message, required SnackBarType type}) {
    switch (type) {
      case SnackBarType.success:
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(message)));
        break;
      case SnackBarType.error:
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(message)));
        break;
    }
  }

  void disposeBloc() {
    bloc.close();
  }
}
