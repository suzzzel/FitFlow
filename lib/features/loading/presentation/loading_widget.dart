import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/logo/logo.png',
              width: 150,
              height: 150,
            ),
            const SizedBox(
              height: 50,
            ),
            CircularProgressIndicator(
                color: Theme.of(context).colorScheme.secondary),
            const SizedBox(
              height: 50,
            ),
            Text(
              'Отложите все отговорки и помните: вы способны.',
              style: GoogleFonts.inter(),
            )
          ],
        ),
      ),
    );
  }
}
