import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class AgeIndicator extends StatelessWidget {
  final String age;
  const AgeIndicator({super.key, required this.age});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Column(
        children: [
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).colorScheme.secondaryContainer),
              width: 49,
              height: 49,
              child: InkWell(
                onTap: () {
                  context.goNamed('updateage');
                },
                splashColor: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/home/age.png',
                ),
              )),
          SizedBox(
            width: 19,
            height: 22,
            child: FittedBox(
              child: Text(age,
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Theme.of(context).colorScheme.onPrimary)),
            ),
          ),
          SizedBox(
            width: 61,
            height: 22,
            child: FittedBox(
              child: Text(
                'Возраст',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.secondary),
              ),
            ),
          )
        ],
      ),
    );
  }
}
