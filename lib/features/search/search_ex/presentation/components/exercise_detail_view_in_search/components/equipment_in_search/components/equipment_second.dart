import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EquipmentSecond extends StatelessWidget {
  const EquipmentSecond({
    super.key,
    required this.equipment,
  });

  final String equipment;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text(
        equipment,
        style: GoogleFonts.inter(
            color: Theme.of(context).colorScheme.onSecondary,
            fontSize: 16,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
