import 'package:flutter/material.dart';

class BackgroundWidget extends StatefulWidget {
  const BackgroundWidget({super.key});

  @override
  State<BackgroundWidget> createState() => _BackgroundWidgetState();
}

class _BackgroundWidgetState extends State<BackgroundWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 30));
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
    return Transform.scale(
      scale: 2.6,
      child: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) => Transform.rotate(
              origin: const Offset(0, -10),
              angle: _animation.value,
              child: Image.asset('assets/logo/waves.png', fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
