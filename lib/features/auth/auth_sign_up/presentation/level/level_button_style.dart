import 'package:flutter/material.dart';

ButtonStyle createLevelButtonStyle(
    {required BuildContext context,
    required String level,
    required String tempLevel}) {
  return ButtonStyle(
      elevation: const WidgetStatePropertyAll(0),
      backgroundColor:
          WidgetStatePropertyAll(Theme.of(context).colorScheme.surface),
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
              width: 2,
              color: level == tempLevel
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.tertiary.withOpacity(1)))));
}
