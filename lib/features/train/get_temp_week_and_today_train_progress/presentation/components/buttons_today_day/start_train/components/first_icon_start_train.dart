import 'package:fitflow/features/train/do_the_train/domain/providers/complete_train_provider.dart';
import 'package:fitflow/features/train/do_the_train/domain/providers/temp_train_domain_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FirstIconStartTrainInsideButton extends ConsumerWidget {
  const FirstIconStartTrainInsideButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(),
      child: Container(
          width: MediaQuery.of(context).size.width * 0.13,
          height: MediaQuery.of(context).size.width * 0.13,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(99),
              gradient: LinearGradient(colors: [
                Theme.of(context).colorScheme.primaryFixed.withOpacity(0.3),
                Theme.of(context).colorScheme.secondaryFixed.withOpacity(0.3)
              ])),
          child: IconButton(
            onPressed: () {
              ref.invalidate(tempTrainStateNotifierProvider);
              ref.read(completeTrainProvider).startTrain();
              context.goNamed('/trainnow');
            },
            icon: Image.asset(
              'assets/home/training_start.png',
            ),
          )),
    );
  }
}
