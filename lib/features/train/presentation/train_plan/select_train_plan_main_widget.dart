import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectTrainPlanMainWidget extends ConsumerStatefulWidget {
  const SelectTrainPlanMainWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SelectTrainPlanMainWidgetState();
}

class _SelectTrainPlanMainWidgetState
    extends ConsumerState<SelectTrainPlanMainWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Image.asset('assets/leading/arrow.png')),
        centerTitle: true,
        title: FittedBox(
          child: Text(
            'План занятий',
            style: GoogleFonts.inter(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 24,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: Stack(
        children: [],
      ),
    );
  }
}
