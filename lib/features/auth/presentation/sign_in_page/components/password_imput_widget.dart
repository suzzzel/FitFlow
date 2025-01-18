import 'package:fitflow/features/auth/auth_sign_in/domain/providers/auth_sign_in_domain_provider.dart';
import 'package:fitflow/features/auth/auth_sign_in/domain/providers/valid_sign_in_data.dart';
import 'package:fitflow/features/auth/auth_sign_in/presentation/controllers/sign_in_controller.dart';
import 'package:fitflow/features/auth/presentation/general/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PasswordImputWidget extends ConsumerWidget {
  const PasswordImputWidget({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final obscurePassword = ref.watch(obscurePasswordProvider.notifier);
    final passImput = ref.watch(passwordProvider.notifier);
    final isPasswordShown = ref.watch(obscurePasswordProvider);
    final signIn = ref.watch(signInControllerProvider.notifier);
    final firtImput = ref.watch(firstImputProvider.notifier);
    final emailOrName = ref.watch(emailProvider.notifier);
    final isButtonActive = ref.watch(isDataSignInValidProvider.notifier);
    return Padding(
      padding: const EdgeInsets.only(left: 46, right: 47, bottom: 7),
      child: CustomTextField(
        onChanged: (value) {
          passImput.state = value;
          return value;
        },
        textInputAction: TextInputAction.done,
        suffixIcon: IconButton(
            onPressed: () {
              obscurePassword.state = !obscurePassword.state;
            },
            icon: Icon(
              isPasswordShown ? Icons.visibility : Icons.visibility_off,
              color: obscurePassword.state
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.onSurface,
            )),
        onFieldSubmitted: (_) async {
          firtImput.state = true;
          if (isButtonActive.state) {
            final response = await signIn.signIn(
              emailOrName: emailOrName.state,
              password: passImput.state,
            );
            if (!response) {
              isButtonActive.state = false;
              passImput.state = '';
              emailOrName.state = '';
            } else {
              firtImput.state = !response;
            }
          } else {
            firtImput.state = false;
          }
        },
        controller: passwordController,
        obscureText: obscurePassword.state,
        keyboardType: TextInputType.visiblePassword,
        labelText: 'Пароль',
      ),
    );
  }
}
