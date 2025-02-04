import 'package:fitflow/features/auth/auth_sign_out/presentation/sign_out_button.dart';
import 'package:fitflow/features/auth/auth_state_new/data/authstate_repo.dart';
import 'package:fitflow/features/themes/data/models/theme_dark.dart';
import 'package:fitflow/features/themes/domain/providers/theme_app_domain_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeWidget extends ConsumerWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(authStateProvider);
    final user = userState.value!.user!;
    final themeApp = ref.watch(themeProvider);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SignOutButton(),
            Text(user.name!),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: 'Offline mode',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.onPrimary),
                    children: [
                      TextSpan(
                          text: ' ${user.offlineMode ?? 'false'}',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: user.offlineMode == true
                                  ? Colors.red
                                  : Colors.green))
                    ])),
            Switch(
                value: themeApp == darkTheme,
                onChanged: (newValue) {
                  ref.read(themeProvider.notifier).changeTheme();
                })
          ],
        ),
      ),
    );
  }
}
