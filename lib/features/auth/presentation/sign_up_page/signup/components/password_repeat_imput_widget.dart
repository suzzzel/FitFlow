import 'package:fitflow/features/auth/auth_sign_up/domain/providers/valid_sign_up_data.dart';
import 'package:fitflow/features/auth/presentation/general/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordImputRepeatSignUpWidget extends ConsumerWidget {
  const PasswordImputRepeatSignUpWidget({
    super.key,
    required this.passwordRepeatController,
  });

  final TextEditingController passwordRepeatController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passRepeatImput = ref.watch(passwordRepeatSignUpProvider.notifier);
    return Padding(
      padding: const EdgeInsets.only(left: 46, right: 47, bottom: 7),
      child: CustomTextField(
        onChanged: (value) {
          passRepeatImput.state = value;
          return value;
        },
        textInputAction: TextInputAction.done,
        onFieldSubmitted: (_) async {},
        controller: passwordRepeatController,
        obscureText: true,
        keyboardType: TextInputType.visiblePassword,
        labelText: 'Подтвердите пароль',
      ),
    );
  }
}
