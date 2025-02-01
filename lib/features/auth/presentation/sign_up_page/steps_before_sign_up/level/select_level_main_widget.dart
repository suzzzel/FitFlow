import 'package:fitflow/features/auth/auth_sign_up/domain/providers/reg_user_provider.dart';
import 'package:fitflow/features/auth/auth_sign_up/presentation/level/level_selector.dart';
import 'package:fitflow/features/auth/auth_sign_up/presentation/level/next_step_after_level.dart';
import 'package:fitflow/features/auth/presentation/sign_up_page/steps_before_sign_up/level/level_first_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectLevelMainWidget extends ConsumerWidget {
  const SelectLevelMainWidget({super.key});

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
            'Уровень подготовки',
            style: GoogleFonts.inter(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 24,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
      body: const Stack(
        children: [
          Align(alignment: Alignment(0, -0.605), child: LevelFirstText()),
          Align(alignment: Alignment(0, 0.09), child: LevelSelector()),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 35),
              child: NextStepAfterLevelSelectButton(),
            ),
          ),
        ],
      ),
    );
  }
}
