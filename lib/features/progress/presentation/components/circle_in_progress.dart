import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CircleInProgress extends StatelessWidget {
  const CircleInProgress(
      {super.key, required this.infoAboutCircle, required this.infoIntoCircle});

  final String infoAboutCircle;
  final String infoIntoCircle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          alignment: Alignment.center,
          width: 80,
          height: 80,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Theme.of(context).colorScheme.primaryFixed.withOpacity(0.8),
                    Theme.of(context)
                        .colorScheme
                        .secondaryFixed
                        .withOpacity(0.8),
                  ])),
          child: FittedBox(
            child: Text(infoIntoCircle,
                style: GoogleFonts.inter(
                    fontSize: 32,
                    fontWeight: FontWeight.w700,
                    color: Colors.white)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: ShaderMask(
            blendMode: BlendMode.srcATop,
            shaderCallback: (bounds) => LinearGradient(colors: [
              Theme.of(context).colorScheme.primaryFixed,
              Theme.of(context).colorScheme.secondaryFixed,
            ]).createShader(bounds),
            child: Text(
              infoAboutCircle,
              textAlign: TextAlign.center,
              style:
                  GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w500),
            ),
          ),
        )
      ],
    );
  }
}
