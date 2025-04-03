import 'package:fitflow/navigation/home_navigation_bar/navbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateTrainPlanButton extends StatelessWidget {
  const CreateTrainPlanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 24, right: 24),
        padding: const EdgeInsets.only(left: 7, right: 15),
        height: 64,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(colors: [
              Theme.of(context).colorScheme.tertiaryFixedDim,
              Theme.of(context).colorScheme.tertiaryFixed,
            ])),
        child: Row(
          children: [
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(99),
                    gradient: LinearGradient(colors: [
                      Theme.of(context).colorScheme.primaryFixed,
                      Theme.of(context).colorScheme.secondaryFixed
                    ])),
                width: 56,
                height: 56,
                child: IconButton(
                  onPressed: () {
                    context.goNamed('newtrainplan');
                  },
                  icon: Image.asset('assets/home/create_plan.png'),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 13),
              child: TextButton(
                onPressed: () {
                  context.goNamed('newtrainplan');
                },
                style: const ButtonStyle(
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
            ),
          ],
        ));
  }
}
