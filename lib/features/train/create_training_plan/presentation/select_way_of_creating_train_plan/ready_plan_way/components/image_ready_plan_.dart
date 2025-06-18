import 'package:flutter/material.dart';

class ImageReadyPlan extends StatelessWidget {
  const ImageReadyPlan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 2),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.168,
        child: FittedBox(
          child: Image.asset('assets/create_training_plan/ready_plan.png'),
        ),
      ),
    );
  }
}
