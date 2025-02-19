import 'package:fitflow/features/auth/auth_sign_up/domain/providers/select_gender_provider.dart';
import 'package:fitflow/features/auth/auth_sign_up/presentation/gender/next_step_after_gender_button.dart';
import 'package:fitflow/features/auth/auth_sign_up/presentation/gender/select_gender_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectGenderMainWidget extends ConsumerWidget {
  const SelectGenderMainWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final genderController = ref.watch(selectGenderProvider.notifier);
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              context.pop();
              genderController.state = 0;
            },
            icon: Image.asset('assets/leading/arrow.png')),
        centerTitle: true,
        title: FittedBox(
          child: Text(
            'Выберите ваш пол',
            style: GoogleFonts.inter(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 24,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: Stack(
        children: [
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 35),
              child: NextStepAfterGenderButton(),
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SelectGenderButton(
                  gender: true,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.083,
                ),
                const SelectGenderButton(
                  gender: false,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
