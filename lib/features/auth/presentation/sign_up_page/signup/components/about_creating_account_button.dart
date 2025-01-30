import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutCreateAccButton extends StatelessWidget {
  const AboutCreateAccButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, 1),
      child: Padding(
          padding: const EdgeInsets.only(
            left: 77,
            right: 76,
            bottom: 58,
          ),
          child: InkWell(
            onTap: () {
              log('message');
            },
            child: SizedBox(
              child: FittedBox(
                  child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text: 'Продолжая, вы соглашаетесь с',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              color: Theme.of(context).colorScheme.onPrimary),
                          children: [
                            TextSpan(
                                text: ' условями\nпользования',
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary)),
                            TextSpan(
                                text: ' и',
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary)),
                            TextSpan(
                                text: ' политикой конфиденциальности',
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary)),
                          ]))),
            ),
          )),
    );
  }
}
