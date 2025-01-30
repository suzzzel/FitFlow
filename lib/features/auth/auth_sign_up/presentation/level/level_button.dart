import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelButtonStyle extends StatefulWidget {
  const LevelButtonStyle(
      {super.key,
      required this.isPrimary,
      required this.level,
      required this.iconLevel});
  final bool isPrimary;
  final String level;
  final String iconLevel;

  @override
  State<LevelButtonStyle> createState() => _LevelButtonStyleState();
}

class _LevelButtonStyleState extends State<LevelButtonStyle> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: SizedBox(
              width: widget.isPrimary ? 42 : 38,
              height: widget.isPrimary ? 42 : 38,
              child: FittedBox(
                  child: Image.asset(widget.iconLevel,
                      color: widget.isPrimary
                          ? Theme.of(context).colorScheme.secondary
                          : Theme.of(context)
                              .colorScheme
                              .tertiary
                              .withOpacity(1)))),
        ),
        Spacer(),
        AnimatedDefaultTextStyle(
            child: Text(widget.level),
            style: GoogleFonts.inter(
                fontSize: widget.isPrimary ? 32 : 24,
                color: widget.isPrimary
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.tertiary.withOpacity(1)),
            duration: Duration(microseconds: 1200)),
        Spacer()
      ],
    );
  }
}
