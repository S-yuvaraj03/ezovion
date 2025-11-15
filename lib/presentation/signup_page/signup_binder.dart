import 'package:ezovian/core/ulti/enum.dart';
import 'package:ezovian/core/ulti/routes.dart';
import 'package:ezovian/presentation/signup_page/bloc/signup_bloc.dart';
import 'package:flutter/material.dart';

class SignupBinder {
  BuildContext context;
  SignupBinder({required this.context});
  final SignupBloc bloc = SignupBloc();

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void navigateToHome() {
    Navigator.pushReplacementNamed(context, AppRoutes.home);
    variousMessage(message: 'Signup successful', type: SnackBarType.success);
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
}
