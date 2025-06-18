import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';

class SomethingGoesWrongWidget extends StatelessWidget {
  const SomethingGoesWrongWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) => LinearGradient(colors: [
        Theme.of(context).colorScheme.primaryFixed,
        Theme.of(context).colorScheme.secondaryFixed,
      ]).createShader(bounds),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(
              style:
                  GoogleFonts.inter(fontWeight: FontWeight.w700, fontSize: 17),
              textAlign: TextAlign.center,
              'К сожалению, что то пошло не так, проверьте соединение с сетью и перезапустите приложение.'),
          const SizedBox(
              width: 100,
              height: 100,
              child: LoadingIndicator(indicatorType: Indicator.ballScale))
        ],
      ),
    );
  }
}
