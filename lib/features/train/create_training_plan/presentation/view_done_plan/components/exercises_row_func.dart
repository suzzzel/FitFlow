import 'dart:io';
import 'package:fitflow/features/general_comonents/exercise_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget exercisesRow(
    {required List<String?> dayExercises,
    required List<ExerciseModel> exercises,
    required Directory dir,
    required bool firstLine,
    required BuildContext context}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: dayExercises.map((exId) {
      final exGifFolderPath = '${dir.path}/exGifs';
      if (exId != null) {
        final exName =
            exercises.where((ex) => ex.id.toString() == exId).first.name;
        final exIdGif = exId.padLeft(4, '0');
        final exGifFile = File('$exGifFolderPath/$exIdGif.gif');
        return Padding(
          padding: EdgeInsets.only(
            bottom: firstLine ? 20 : 10,
          ),
          child: Column(
            children: [
              Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: ShaderMask(
                        blendMode: BlendMode.srcATop,
                        shaderCallback: (bounds) => LinearGradient(colors: [
                              Theme.of(context)
                                  .colorScheme
                                  .primaryFixed
                                  .withOpacity(0.4),
                              Theme.of(context)
                                  .colorScheme
                                  .secondaryFixed
                                  .withOpacity(0.4),
                            ]).createShader(bounds),
                        child: exGifFile.existsSync()
                            ? Image.file(
                                exGifFile,
                                width: 65,
                                height: 65,
                              )
                            : Image.asset(
                                'assets/home/gif_error.gif',
                                width: 65,
                                height: 65,
                              )),
                  ),
                ),
              ),
              SizedBox(
                width: 91,
                child: ShaderMask(
                  blendMode: BlendMode.srcATop,
                  shaderCallback: (bounds) => LinearGradient(colors: [
                    Theme.of(context).colorScheme.primaryFixed,
                    Theme.of(context).colorScheme.secondaryFixed,
                  ]).createShader(bounds),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Text(
                      softWrap: true,
                      maxLines: 3,
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.fade,
                      _trueExName(exName),
                      style: GoogleFonts.inter(
                          fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      } else {
        return const SizedBox.shrink();
      }
    }).toList(),
  );
}

String _trueExName(String text) {
  return text.substring(0, 1).toUpperCase() + text.substring(1);
}
