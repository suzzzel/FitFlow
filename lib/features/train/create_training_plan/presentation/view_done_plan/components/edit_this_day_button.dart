import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class EditThisDayButton extends StatelessWidget {
  const EditThisDayButton({super.key, required this.weekday});

  final String weekday;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 89,
      height: 31,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(11)),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.secondary.withOpacity(0.7),
              Theme.of(context).colorScheme.errorContainer.withOpacity(0.7),
            ],
          )),
      child: ElevatedButton(
          onPressed: () {
            context.goNamed('editdayinplan', extra: {
              'weekday': weekday,
              'isPlanBeenChanged': true,
            });
          },
          style: const ButtonStyle(
              elevation: WidgetStatePropertyAll(0),
              padding: WidgetStatePropertyAll(EdgeInsets.all(0)),
              backgroundColor: WidgetStatePropertyAll(Colors.transparent)),
          child: FittedBox(
            child: Text(
              'Изменить',
              style: GoogleFonts.inter(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          )),
    );
  }
}
