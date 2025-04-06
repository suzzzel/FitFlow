import 'package:flutter/material.dart';

class CirclesLoadingWidget extends StatelessWidget {
  const CirclesLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.115),
      child: Center(
        child: Image.asset(
          'assets/loading/circles.png',
          fit: BoxFit.cover,
          scale: 1,
        ),
      ),
    );
  }
}
