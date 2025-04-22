import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class CreatePlanTextInsideButton extends StatelessWidget {
  const CreatePlanTextInsideButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 13),
      child: TextButton(
        onPressed: () {
          context.goNamed('newtrainplan');
        },
        style: const ButtonStyle(
            elevation: WidgetStatePropertyAll(0),
            overlayColor: WidgetStatePropertyAll(Colors.transparent),
            padding: WidgetStatePropertyAll(EdgeInsets.all(0))),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.40,
          child: FittedBox(
            child: Text('Создать программу',
                textScaler: const TextScaler.linear(1),
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
