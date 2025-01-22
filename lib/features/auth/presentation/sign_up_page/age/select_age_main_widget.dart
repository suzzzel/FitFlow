import 'package:fitflow/features/auth/auth_sign_up/domain/providers/reg_user_provider.dart';
import 'package:fitflow/features/auth/auth_sign_up/presentation/components/next_step_after_weight_age_select_button.dart';
import 'package:fitflow/features/auth/auth_sign_up/presentation/components/weight_age_selector.dart';
import 'package:fitflow/features/auth/presentation/sign_up_page/age/age_first_text.dart';
import 'package:fitflow/features/auth/presentation/sign_up_page/age/age_second_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectAgeMainWidget extends ConsumerWidget {
  const SelectAgeMainWidget({super.key});

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
            'Выберите ваш возраст',
            style: GoogleFonts.inter(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 24,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: Stack(
        children: [
          const AgeFirstText(),
          WeightAgeSelector(
            weightOrAge: false,
            gender: regUser.sex!,
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 35),
              child: NextStepAfterWeightAgeSelectButton(
                weightOrAge: false,
              ),
            ),
          ),
          const AgeSecondText()
        ],
      ),
    );
  }
}
