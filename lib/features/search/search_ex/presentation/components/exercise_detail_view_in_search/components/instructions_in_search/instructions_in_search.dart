import 'package:fitflow/features/search/search_ex/presentation/components/exercise_detail_view_in_search/components/instructions_in_search/components/instructions_first.dart';
import 'package:fitflow/features/search/search_ex/presentation/components/exercise_detail_view_in_search/components/instructions_in_search/components/instructions_second.dart';
import 'package:flutter/material.dart';

class InstructionsInSearch extends StatelessWidget {
  const InstructionsInSearch({
    super.key,
    required this.instructions,
  });

  final List<String> instructions;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const InstructionsFirst(),
        InstructionsSecond(instructions: instructions)
      ],
    );
  }
}
