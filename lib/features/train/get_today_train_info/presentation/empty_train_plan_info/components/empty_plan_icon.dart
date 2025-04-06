import 'package:flutter/material.dart';

class EmptyPlanIconInfo extends StatelessWidget {
  const EmptyPlanIconInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4),
      child: SizedBox(
        width: 56,
        height: 56,
        child: FittedBox(
          child: Image.asset('assets/home/training_lightning.png'),
        ),
      ),
    );
  }
}
