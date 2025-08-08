import 'dart:io';
import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:fitflow/features/search/presentation/components/exercise_detail_view_in_search/components/add_exercise_in_plan_from_search_button.dart';
import 'package:fitflow/features/search/presentation/components/exercise_detail_view_in_search/components/body_part_in_search/body_part_in_search.dart';
import 'package:fitflow/features/search/presentation/components/exercise_detail_view_in_search/components/close_detail_view_exercise_in_search_button.dart';
import 'package:fitflow/features/search/presentation/components/exercise_detail_view_in_search/components/equipment_in_search/equipment_in_search.dart';
import 'package:fitflow/features/search/presentation/components/exercise_detail_view_in_search/components/exercise_image_in_search.dart';
import 'package:fitflow/features/search/presentation/components/exercise_detail_view_in_search/components/exercise_name_in_search.dart';
import 'package:fitflow/features/search/presentation/components/exercise_detail_view_in_search/components/instructions_in_search/instructions_in_search.dart';
import 'package:fitflow/features/search/presentation/components/exercise_detail_view_in_search/components/primary_muscle_in_search/primary_muscle_in_search.dart';
import 'package:fitflow/features/search/presentation/components/exercise_detail_view_in_search/components/secondary_muscle_in_search/secondary_muscle_in_search.dart';
import 'package:fitflow/features/train/create_training_plan/presentation/view_done_plan/edit_day_in_plan/components/exercise_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class ExerciseSearchWidget extends ConsumerWidget {
  const ExerciseSearchWidget(
      {super.key,
      required this.exGifFile,
      required this.dir,
      required this.exercise,
      required this.isPlanEdit,
      required this.weekday,
      required this.exerciseToDelete});

  final File exGifFile;
  final Directory dir;
  final ExerciseModel exercise;
  final bool isPlanEdit;
  final String? weekday;
  final ExerciseModel? exerciseToDelete;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          // Детальный просмотр упражнения
          showDialog(
            context: context,
            builder: (context) {
              final secondaryMuscles = exercise.getSecondaryMuscles();
              final instructions = exercise.getInstructions();
              return AlertDialog(
                actionsAlignment: MainAxisAlignment.center,
                backgroundColor: Colors.transparent,
                contentPadding: const EdgeInsets.all(0),
                content: Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: double.maxFinite,
                  constraints: const BoxConstraints(),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      gradient: LinearGradient(
                          colors: [
                            Theme.of(context).colorScheme.primary,
                            Theme.of(context).colorScheme.secondary,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    shrinkWrap: true,
                    children: [
                      ExerciseImageInSearch(exGifFile: exGifFile),
                      ExerciseNameInSearch(name: exercise.name),
                      BodyPartInSearch(bodyPart: exercise.bodyPart),
                      PrimaryMuscleInSearch(target: exercise.target),
                      EquipmentInSearch(equipment: exercise.equipment),
                      secondaryMuscles.isNotEmpty
                          ? SecondaryMuscleInSearch(
                              secondaryMuscles: secondaryMuscles)
                          : const SizedBox(),
                      instructions.isNotEmpty
                          ? InstructionsInSearch(instructions: instructions)
                          : const SizedBox(),
                    ],
                  ),
                ),
                actionsPadding: const EdgeInsets.all(8),
                actions: [
                  const CloseDetailViewExerciseInSearch(),
                  isPlanEdit
                      ? AddExerciseInPlanFromSearch(
                          weekday: weekday,
                          exerciseToAdd: exercise,
                          exerciseToDelete: exerciseToDelete,
                        )
                      : const SizedBox()
                ],
              );
            },
          );
        },
        // Отображение упражнения в виджете поиска
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.primary.withOpacity(0.2),
                Theme.of(context).colorScheme.secondary.withOpacity(0.2),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          padding:
              const EdgeInsets.only(right: 5, left: 5, bottom: 10, top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ExerciseImage(
                exGifFile: exGifFile,
                widthInDetailView: null,
                heightinDetailView: null,
              ),
              ShaderMask(
                blendMode: BlendMode.srcATop,
                shaderCallback: (bounds) => LinearGradient(colors: [
                  Theme.of(context).colorScheme.primaryFixed,
                  Theme.of(context).colorScheme.secondaryFixed,
                ]).createShader(bounds),
                child: Text(
                  exercise.name,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
