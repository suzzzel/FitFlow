import 'package:fitflow/features/auth/auth_sign_in/domain/providers/auth_sign_in_domain_provider.dart';
import 'package:fitflow/features/auth/auth_sign_up/domain/providers/valid_sign_up_data.dart';
import 'package:fitflow/features/auth/presentation/general/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordSignUpImputWidget extends ConsumerStatefulWidget {
  const PasswordSignUpImputWidget(
      {super.key,
      required this.passwordController,
      required this.isValidPassword});

  final TextEditingController passwordController;
  final bool isValidPassword;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PasswordSignUpImputWidgetState();
}

class _PasswordSignUpImputWidgetState
    extends ConsumerState<PasswordSignUpImputWidget> {
  bool isImputRight = true;
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      check();
    });
  }

  @override
  void dispose() {
    focusNode.removeListener(() {});
    super.dispose();
  }

  void check() {
    setState(() {
      if (!focusNode.hasFocus) {
        if (!widget.isValidPassword) {
          isImputRight = false;
        } else {
          isImputRight = true;
        }
      } else {
        isImputRight = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final obscurePassword = ref.watch(obscurePasswordProvider.notifier);
    final passImput = ref.watch(passwordSignUpProvider.notifier);
    final isPasswordShown = ref.watch(obscurePasswordProvider);
    return Padding(
      padding: const EdgeInsets.only(
        left: 46,
        right: 47,
      ),
      child: Stack(
        children: [
          CustomTextField(
            onChanged: (value) {
              passImput.state = value;
              return value;
            },
            isImputRight: isImputRight,
            textInputAction: TextInputAction.done,
            focusNode: focusNode,
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
            controller: widget.passwordController,
            obscureText: obscurePassword.state,
            keyboardType: TextInputType.visiblePassword,
            labelText: 'Пароль',
          ),
          !isImputRight
              ? Align(
                  alignment: const Alignment(1, 0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 29),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).canvasColor,
                        border: Border.all(width: 2, color: Colors.red),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Spacer(),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 10,
                              bottom: 10,
                            ),
                            child: SizedBox(
                              width: 73,
                              height:
                                  MediaQuery.of(context).size.height * 0.028,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'Менее 6-ти\nсимволов',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.inter(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 6,
                            ),
                            child: Image.asset(
                              'assets/auth/warning.png',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
