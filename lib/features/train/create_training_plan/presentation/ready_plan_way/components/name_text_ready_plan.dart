import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NameReadyPlan extends StatelessWidget {
  const NameReadyPlan({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: SizedBox(
        child: ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) => LinearGradient(colors: [
            Theme.of(context).colorScheme.primaryFixed,
            Theme.of(context).colorScheme.secondaryFixed,
          ]).createShader(bounds),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              name,
              textAlign: TextAlign.center,
              textScaler: const TextScaler.linear(1),
              style:
                  GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
  }
}
