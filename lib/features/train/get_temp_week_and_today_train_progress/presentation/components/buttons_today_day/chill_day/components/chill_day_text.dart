import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChillDayTextInsideButton extends StatelessWidget {
  const ChillDayTextInsideButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 13),
      child: TextButton(
        onPressed: () {},
        style: const ButtonStyle(
            overlayColor: WidgetStatePropertyAll(Colors.transparent),
            padding: WidgetStatePropertyAll(EdgeInsets.all(0))),
        child: ShaderMask(
            blendMode: BlendMode.srcATop,
            shaderCallback: (bounds) => LinearGradient(colors: [
                  Theme.of(context).colorScheme.primaryFixed,
                  Theme.of(context).colorScheme.secondaryFixed,
                ]).createShader(bounds),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.40,
              child: FittedBox(
                child: Text('Сегодня день отдыха!',
                    textScaler: const TextScaler.linear(1),
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        fontSize: 15, fontWeight: FontWeight.w700)),
              ),
            )),
      ),
    );
  }
}
