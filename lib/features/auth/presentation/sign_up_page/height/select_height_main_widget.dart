import 'package:fitflow/features/auth/auth_sign_up/domain/providers/reg_user_provider.dart';
import 'package:fitflow/features/auth/auth_sign_up/presentation/height/height_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectHeightMainWidget extends ConsumerWidget {
  const SelectHeightMainWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final regUser = ref.watch(regUserProvider);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Image.asset('assets/leading/arrow.png')),
        centerTitle: true,
        title: FittedBox(
          child: Text(
            'Выберите ваш рост:',
            style: GoogleFonts.inter(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 24,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: Stack(
        children: [
          Stack(
            children: [
              Align(
                alignment: const Alignment(0, 0.1),
                child: Container(
                  width: 130,
                  height: 5,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              Align(
                alignment: const Alignment(0, -0.1),
                child: Container(
                  width: 130,
                  height: 5,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              Center(child: HeightSelector()),
            ],
          ),
          // const Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Padding(
          //     padding: EdgeInsets.only(bottom: 35),
          //     child: Text('cont button'),
          //   ),
          // ),
        ],
      ),
    );
  }
}
