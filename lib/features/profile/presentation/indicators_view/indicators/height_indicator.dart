import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HeightIndicator extends StatelessWidget {
  final String height;
  const HeightIndicator({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: 49,
              height: 49,
              child: InkWell(
                onTap: () {
                  context.goNamed('updateheight');
                },
                splashColor: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/home/height.png',
                ),
              )),
          SizedBox(
            width: 36,
            height: 22,
            child: FittedBox(
              child: Text(
                  '${height.characters.first}.${height.characters.characterAt(1)} м',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Theme.of(context).colorScheme.onPrimary)),
            ),
          ),
          SizedBox(
            width: 36,
            height: 22,
            child: FittedBox(
              child: ShaderMask(
                blendMode: BlendMode.srcATop,
                shaderCallback: (bounds) => LinearGradient(colors: [
                  Theme.of(context).colorScheme.primaryFixed,
                  Theme.of(context).colorScheme.secondaryFixed,
                ]).createShader(bounds),
                child: Text(
                  'Рост',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
