import 'package:flutter/material.dart';

class ChangeExercisesInDayButton extends StatelessWidget {
  const ChangeExercisesInDayButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 36, maxHeight: 36),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 4),
          gradient: LinearGradient(colors: [
            Theme.of(context).colorScheme.primaryFixed.withOpacity(0.7),
            Theme.of(context).colorScheme.secondaryFixed.withOpacity(0.7),
          ]),
          borderRadius: BorderRadius.circular(20)),
      child: FittedBox(
        child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.edit,
              color: Colors.white.withOpacity(0.85),
            )),
      ),
    );
  }
}
