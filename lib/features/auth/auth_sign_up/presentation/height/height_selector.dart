import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitflow/features/auth/auth_sign_up/domain/providers/select_height_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class HeightSelector extends ConsumerStatefulWidget {
  //  NEED WORK NEED WORK NEED WORK NEED WORK NEED WORK NEED WORK NEED WORK NEED WORK
  const HeightSelector({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AgeSelectorState();
}

class _AgeSelectorState extends ConsumerState<HeightSelector> {
  final int heightCorrection = 120;
  late int currentIndex;

  @override
  void initState() {
    currentIndex = 50;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final heightMainProv = ref.watch(selectHeightMainProvider.notifier);

    return SizedBox(
      height: 440,
      width: 130,
      child: CarouselSlider(
          items: List<Widget>.generate(100, (int index) {
            return Center(
              child: SizedBox(
                width: 128,
                height: 90,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    '${index + (heightCorrection)}',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.bold,
                        fontSize: heightMainProv.state == index
                            ? 80
                            : index == heightMainProv.state - 1 ||
                                    index == heightMainProv.state + 1
                                ? 70
                                : 60,
                        color: heightMainProv.state == index
                            ? Theme.of(context).colorScheme.secondary
                            : index == heightMainProv.state - 1 ||
                                    index == heightMainProv.state + 1
                                ? Theme.of(context)
                                    .colorScheme
                                    .onPrimary
                                    .withOpacity(0.75)
                                : Theme.of(context)
                                    .colorScheme
                                    .onPrimary
                                    .withOpacity(0.5)),
                  ),
                ),
              ),
            );
          }),
          options: CarouselOptions(
            viewportFraction: 0.2,
            pageSnapping: false,
            scrollDirection: Axis.vertical,
            initialPage: 50,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index + heightCorrection;
                heightMainProv.state = index;
                log('${index + heightCorrection}');
                log('current index: $currentIndex');
              });
            },
          )),
    );
  }
}
