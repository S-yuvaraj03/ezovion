import 'package:ezovian/core/ulti/enum.dart';
import 'package:ezovian/features/auth/bloc/auth_bloc.dart';
import 'package:ezovian/features/auth/models/user_models.dart';
import 'package:ezovian/core/ulti/routes.dart';
import 'package:ezovian/presentation/signup_page/bloc/signup_bloc.dart';
import 'package:ezovian/presentation/signup_page/signup_binder.dart';
import 'package:ezovian/shared/constants/constants.dart';
import 'package:ezovian/shared/widget/custom_button.dart';
import 'package:ezovian/shared/widget/custom_textfield.dart';
import 'package:ezovian/shared/widget/loader_widget.dart';
import 'package:ezovian/core/ulti/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SignupBinder binder = SignupBinder(context: context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.signupTitle),
        automaticallyImplyLeading: false,
      ),
      body: BlocConsumer<SignupBloc, SignupState>(
        bloc: binder.bloc,
        listener: (context, state) {
          if (state is SignupSuccess) {
            binder.navigateToHome();
          }
          if (state is SignupError) {
            binder.variousMessage(
              message: state.error,
              type: SnackBarType.error,
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) return const LoaderWidget();
          return Padding(
            padding: const EdgeInsets.all(AppConstants.defaultPadding),
            child: Form(
              key: binder.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomTextField(
                    label: AppConstants.nameLabel,
                    controller: binder.nameController,
                    validator: validateName,
                  ),
                  const SizedBox(height: AppConstants.defaultHeight),
                  CustomTextField(
                    label: AppConstants.emailLabel,
                    controller: binder.emailController,
                    validator: validateEmail,
                  ),
                  const SizedBox(height: AppConstants.defaultHeight),
                  CustomTextField(
                    label: AppConstants.passwordLabel,
                    controller: binder.passwordController,
                    obscureText: true,
                    validator: validatePassword,
                  ),
                  const SizedBox(height: AppConstants.defaultHeight),
                  CustomTextField(
                    label: AppConstants.confirmPasswordLabel,
                    controller: binder.confirmPasswordController,
                    obscureText: true,
                    validator: (v) => validateConfirmPassword(
                      binder.passwordController.text,
                      v,
                    ),
                  ),
                  const SizedBox(height: AppConstants.defaultHeight),
                  CustomButton(
                    title: AppConstants.signupButton,
                    onPressed: () {
                      if (binder.formKey.currentState!.validate()) {
                        binder.bloc.add(
                          ProceedToSignupEvent(
                            User(
                              name: binder.nameController.text,
                              email: binder.emailController.text,
                              password: binder.passwordController.text,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  TextButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.login),
                    child: const Text(AppConstants.haveAccountText),
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
