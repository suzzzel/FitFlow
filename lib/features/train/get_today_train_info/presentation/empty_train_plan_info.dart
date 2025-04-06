import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmptyTrainPlanInfo extends StatelessWidget {
  const EmptyTrainPlanInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 24,
        left: 24,
        bottom: 30,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: SizedBox(
              width: 56,
              height: 56,
              child: FittedBox(
                child: Image.asset('assets/home/training_lightning.png'),
              ),
            ),
          ),
          Center(
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
          )
        ],
      ),
    );
  }
}
