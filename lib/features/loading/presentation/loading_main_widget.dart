import 'package:fitflow/features/loading/presentation/circles_loading_widget.dart';
import 'package:fitflow/features/loading/presentation/lines_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingWidget extends StatelessWidget {
  final String? text;
  const LoadingWidget({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          centerTitle: true,
          forceMaterialTransparency: true,
          backgroundColor: Colors.transparent,
          title: ShaderMask(
            blendMode: BlendMode.srcATop,
            shaderCallback: (bounds) => LinearGradient(colors: [
              Theme.of(context).colorScheme.primaryFixed,
              Theme.of(context).colorScheme.secondaryFixed,
            ]).createShader(bounds),
            child: Text(
              'FIT FLOW',
              textScaler: const TextScaler.linear(1),
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                  shadows: [
                    Shadow(
                        offset: const Offset(0, 4),
                        blurRadius: 20,
                        color: Theme.of(context)
                            .colorScheme
                            .secondaryFixed
                            .withOpacity(0.67))
                  ]),
            ),
          )),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Color.fromRGBO(24, 29, 37, 1),
                  Color.fromRGBO(42, 52, 112, 1)
                ])),
          ),
          const LinesLoadingWidget(),
          const CirclesLoadingWidget(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 77, left: 40, right: 27),
              child: SizedBox(
                  height: 44,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: ShaderMask(
                      blendMode: BlendMode.srcATop,
                      shaderCallback: (bounds) => LinearGradient(colors: [
                        Theme.of(context).colorScheme.primaryFixed,
                        Theme.of(context).colorScheme.secondaryFixed,
                      ]).createShader(bounds),
                      child: Text(
                        text ?? 'Пожалуйста, подождите...',
                        textAlign: TextAlign.center,
                        textScaler: const TextScaler.linear(1),
                        style: GoogleFonts.inter(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
