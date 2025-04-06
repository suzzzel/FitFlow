import 'package:fitflow/features/auth/presentation/general/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class NameSignUpImputWidget extends StatefulWidget {
  const NameSignUpImputWidget(
      {super.key,
      required this.nameController,
      required this.nameInput,
      required this.isValidName});

  final TextEditingController nameController;
  final StateController<String> nameInput;
  final bool isValidName;

  @override
  State<NameSignUpImputWidget> createState() => _NameSignUpImputWidgetState();
}

class _NameSignUpImputWidgetState extends State<NameSignUpImputWidget> {
  bool isImputRight = true;
  FocusNode focusNodeName = FocusNode();

  @override
  void initState() {
    super.initState();
    focusNodeName.addListener(() {
      check();
    });
  }

  @override
  void dispose() {
    focusNodeName.removeListener(() {});
    super.dispose();
  }

  void check() {
    setState(() {
      if (!focusNodeName.hasFocus) {
        if (!widget.isValidName) {
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
        left: 47,
        right: 47,
      ),
      child: Stack(
        children: [
          CustomTextField(
            controller: widget.nameController,
            obscureText: false,
            onChanged: (value) {
              widget.nameInput.state = value;
              return value;
            },
            isImputRight: isImputRight,
            focusNode: focusNodeName,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.name,
            labelText: 'Имя пользователя',
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
                                  'Менее 3-х\nсимоволов',
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
