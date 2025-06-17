import 'package:fitflow/features/train/do_the_train/domain/providers/temp_train_domain_provider.dart';
import 'package:fitflow/features/train/do_the_train/presentation/view_result/good_result/components/end_train_button.dart';
import 'package:fitflow/features/train/do_the_train/presentation/view_result/good_result/components/good_result_header.dart';
import 'package:fitflow/features/train/do_the_train/presentation/view_result/good_result/components/good_result_info.dart';
import 'package:fitflow/features/train/do_the_train/presentation/view_result/good_result/components/like_icon.dart';
import 'package:fitflow/features/train/do_the_train/presentation/view_result/good_result/components/percent_of_done_in_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewGoodResultWidget extends ConsumerWidget {
  const ViewGoodResultWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final train = ref.watch(tempTrainStateNotifierProvider);
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const LikeIcon(),
            const GoodResultHeader(),
            PercentOfDoneInResult(percentOfDone: train.percentOfTrainDone()!),
            const GoodResultInfoAboutHomeButton(),
          ],
        ),
        const EndTrainButton(),
      ],
    );
  }
}
