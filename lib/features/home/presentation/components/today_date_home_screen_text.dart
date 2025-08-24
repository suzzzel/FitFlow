import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodayDateHomeScreenText extends StatelessWidget {
  final String todayDate;
  const TodayDateHomeScreenText({super.key, required this.todayDate});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) => LinearGradient(colors: [
        Theme.of(context).colorScheme.primaryFixed,
        Theme.of(context).colorScheme.secondaryFixed,
      ]).createShader(bounds),
      child: Text(
        translateDate(
            todayMonth: todayDate.split(',').first,
            todayDate: todayDate.split(',').last),
        style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500),
      ),
    );
  }
}

String translateDate({required String todayMonth, required String todayDate}) {
  switch (todayMonth) {
    case 'Dec':
      return "Дек,$todayDate";
    case 'Jan':
      return "Янв,$todayDate";
    case 'Feb':
      return "Фев,$todayDate";
    case 'Mar':
      return "Мар,$todayDate";
    case 'Apr':
      return "Апр,$todayDate";
    case 'May':
      return "Май,$todayDate";
    case 'Jun':
      return "Июн,$todayDate";
    case 'Jul':
      return "Июл,$todayDate";
    case 'Aug':
      return "Авг,$todayDate";
    case 'Sept':
      return "Сен,$todayDate";
    case 'Oct':
      return "Окт,$todayDate";
    case 'Nov':
      return "Ноя,$todayDate";
    default:
      return todayDate;
  }
}
