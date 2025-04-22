import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RuWeekdayTrainPlan extends StatelessWidget {
  const RuWeekdayTrainPlan({super.key, required this.weekday});

  final String weekday;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: ShaderMask(
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) => LinearGradient(colors: [
                Theme.of(context).colorScheme.primaryFixed,
                Theme.of(context).colorScheme.secondaryFixed,
              ]).createShader(bounds),
          child: Text(
            _ruWeekday(weekday),
            style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w700),
          )),
    );
  }
}

String _ruWeekday(String weekday) {
  switch (weekday) {
    case 'monday':
      return 'Понедельник';
    case 'tuesday':
      return 'Вторник';
    case 'wednesday':
      return 'Среда';
    case 'thursday':
      return 'Четверг';
    case 'friday':
      return 'Пятница';
    case 'saturday':
      return 'Суббота';
    case 'sunday':
      return 'Воскресенье';
    default:
      return '';
  }
}
