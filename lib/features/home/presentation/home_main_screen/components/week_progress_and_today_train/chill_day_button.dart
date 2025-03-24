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
            borderRadius: BorderRadius.circular(16), color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              padding: const EdgeInsets.only(right: 15),
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
                    child: Text('Сегодня день отдыха!',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                            fontSize: 15, fontWeight: FontWeight.w700))),
              ),
            ),
          ],
        ));
  }
}
