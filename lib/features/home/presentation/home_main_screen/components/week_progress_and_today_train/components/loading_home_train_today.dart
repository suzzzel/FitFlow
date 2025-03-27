import 'package:flutter/material.dart';

class LoadingHomeTrainToday extends StatelessWidget {
  const LoadingHomeTrainToday({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 30,
      height: 30,
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
        ),
      ),
    );
  }
}
