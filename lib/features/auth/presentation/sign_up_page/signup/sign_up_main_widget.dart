import 'package:fitflow/features/auth/auth_sign_up/domain/providers/valid_sign_up_data.dart';
import 'package:fitflow/features/auth/auth_sign_up/presentation/sign_up/sign_up_button.dart';
import 'package:fitflow/features/auth/presentation/sign_up_page/signup/components/about_creating_account_button.dart';
import 'package:fitflow/features/auth/presentation/sign_up_page/signup/components/back_to_auth_button.dart';
import 'package:fitflow/features/auth/presentation/sign_up_page/signup/components/email_imput_widget.dart';
import 'package:fitflow/features/auth/presentation/sign_up_page/signup/components/name_imput_widget.dart';
import 'package:fitflow/features/auth/presentation/sign_up_page/signup/components/password_imput_widget.dart';
import 'package:fitflow/features/auth/presentation/sign_up_page/signup/components/password_repeat_imput_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpMainWidget extends ConsumerStatefulWidget {
  const SignUpMainWidget({super.key});

  @override
  SignUpMainWidgetState createState() => SignUpMainWidgetState();
}

class SignUpMainWidgetState extends ConsumerState<SignUpMainWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordRepeatController = TextEditingController();
  final nameController = TextEditingController();
  IconData iconPassword = Icons.visibility;
  bool obscurePassword = true;

  @override
  void dispose() {
    emailController.clear();
    passwordController.clear();
    passwordRepeatController.clear();
    nameController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final nameImput = ref.watch(nameSignUpProvider.notifier);
    final emailImput = ref.watch(emailSignUpProvider.notifier);
    final isValidEmailProv = ref.watch(isValidEmailSignUpProvider);
    final isValidNameProv = ref.watch(isValidnameSignUpProvider);
    final isValidPasswordProv = ref.watch(isValidpasswordSignUpProvider);
    final isValidPasswordRepeatProv =
        ref.watch(isValidpasswordRepeatSignUpProvider);
    return Stack(
      alignment: Alignment.center,
      fit: StackFit.expand,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            NameSignUpImputWidget(
              nameController: nameController,
              nameInput: nameImput,
              isValidName: isValidNameProv,
              key: const Key('name_imput_sign_up'),
            ),
            EmailSignUpImputWidget(
              emailController: emailController,
              emailImput: emailImput,
              isValidEmail: isValidEmailProv,
              textInputAction: TextInputAction.next,
              key: const Key('email_imput_sign_up'),
            ),
            PasswordSignUpImputWidget(
                passwordController: passwordController,
                isValidPassword: isValidPasswordProv,
                key: const Key('password_imput_sign_up')),
            PasswordSignUpRepeatImputWidget(
              isValidRepeatPassword: isValidPasswordRepeatProv,
              passwordRepeatController: passwordRepeatController,
              key: const Key('password_repeat_imput_sign_up'),
            ),
            const SignUpButton(
              key: Key('confirm_sign_up'),
            ),
          ],
        ),
        const BackToAuthButton(),
        const AboutCreateAccButton()
      ],
    );
  }
}
