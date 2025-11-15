import 'package:ezovian/core/ulti/enum.dart';
import 'package:ezovian/core/ulti/routes.dart';
import 'package:ezovian/core/ulti/validators.dart';
import 'package:ezovian/presentation/login_page/bloc/login_bloc.dart';
import 'package:ezovian/presentation/login_page/login_binder.dart';
import 'package:ezovian/shared/constants/constants.dart';
import 'package:ezovian/shared/widget/custom_button.dart';
import 'package:ezovian/shared/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginBinder? binder;

  @override
  void initState() {
    binder = LoginBinder(context: context);
    super.initState();
  }

  @override
  void dispose() {
    binder?.disposeBloc();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.loginTitle),
        automaticallyImplyLeading: false,
      ),
      body: BlocConsumer<LoginBloc, LoginState>(
        bloc: binder?.bloc,
        listener: (context, state) {
          if (state is LoginSuccess) {
            binder?.navigateToHome();
          } else if (state is LoginError) {
            binder?.variousMessage(
              message: state.error,
              type: SnackBarType.error,
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(AppConstants.defaultPadding),
            child: Form(
              key: binder?.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(
                    label: AppConstants.emailLabel,
                    controller:
                        binder?.emailController ?? TextEditingController(),
                    validator: validateEmail,
                  ),
                  const SizedBox(height: AppConstants.defaultHeight),
                  CustomTextField(
                    label: AppConstants.passwordLabel,
                    controller:
                        binder?.passwordController ?? TextEditingController(),
                    obscureText: true,
                    validator: validatePassword,
                  ),
                  const SizedBox(height: AppConstants.defaultHeight),
                  const SizedBox(height: AppConstants.defaultHeight),
                  CustomButton(
                    title: AppConstants.loginButton,
                    onPressed: () {
                      if (binder?.formKey.currentState!.validate() ?? false) {
                        binder?.bloc.add(
                          ProceedToLoginEvent(
                            binder?.emailController.text.trim() ?? '',
                            binder?.passwordController.text.trim() ?? '',
                          ),
                        );
                      }
                    },
                  ),
                  TextButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.signup),
                    child: const Text(AppConstants.noAccountText),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
