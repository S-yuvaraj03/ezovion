import 'package:ezovian/presentation/home_page/home_binder.dart';
import 'package:ezovian/shared/constants/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeBinder binder = HomeBinder(context: context);
    final email = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.home),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${AppConstants.welcome}, $email',
                style: const TextStyle(fontSize: AppConstants.textLabelHeight),
              ),
              const SizedBox(height: AppConstants.defaultHeight),
              ElevatedButton(
                onPressed: () {
                  binder.navigateToLogin();
                },
                child: const Text(AppConstants.logout),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
