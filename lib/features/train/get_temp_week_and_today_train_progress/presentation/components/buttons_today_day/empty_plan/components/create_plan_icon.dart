import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CreatePlanIconInsideBtutton extends StatelessWidget {
  const CreatePlanIconInsideBtutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(99),
            gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.primaryFixed,
              Theme.of(context).colorScheme.secondaryFixed
            ])),
        width: 56,
        height: 56,
        child: IconButton(
          onPressed: () {
            context.goNamed('newtrainplan');
          },
          icon: Image.asset('assets/home/create_plan.png'),
        ));
  }
}
