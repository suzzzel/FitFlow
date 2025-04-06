import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitflow/features/auth/presentation/general/custom_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailSignUpImputWidget extends StatefulWidget {
  const EmailSignUpImputWidget(
      {super.key,
      required this.emailController,
      required this.emailImput,
      required this.isValidEmail,
      required this.textInputAction});

  final TextEditingController emailController;
  final StateController<String> emailImput;
  final bool isValidEmail;
  final TextInputAction textInputAction;

  @override
  State<EmailSignUpImputWidget> createState() => _EmailSignUpImputWidgetState();
}

class _EmailSignUpImputWidgetState extends State<EmailSignUpImputWidget> {
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
        if (!widget.isValidEmail) {
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
    return Padding(
      padding: const EdgeInsets.only(
        left: 46,
        right: 47,
      ),
      child: Stack(
        children: [
          CustomTextField(
            controller: widget.emailController,
            obscureText: false,
            onChanged: (value) {
              widget.emailImput.state = value;
              return value;
            },
            isImputRight: isImputRight,
            focusNode: focusNode,
            textInputAction: widget.textInputAction,
            keyboardType: TextInputType.emailAddress,
            labelText: 'Email',
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
                                  MediaQuery.of(context).size.height * 0.028,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  'Некорретный\nEmail',
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
