import 'dart:developer';

import 'package:fitflow/features/auth/auth_reset_password/domain/providers/auth_reset_pass_domain_provider.dart';
import 'package:fitflow/features/auth/auth_reset_password/domain/providers/valid_new_pass.dart';
import 'package:fitflow/features/auth/auth_reset_password/domain/providers/valid_otp_code.dart';
import 'package:fitflow/features/auth/presentation/general/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdatePasswordMainWidget extends ConsumerStatefulWidget {
  final String email;
  const UpdatePasswordMainWidget({super.key, required this.email});

  @override
  UpdatePasswordMainWidgetState createState() =>
      UpdatePasswordMainWidgetState();
}

class UpdatePasswordMainWidgetState
    extends ConsumerState<UpdatePasswordMainWidget> {
  final otpController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final otpImput = ref.watch(otpResetPasswordProvider.notifier);
    final otpValid = ref.watch(isValidOTPResetPasswordProvider);
    final passImput = ref.watch(newPasswordResetPasswordProvider.notifier);
    final passValid = ref.watch(isValidNewPasswordResetPasswordProvider);
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.pop();
              otpImput.state = '';
            },
            icon: Image.asset('assets/leading/arrow.png')),
        centerTitle: true,
        title: FittedBox(
          child: Text(
            'Введите код подтверждения',
            style: GoogleFonts.inter(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 24,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          // const Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Padding(
          //     padding: EdgeInsets.only(bottom: 35),
          //     child: NextStepAfterSendRecoveryCodeButton(),
          //   ),
          // ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomTextField(
                controller: otpController,
                labelText: 'otp',
                obscureText: false,
                keyboardType: TextInputType.number,
                isImputRight: otpValid,
                onChanged: (value) {
                  otpImput.state = otpController.text;
                },
              ),
              CustomTextField(
                controller: passwordController,
                labelText: 'newPass',
                obscureText: obscurePassword,
                keyboardType: TextInputType.text,
                isImputRight: passValid,
                onChanged: (value) {
                  passImput.state = passwordController.text;
                },
              ),
              ElevatedButton(
                  onPressed: otpValid && passValid
                      ? () {
                          ref
                              .read(authResetPasswordDomainProvider)
                              .updatePassword(
                                  email: widget.email,
                                  recoveryCode: otpImput.state,
                                  newPassword: passImput.state);
                        }
                      : () {
                          log('loshara');
                        },
                  child: Text('change'))
            ],
          ),
        ],
      ),
    );
  }
}
