import 'package:fitflow/features/auth/auth_sign_up/presentation/level/level_selector.dart';
import 'package:fitflow/features/auth/auth_sign_up/presentation/level/next_step_after_level.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectLevelMainWidget extends ConsumerWidget {
  const SelectLevelMainWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Align(alignment: Alignment(0, 0.09), child: LevelSelector()),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 35),
            child: NextStepAfterLevelSelectButton(),
          ),
        ),
      ],
    );
  }
}
