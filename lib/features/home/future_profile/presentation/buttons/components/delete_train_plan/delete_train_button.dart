import 'dart:math';
import 'package:fitflow/features/home/future_profile/domain/providers/home_buttons_domain_provider.dart';
import 'package:fitflow/features/home/future_profile/presentation/buttons/components/delete_train_plan/controller/delete_train_plan_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import 'dart:developer' as dev;

class DeleteTrainPlanButton extends ConsumerWidget {
  const DeleteTrainPlanButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
        onPressed: () {
          showAdaptiveDialog(
            context: context,
            builder: (context) => Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 200,
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Theme.of(context).colorScheme.primaryFixed,
                            Theme.of(context).colorScheme.secondaryFixed,
                          ]),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          'Действительно хотите удалить тренировочный план?\nДля продолжения тренировок, его нужно будет создать заново.\nПредыдущие тренировки не будут удалены.',
                          style: GoogleFonts.inter(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(99)),
                                    gradient: LinearGradient(
                                        colors: [
                                          Theme.of(context).colorScheme.error,
                                          Theme.of(context)
                                              .colorScheme
                                              .tertiaryFixedDim,
                                        ],
                                        transform:
                                            const GradientRotation(pi / 2))),
                                child: Consumer(builder: (context, ref, child) {
                                  final deleteTrainState = ref
                                      .watch(deleteTrainPlanControllerProvider);
                                  final deleteTrain = ref.watch(
                                      deleteTrainPlanControllerProvider
                                          .notifier);
                                  return ElevatedButton(
                                      onPressed: deleteTrainState.isLoading
                                          ? () {}
                                          : () async {
                                              final response = await deleteTrain
                                                  .deleteTrain();
                                              dev.log(deleteTrainState.isLoading
                                                  .toString());
                                              if (response) {
                                                // ref.invalidate(authStateProvider);
                                                showTopSnackBar(
                                                    Overlay.of(context),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.8,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.1,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(99),
                                                          gradient:
                                                              LinearGradient(
                                                                  colors: [
                                                                Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .errorContainer,
                                                                Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .error,
                                                              ])),
                                                      child: Scaffold(
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        body: Center(
                                                          child: Text(
                                                            'Тренировочный план успешно удален',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: GoogleFonts.inter(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      ),
                                                    ));
                                                // context.pop();
                                              } else {
                                                showTopSnackBar(
                                                    Overlay.of(context),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.8,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height *
                                                              0.1,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(99),
                                                          gradient:
                                                              LinearGradient(
                                                                  colors: [
                                                                Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .errorContainer,
                                                                Theme.of(
                                                                        context)
                                                                    .colorScheme
                                                                    .error,
                                                              ])),
                                                      child: Scaffold(
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        body: Center(
                                                          child: Text(
                                                            'Произошла ошибка. Попробуйте позже.',
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: GoogleFonts.inter(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      ),
                                                    ));
                                                context.pop();
                                              }
                                            },
                                      style: ButtonStyle(
                                          elevation:
                                              const WidgetStatePropertyAll(0),
                                          fixedSize: WidgetStatePropertyAll(
                                              Size(
                                                  MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.35,
                                                  35)),
                                          backgroundColor:
                                              const WidgetStatePropertyAll(
                                                  Colors.transparent)),
                                      child: deleteTrainState.isLoading
                                          ? CircularProgressIndicator()
                                          : Text('Удалить',
                                              style: GoogleFonts.inter(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .onSecondary)));
                                })),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(99)),
                                  gradient: LinearGradient(
                                      colors: [
                                        Theme.of(context)
                                            .colorScheme
                                            .primaryFixedDim,
                                        Theme.of(context)
                                            .colorScheme
                                            .secondaryFixedDim,
                                      ],
                                      transform:
                                          const GradientRotation(pi / 2))),
                              child: ElevatedButton(
                                  onPressed: () {
                                    context.pop();
                                  },
                                  style: ButtonStyle(
                                      elevation:
                                          const WidgetStatePropertyAll(0),
                                      fixedSize: WidgetStatePropertyAll(Size(
                                          MediaQuery.of(context).size.width *
                                              0.35,
                                          35)),
                                      backgroundColor:
                                          const WidgetStatePropertyAll(
                                              Colors.transparent)),
                                  child: Text('Назад',
                                      style: GoogleFonts.inter(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSecondary))),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        child: Text('delete train plan'));
  }
}
