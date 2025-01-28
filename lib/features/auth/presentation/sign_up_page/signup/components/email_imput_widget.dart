// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitflow/features/auth/presentation/general/custom_text_field.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailSignUpImputWidget extends StatefulWidget {
  const EmailSignUpImputWidget({
    super.key,
    required this.emailController,
    required this.emailImput,
    required this.isValidEmail,
  });

  final TextEditingController emailController;
  final StateController<String> emailImput;
  final bool isValidEmail;

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
      padding: const EdgeInsets.only(left: 46, right: 47, bottom: 8),
      child: Stack(
        children: [
          CustomTextField(
            controller: widget.emailController,
            obscureText: false,
            onChanged: (value) {
              widget.emailImput.state = value;
              return value;
            },
            focusNode: focusNode,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.emailAddress,
            labelText: 'Email',
          ),
          !isImputRight
              ? Align(
                  alignment: const Alignment(1, 0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 31),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 6, top: 4, bottom: 4),
                            child: SizedBox(
                              width: 73,
                              height: 30,
                              child: FittedBox(
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
                          SizedBox(
                            width: 38,
                            height: 38,
                            child: FittedBox(
                              child: Icon(
                                Icons.error_outline,
                                color: Colors.red,
                              ),
                            ),
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).canvasColor,
                        border: Border.all(width: 2, color: Colors.red),
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
