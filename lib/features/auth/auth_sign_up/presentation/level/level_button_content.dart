import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelButtonContent extends StatefulWidget {
  const LevelButtonContent(
      {super.key,
      required this.isPrimary,
      required this.level,
      required this.iconLevel});
  final bool isPrimary;
  final String level;
  final String iconLevel;

  @override
  State<LevelButtonContent> createState() => _LevelButtonContentState();
}

class _LevelButtonContentState extends State<LevelButtonContent> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
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
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: FittedBox(
            child: Text(
              widget.level,
              textAlign: TextAlign.center,
              style: GoogleFonts.inter(
                  fontSize: widget.isPrimary ? 32 : 24,
                  fontWeight: FontWeight.w500,
                  color: widget.isPrimary
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.tertiary.withOpacity(1)),
            ),
          ),
        ),
        const Spacer()
      ],
    );
  }
}
