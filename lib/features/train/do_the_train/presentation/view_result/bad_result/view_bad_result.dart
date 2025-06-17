import 'package:fitflow/features/train/do_the_train/presentation/view_result/bad_result/components/bad_result_header.dart';
import 'package:fitflow/features/train/do_the_train/presentation/view_result/bad_result/components/bad_result_info.dart';
import 'package:fitflow/features/train/do_the_train/presentation/view_result/bad_result/components/bad_result_question.dart';
import 'package:fitflow/features/train/do_the_train/presentation/view_result/bad_result/components/dislike_icon.dart';
import 'package:fitflow/features/train/do_the_train/presentation/view_result/good_result/components/end_train_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewBadResultWidget extends ConsumerWidget {
  const ViewBadResultWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Stack(
      alignment: Alignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DislikeIcon(),
            BadResultHeader(),
            BadResultQuestion(),
            BadResultInfo()
          ],
        ),
        EndTrainButton(),
      ],
    );
  }
}
