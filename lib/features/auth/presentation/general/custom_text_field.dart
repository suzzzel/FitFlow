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
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final String? errorMsg;
  final String? Function(String)? onChanged;
  final ValueChanged<String>? onFieldSubmitted;
  final Color? notAuthColor;
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
    this.textInputAction,
    this.prefixIcon,
    this.validator,
    this.focusNode,
    this.errorMsg,
    this.onChanged,
    this.onFieldSubmitted,
    this.notAuthColor,
    this.onTepOutside,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: FittedBox(
            child: Text(
              labelText,
              style: GoogleFonts.inter(
                  color: Theme.of(context).colorScheme.secondary,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
        SizedBox(
          height: 60,
          child: Stack(
            children: [
              TextFormField(
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
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    suffixIcon: suffixIcon,
                    prefixIcon: prefixIcon,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: notAuthColor ??
                              Theme.of(context).colorScheme.onSurface),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.secondary),
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
            ],
          ),
        ),
      ],
    );
  }
}
