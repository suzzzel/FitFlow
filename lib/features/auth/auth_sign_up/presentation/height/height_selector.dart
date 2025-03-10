import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitflow/features/auth/auth_sign_up/domain/providers/select_height_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class HeightSelector extends ConsumerStatefulWidget {
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
    return Align(
      alignment: const Alignment(0, 0.35),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: CarouselSlider(
            items: List<Widget>.generate(100, (int index) {
              return Center(
                child: SizedBox(
                    width: heightMainProv.state == index
                        ? MediaQuery.of(context).size.height * 0.175
                        : index == heightMainProv.state - 1 ||
                                index == heightMainProv.state + 1
                            ? MediaQuery.of(context).size.height * 0.15
                            : MediaQuery.of(context).size.height * 0.12,
                    child: FittedBox(
                      fit: BoxFit.cover,
                      child: Text(
                        '${index + (heightCorrection)}',
                        textAlign: TextAlign.center,
                        textScaler: const TextScaler.linear(1),
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
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
                    )),
              );
            }),
            options: CarouselOptions(
              viewportFraction: 0.2,
              pageSnapping: false,
              scrollDirection: Axis.vertical,
              initialPage: heightMainProv.state,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index + heightCorrection;
                  heightMainProv.state = index;
                });
              },
            )),
      ),
    );
  }
}
