import 'package:fitflow/features/auth/auth_sign_up/domain/providers/valid_sign_up_data.dart';
import 'package:fitflow/features/auth/presentation/general/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordSignUpRepeatImputWidget extends ConsumerStatefulWidget {
  const PasswordSignUpRepeatImputWidget(
      {super.key,
      required this.isValidRepeatPassword,
      required this.passwordRepeatController});

  final TextEditingController passwordRepeatController;
  final bool isValidRepeatPassword;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PasswordSignUpRepeatImputWidgetState();
}

class _PasswordSignUpRepeatImputWidgetState
    extends ConsumerState<PasswordSignUpRepeatImputWidget> {
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
        if (!widget.isValidRepeatPassword) {
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
    final passRepeatImput = ref.watch(passwordRepeatSignUpProvider.notifier);
    return Padding(
      padding: const EdgeInsets.only(
        left: 47,
        right: 47,
      ),
      child: Stack(
        children: [
          CustomTextField(
            onChanged: (value) {
              passRepeatImput.state = value;
              return value;
            },
            isImputRight: isImputRight,
            focusNode: focusNode,
            textInputAction: TextInputAction.done,
            controller: widget.passwordRepeatController,
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            labelText: 'Подтвердите пароль',
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
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              bottom: 10,
                            ),
                            child: SizedBox(
                              width: 73,
                              height:
                                  MediaQuery.of(context).size.height * 0.0285,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'Пароль не\nсовпадает',
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
