import 'package:ezovian/core/ulti/routes.dart';
import 'package:ezovian/presentation/home_page/bloc/home_bloc.dart';
import 'package:flutter/material.dart';

class HomeBinder {
  BuildContext context;
  HomeBinder({required this.context});
  final HomeBloc bloc = HomeBloc();
  void navigateToLogin() {
    Navigator.pushReplacementNamed(context, AppRoutes.login);
  }
}
