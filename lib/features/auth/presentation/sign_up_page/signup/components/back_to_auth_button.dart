import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class BackToAuthButton extends StatelessWidget {
  const BackToAuthButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            left: 43,
            right: 44,
            top: MediaQuery.of(context).size.height * 0.665),
        child: FittedBox(
            child: Row(
          children: [
            Text('У вас уже есть аккаунт?',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.onPrimary)),
            InkWell(
              onTap: () {
                context.goNamed('signin');
              },
              child: Text(
                ' Авторизоваться',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Theme.of(context).colorScheme.secondary),
              ),
            )
          ],
        )));
  }
}
