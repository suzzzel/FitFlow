import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EquipmentFirst extends StatelessWidget {
  const EquipmentFirst({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text(
        'Необходимое оборудование',
        textAlign: TextAlign.center,
        style: GoogleFonts.inter(
            color: Theme.of(context).colorScheme.onPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
