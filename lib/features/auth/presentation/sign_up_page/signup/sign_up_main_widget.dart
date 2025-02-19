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
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.pop();
              emailImput.state = '';
              nameImput.state = '';
              ref.read(passwordSignUpProvider.notifier).state = '';
              ref.read(passwordRepeatSignUpProvider.notifier).state = '';
            },
            icon: Image.asset('assets/leading/arrow.png')),
        centerTitle: true,
        title: FittedBox(
          child: Text(
            'Создание аккаунта',
            style: GoogleFonts.inter(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 24,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: Stack(
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
              ),
              EmailSignUpImputWidget(
                emailController: emailController,
                emailImput: emailImput,
                isValidEmail: isValidEmailProv,
                textInputAction: TextInputAction.next,
              ),
              PasswordSignUpImputWidget(
                  passwordController: passwordController,
                  isValidPassword: isValidPasswordProv),
              PasswordSignUpRepeatImputWidget(
                  isValidRepeatPassword: isValidPasswordRepeatProv,
                  passwordRepeatController: passwordRepeatController),
              const SignUpButton(),
            ],
          ),
          const BackToAuthButton(),
          const AboutCreateAccButton()
        ],
      ),
    );
  }
}
