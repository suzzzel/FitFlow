import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class WeightHeightSelector extends ConsumerStatefulWidget {
  const WeightHeightSelector({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _WeightHeightSelectorState();
}

class _WeightHeightSelectorState extends ConsumerState<WeightHeightSelector> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: List<Widget>.generate(100, (int index) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Container(
                  width: 131,
                  height: 120,
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
                          '${index + 1}',
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
          onPageChanged: (index, reason) {
            setState(() {
              currentIndex = index;
            });
          },
        ));
  }
}
