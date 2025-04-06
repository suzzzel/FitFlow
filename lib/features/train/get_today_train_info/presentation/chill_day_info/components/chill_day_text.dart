import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChillDayTextInfo extends StatelessWidget {
  const ChillDayTextInfo({
    super.key,
    required this.numberOfWeek,
  });

  final int numberOfWeek;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) => LinearGradient(colors: [
            Theme.of(context).colorScheme.primaryFixed,
            Theme.of(context).colorScheme.secondaryFixed,
          ]).createShader(bounds),
          child: Text(
            '$numberOfWeek-ая неделя',
            style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ),
        ShaderMask(
            blendMode: BlendMode.srcATop,
            shaderCallback: (bounds) => LinearGradient(colors: [
                  Theme.of(context).colorScheme.primaryFixed,
                  Theme.of(context).colorScheme.secondaryFixed,
                ]).createShader(bounds),
            child: SizedBox(
              height: 36,
              child: FittedBox(
                child: Text('Вам необходимо\nвосстановиться!',
                    style: GoogleFonts.inter(
                        fontSize: 15, fontWeight: FontWeight.w700)),
              ),
            )),
      ],
    );
  }
}
