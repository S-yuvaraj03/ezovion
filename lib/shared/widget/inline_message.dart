import 'package:flutter/material.dart';

class InlineMessageWidget extends StatelessWidget {
  final String message;
  final bool isError;

  const InlineMessageWidget({
    super.key,
    required this.message,
    this.isError = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Text(
        message,
        style: TextStyle(
          fontSize: 13,
          color: isError ? Colors.red : const Color(0xFF0A73FF),
        ),
      ),
    );
  }
}
