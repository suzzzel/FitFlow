import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyPlanTextInfo extends StatelessWidget {
  const EmptyPlanTextInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 17,
        ),
        child: ShaderMask(
            blendMode: BlendMode.srcATop,
            shaderCallback: (bounds) => LinearGradient(colors: [
                  Theme.of(context).colorScheme.primaryFixed,
                  Theme.of(context).colorScheme.secondaryFixed,
                ]).createShader(bounds),
            child: SizedBox(
              width: 208,
              child: FittedBox(
                child: Text('Не найдено готовой\nпрограммы',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        fontSize: 20, fontWeight: FontWeight.w700)),
              ),
            )),
      ),
    );
  }
}
