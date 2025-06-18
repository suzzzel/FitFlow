import 'package:fitflow/features/train/do_the_train/domain/providers/temp_train_domain_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoAboutExit extends ConsumerWidget {
  const InfoAboutExit({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final trainNotifier = ref.watch(tempTrainStateNotifierProvider);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        textAlign: TextAlign.center,
        !trainNotifier.isTrainWasAllSkipped()
            ? 'Действительно хотите закончить тренировку?\nВсе выполненные упражнения будут сохранены. Эта тренировка будет сохранена без возможности изменения.'
            : 'Действительно хотите закончить тренировку?\nЭта тренировка не будет сохранена, вы сможете начать её сегодня позже.',
        style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Theme.of(context).colorScheme.onSecondary),
      ),
    );
  }
}
