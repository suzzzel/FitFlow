import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageIndicatorHomeScreen extends StatelessWidget {
  final PageController pageDotController;
  const PageIndicatorHomeScreen({super.key, required this.pageDotController});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SmoothPageIndicator(
        controller: pageDotController,
        count: 2,
        effect: const WormEffect(
          dotHeight: 3,
          dotWidth: 35,
        ),
      ),
    );
  }
}
