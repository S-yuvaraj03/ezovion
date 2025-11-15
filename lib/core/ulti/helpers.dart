import 'package:flutter/material.dart';

void showInlineMessage(ValueNotifier<String?> notifier, String msg) {
  notifier.value = msg;
}
