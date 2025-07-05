import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';

class EmptyTrainInfo extends ConsumerWidget {
  const EmptyTrainInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      shrinkWrap: false,
      children: [
        ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) => LinearGradient(colors: [
            Theme.of(context).colorScheme.primaryFixed,
            Theme.of(context).colorScheme.secondaryFixed,
          ]).createShader(bounds),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Text(
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700, fontSize: 17),
                    textAlign: TextAlign.center,
                    'У вас отсутствуют записанные тренировки.\nОтличное время что - бы начать!'),
                const SizedBox(
                    width: 100,
                    height: 100,
                    child: LoadingIndicator(indicatorType: Indicator.ballScale))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
