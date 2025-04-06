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
            left: 39,
            right: 39,
            top: MediaQuery.of(context).size.height * 0.665),
        child: FittedBox(
            child: Row(
          children: [
            Text('У вас уже есть аккаунт?',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.white)),
            InkWell(
              onTap: () {
                context.goNamed('signin');
              },
              child: ShaderMask(
                blendMode: BlendMode.srcATop,
                shaderCallback: (bounds) => LinearGradient(colors: [
                  Theme.of(context).colorScheme.primaryFixed,
                  Theme.of(context).colorScheme.secondaryFixed,
                ]).createShader(bounds),
                child: Text(
                  ' Авторизуйтесь',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Theme.of(context).colorScheme.secondary),
                ),
              ),
            )
          ],
        )));
  }
}
