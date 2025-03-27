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
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
      child: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.green,
              child: Column(
                children: [
                  Row(
                    children: [Icon(Icons.abc)],
                  ),
                  Container()
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.purple,
              child: Column(
                children: [Row(), Container()],
              ),
            ),
          )
        ],
      ),
    );
  }
}
