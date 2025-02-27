import 'package:carousel_slider/carousel_slider.dart';
import 'package:fitflow/features/auth/auth_sign_up/domain/providers/select_height_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class HeightSelector extends ConsumerStatefulWidget {
  final int? initialChange;
  const HeightSelector({super.key, this.initialChange});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AgeSelectorState();
}

class _AgeSelectorState extends ConsumerState<HeightSelector> {
  final int heightCorrection = 120;
  late int currentIndex;

  @override
  void initState() {
    currentIndex = widget.initialChange == null
        ? 50
        : widget.initialChange! - heightCorrection;
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
                    width: currentIndex == index
                        ? MediaQuery.of(context).size.height * 0.175
                        : index == currentIndex - 1 || index == currentIndex + 1
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
                            fontSize: currentIndex == index
                                ? 80
                                : index == currentIndex - 1 ||
                                        index == currentIndex + 1
                                    ? 70
                                    : 60,
                            color: currentIndex == index
                                ? Theme.of(context).colorScheme.secondary
                                : index == currentIndex - 1 ||
                                        index == currentIndex + 1
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
              initialPage: currentIndex,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                  heightMainProv.state = index + heightCorrection;
                });
              },
            )),
      ),
    );
  }
}
