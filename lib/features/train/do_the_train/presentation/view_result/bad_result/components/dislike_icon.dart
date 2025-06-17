import 'package:flutter/material.dart';

class DislikeIcon extends StatelessWidget {
  const DislikeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) => LinearGradient(colors: [
        Theme.of(context).colorScheme.primaryFixed,
        Theme.of(context).colorScheme.secondaryFixed,
      ]).createShader(bounds),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.4,
        child: const FittedBox(
          child: Icon(
            Icons.thumb_down_alt,
          ),
        ),
      ),
    );
  }
}
