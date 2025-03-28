import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateTrainingPlanMainWidget extends StatelessWidget {
  const CreateTrainingPlanMainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.13),
      child: Column(
        children: [
          Expanded(
            child: Container(
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.07,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.06,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 56,
                            height: 56,
                            child: FittedBox(
                              child: Image.asset(
                                  'assets/create_training_plan/ready_plan.png'),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.055,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: ShaderMask(
                              blendMode: BlendMode.srcATop,
                              shaderCallback: (bounds) =>
                                  LinearGradient(colors: [
                                Theme.of(context).colorScheme.primaryFixed,
                                Theme.of(context).colorScheme.secondaryFixed,
                              ]).createShader(bounds),
                              child: Text(
                                'Готовые программы\nтренировок',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 28,
                      ),
                      child: Container(
                        height: 100,
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(0, 4),
                                  blurRadius: 20,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary
                                      .withOpacity(0.5))
                            ],
                            borderRadius: BorderRadius.circular(19),
                            gradient: LinearGradient(colors: [
                              Theme.of(context)
                                  .colorScheme
                                  .error
                                  .withOpacity(0.2),
                              Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.2)
                            ])),
                        child: Center(
                          child: SizedBox(
                            width: 268,
                            child: FittedBox(
                              child: Text(
                                'Подборка упражнений, основанная\nна выборе качеств ранее\nи ваших желаниях',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.purple,
              child: Column(
                children: [Row(), Container()],
              ),
            ),
          )
        ],
      ),
    );
  }
}
