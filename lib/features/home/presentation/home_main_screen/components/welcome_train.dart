import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeTrain extends StatelessWidget {
  final String todayDate;
  const WelcomeTrain({super.key, required this.todayDate});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 17, right: 212, top: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShaderMask(
            blendMode: BlendMode.srcATop,
            shaderCallback: (bounds) => LinearGradient(colors: [
              Theme.of(context).colorScheme.primaryFixed,
              Theme.of(context).colorScheme.secondaryFixed,
            ]).createShader(bounds),
            child: Text(
              'Моя тренировка',
              style:
                  GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(
            height: 6,
          ),
          ShaderMask(
            blendMode: BlendMode.srcATop,
            shaderCallback: (bounds) => LinearGradient(colors: [
              Theme.of(context).colorScheme.primaryFixed,
              Theme.of(context).colorScheme.secondaryFixed,
            ]).createShader(bounds),
            child: Text(
              todayDate,
              style:
                  GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
