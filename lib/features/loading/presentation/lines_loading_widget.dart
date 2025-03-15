import 'package:flutter/material.dart';

class LinesLoadingWidget extends StatefulWidget {
  const LinesLoadingWidget({super.key});

  @override
  State<LinesLoadingWidget> createState() => _LinesLoadingWidgetState();
}

class _LinesLoadingWidgetState extends State<LinesLoadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 15));
    _animation = Tween<double>(
      begin: 0,
      end: 2 * 3.141,
    ).animate(_controller);
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) => Transform.rotate(
              origin: const Offset(0, 0),
              angle: _animation.value,
              child:
                  Image.asset('assets/loading/lines.png', fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
