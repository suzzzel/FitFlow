import 'package:flutter/material.dart';

class WeekdayListBackground extends StatelessWidget {
  const WeekdayListBackground({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 33, right: 33),
      height: 384,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.primaryFixed.withOpacity(0.106),
              Theme.of(context).colorScheme.secondaryFixed.withOpacity(0.106),
            ],
          )),
      child: child,
    );
  }
}
