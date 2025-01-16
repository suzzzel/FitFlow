import 'package:fitflow/features/auth/presentation/general/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmailImputWidget extends StatelessWidget {
  const EmailImputWidget({
    super.key,
    required this.emailController,
    required this.emailInput,
  });

  final TextEditingController emailController;
  final StateController<String> emailInput;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 46, right: 47, bottom: 8),
      child: CustomTextField(
        controller: emailController,
        obscureText: false,
        onChanged: (value) {
          emailInput.state = value;
          return value;
        },
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        labelText: 'Имя пользователя или email',
      ),
    );
  }
}
