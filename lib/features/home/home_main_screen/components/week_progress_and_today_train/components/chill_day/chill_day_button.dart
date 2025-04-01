import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChillDayButton extends StatelessWidget {
  const ChillDayButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 24, right: 24),
        padding: const EdgeInsets.only(left: 7, right: 15),
        height: 64,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.tertiaryContainer,
              Theme.of(context).colorScheme.tertiary,
            ])),
        child: Row(
          children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(99),
                    gradient: LinearGradient(colors: [
                      Theme.of(context).colorScheme.primaryFixed,
                      Theme.of(context).colorScheme.secondaryFixed
                    ])),
                width: 56,
                height: 56,
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/home/training_chill.png'),
                )),
            Padding(
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
            ),
          ],
        ));
  }
}
