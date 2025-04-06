import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ErrorTextRecoveryCode extends StatelessWidget {
  const ErrorTextRecoveryCode({
    super.key,
    required this.state,
    required this.otpImput,
  });

  final AsyncValue<bool?> state;
  final String otpImput;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, -0.11),
      child: SizedBox(
          width: 208,
          child: state.isLoading
              ? Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: ShaderMask(
                    blendMode: BlendMode.srcATop,
                    shaderCallback: (bounds) => LinearGradient(colors: [
                      Theme.of(context).colorScheme.primaryFixed,
                      Theme.of(context).colorScheme.secondaryFixed,
                    ]).createShader(bounds),
                    child: const SizedBox(
                      width: 41,
                      height: 41,
                      child: FittedBox(
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      ),
                    ),
                  ),
                )
              : state.value == null
                  ? const SizedBox()
                  : state.value == false
                      ? otpImput.isNotEmpty
                          ? FittedBox(
                              child: Text(
                                'Неверный 6-значный код.',
                                style: GoogleFonts.inter(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        const Color.fromRGBO(255, 10, 10, 0.8)),
                              ),
                            )
                          : const SizedBox()
                      : SizedBox(
                          width: 41,
                          height: 41,
                          child: FittedBox(
                            child: Icon(
                              Icons.check,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                        )),
    );
  }
}
