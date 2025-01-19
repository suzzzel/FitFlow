import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitflow/features/auth/auth_sign_up/domain/providers/select_weight_age_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class WeightAgeSelector extends ConsumerStatefulWidget {
  final bool gender;
  final bool weightOrAge;
  const WeightAgeSelector(
      {super.key, required this.weightOrAge, required this.gender});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _WeightHeightSelectorState();
}

class _WeightHeightSelectorState extends ConsumerState<WeightAgeSelector> {
  late int currentIndex;
  final int weightCorrection = 35;
  final int ageCorrection = 14;
  final int weightCount = 185;
  final int ageCount = 86;

  @override
  void initState() {
    currentIndex = widget.weightOrAge
        ? weightCount ~/ (widget.gender ? 5 : 9)
        : ageCount ~/ 4;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final weightProv = ref.watch(selectWeightProvider.notifier);
    final ageProv = ref.watch(selectAgeProvider.notifier);
    return Stack(
      alignment: Alignment.center,
      children: [
        CarouselSlider(
            items: List<Widget>.generate(
                widget.weightOrAge ? weightCount : ageCount, (int index) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 3),
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.13,
                      color: Theme.of(context).colorScheme.secondary,
                      child: Align(
                        alignment: Alignment.center,
                        child: FittedBox(
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: currentIndex == index ? 20 : 34,
                                bottom: currentIndex == index ? 20 : 31,
                                left: currentIndex == index ? 10 : 16,
                                right: currentIndex == index ? 10 : 17),
                            child: Text(
                              '${index + (widget.weightOrAge ? weightCorrection : ageCorrection)}',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.bold,
                                  fontSize: currentIndex == index ? 96 : 64,
                                  color: currentIndex == index
                                      ? Theme.of(context)
                                          .colorScheme
                                          .onSecondary
                                          .withOpacity(0.9)
                                      : Theme.of(context)
                                          .colorScheme
                                          .onSecondary
                                          .withOpacity(0.7)),
                            ),
                          ),
                        ),
                      )),
                ),
              );
            }),
            options: CarouselOptions(
              viewportFraction: 0.3,
              pageSnapping: false,
              initialPage: widget.weightOrAge
                  ? weightCount ~/ (widget.gender ? 5 : 9)
                  : ageCount ~/ 4,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                  widget.weightOrAge
                      ? weightProv.state = index + weightCorrection
                      : ageProv.state = index + ageCorrection;
                });
              },
            )),
        Padding(
          padding: const EdgeInsets.only(top: 13),
          child: Align(
            alignment: const Alignment(0, 0.18),
            child: Transform.rotate(
              angle: pi / 180,
              child: Image.asset(
                'assets/auth/weight_age_arrow.png',
                width: 31,
                height: 18,
              ),
            ),
          ),
        )
      ],
    );
  }
}
