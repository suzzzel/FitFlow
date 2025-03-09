import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final String labelText;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final VoidCallback? onTap;
  final Widget? prefixIcon;
  final bool isImputRight;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final String? errorMsg;
  final String? Function(String)? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final Function(PointerDownEvent)? onTepOutside;
  final TextInputAction? textInputAction;

  const CustomTextField({
    super.key,
    required this.controller,
    this.hintText,
    required this.labelText,
    required this.obscureText,
    required this.keyboardType,
    this.suffixIcon,
    this.onTap,
    required this.isImputRight,
    this.textInputAction,
    this.prefixIcon,
    this.validator,
    this.focusNode,
    this.errorMsg,
    this.onChanged,
    this.onFieldSubmitted,
    this.onTepOutside,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).size.height * 0.008),
          child: FittedBox(
            child: ShaderMask(
              blendMode: BlendMode.srcATop,
              shaderCallback: (bounds) => const LinearGradient(colors: [
                Color.fromRGBO(204, 143, 237, 1),
                Color.fromRGBO(107, 80, 246, 1),
              ]).createShader(bounds),
              child: Text(
                labelText,
                textScaler: const TextScaler.linear(1),
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.07,
          child: Stack(
            children: [
              SizedBox(
                height: 50,
                child: TextFormField(
                  obscuringCharacter: '*',
                  validator: validator,
                  controller: controller,
                  obscureText: obscureText,
                  keyboardType: keyboardType,
                  focusNode: focusNode,
                  onTap: onTap,
                  onTapOutside: onTepOutside,
                  onFieldSubmitted: onFieldSubmitted,
                  textInputAction: textInputAction,
                  onChanged: onChanged,
                  style: GoogleFonts.inter(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(left: 17, right: 17),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      suffixIcon: suffixIcon,
                      prefixIcon: prefixIcon,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            width: 2,
                            color: isImputRight
                                ? Theme.of(context).colorScheme.secondary
                                : Colors.red),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            width: 2,
                            color: isImputRight
                                ? Theme.of(context).colorScheme.secondary
                                : Colors.red),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            width: 2,
                            color: isImputRight
                                ? Theme.of(context).colorScheme.secondary
                                : Colors.red),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            width: 2,
                            color: isImputRight
                                ? Theme.of(context).colorScheme.secondary
                                : Colors.red),
                      ),
                      fillColor: Theme.of(context).colorScheme.surface,
                      filled: true,
                      hintText: hintText,
                      hintStyle: GoogleFonts.notoSansMono(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 8),
                      errorText: errorMsg,
                      errorStyle: GoogleFonts.notoSansMono(
                          color: Theme.of(context).colorScheme.onSurface,
                          fontSize: 7)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
