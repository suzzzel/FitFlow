import 'package:flutter/material.dart';

ButtonStyle createLevelButtonStyle(
    {required BuildContext context,
    required String level,
    required String tempLevel}) {
  return ButtonStyle(
      elevation: const WidgetStatePropertyAll(0),
      backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
              width: 2,
              color: level == tempLevel
                  ? Theme.of(context).colorScheme.primaryFixed
                  : const Color.fromRGBO(31, 20, 145, 1)))));
}
