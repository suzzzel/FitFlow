import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ViewProgressIconInsideButton extends StatelessWidget {
  const ViewProgressIconInsideButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          decoration:
              const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: FittedBox(
            child: IconButton(
              onPressed: () {
                context.goNamed('/progresshome');
              },
              icon: Image.asset('assets/home/view_progress.png'),
            ),
          )),
    );
  }
}
