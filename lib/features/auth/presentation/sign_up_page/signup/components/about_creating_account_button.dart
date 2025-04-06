import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

final _gitUrl = Uri.parse('https://github.com/suzzzel/FitFlow');

class AboutCreateAccButton extends StatelessWidget {
  const AboutCreateAccButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final shader = LinearGradient(colors: [
      Theme.of(context).colorScheme.primaryFixed,
      Theme.of(context).colorScheme.secondaryFixed,
    ]).createShader(const Rect.fromLTWH(0.0, 0.0, 320.0, 80.0));
    return Align(
      alignment: const Alignment(0, 1),
      child: Padding(
          padding: const EdgeInsets.only(
            left: 77,
            right: 76,
            bottom: 58,
          ),
          child: InkWell(
            onTap: () async {
              await launchUrl(_gitUrl);
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
                              color: Theme.of(context).colorScheme.onSecondary),
                          children: [
                            TextSpan(
                                text: ' условями\nпользования',
                                style: GoogleFonts.inter(
                                  foreground: Paint()..shader = shader,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                )),
                            TextSpan(
                                text: ' и',
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary)),
                            TextSpan(
                                text: ' политикой конфиденциальности',
                                style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  foreground: Paint()..shader = shader,
                                )),
                          ]))),
            ),
          )),
    );
  }
}
