import 'package:fitflow/features/search/search_ex/presentation/components/exercise_detail_view_in_search/components/body_part_in_search/components/body_part_first.dart';
import 'package:fitflow/features/search/search_ex/presentation/components/exercise_detail_view_in_search/components/body_part_in_search/components/body_part_second.dart';
import 'package:flutter/material.dart';

class BodyPartInSearch extends StatelessWidget {
  const BodyPartInSearch({
    super.key,
    required this.bodyPart,
  });

  final String bodyPart;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(99)),
            color: Colors.grey.withOpacity(0.3)),
        child: Column(
          children: [
            const BodyPartFirst(),
            BodyPartSecond(bodyPart: bodyPart),
          ],
        ),
      ),
    );
  }
}
