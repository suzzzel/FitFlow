import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class WeightIndicator extends StatelessWidget {
  final String weight;
  const WeightIndicator({super.key, required this.weight});

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
                  context.goNamed('updateweight');
                },
                splashColor: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/home/weight.png',
                ),
              )),
          SizedBox(
            width: 37,
            height: 22,
            child: FittedBox(
              child: Text('$weight кг',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Theme.of(context).colorScheme.onPrimary)),
            ),
          ),
          SizedBox(
            width: 28,
            height: 22,
            child: FittedBox(
              child: Text(
                'Вес',
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
