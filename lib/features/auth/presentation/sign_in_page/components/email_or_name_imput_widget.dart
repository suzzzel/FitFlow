import 'package:fitflow/features/auth/presentation/general/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmailOrNameImputWidget extends StatelessWidget {
  const EmailOrNameImputWidget({
    super.key,
    required this.emailController,
    required this.emailInput,
  });

  final TextEditingController emailController;
  final StateController<String> emailInput;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 47,
        right: 47,
      ),
      child: CustomTextField(
        controller: emailController,
        obscureText: false,
        onChanged: (value) {
          emailInput.state = value;
          return value;
        },
        isImputRight: true,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.emailAddress,
        labelText: 'Имя пользователя или email',
      ),
    );
  }
}
