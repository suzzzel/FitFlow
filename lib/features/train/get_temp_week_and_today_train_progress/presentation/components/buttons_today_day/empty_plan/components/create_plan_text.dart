import 'package:fitflow/features/auth/auth_state_new/data/authstate_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class CreatePlanTextInsideButton extends ConsumerWidget {
  const CreatePlanTextInsideButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(authStateProvider);
    return Padding(
      padding: const EdgeInsets.only(left: 13),
      child: TextButton(
        onPressed: () {
          !userState.value!.user!.offlineMode!
              ? context.goNamed('newtrainplan')
              : showTopSnackBar(
                  Overlay.of(context),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(99),
                        gradient: LinearGradient(colors: [
                          Theme.of(context).colorScheme.errorContainer,
                          Theme.of(context).colorScheme.error,
                        ])),
                    child: Center(
                      child: Text(
                        'Отсутствует подключение к сети',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                  ));
        },
        style: const ButtonStyle(
            elevation: WidgetStatePropertyAll(0),
            overlayColor: WidgetStatePropertyAll(Colors.transparent),
            padding: WidgetStatePropertyAll(EdgeInsets.all(0))),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.40,
          child: FittedBox(
            child: Text('Создать программу',
                textScaler: const TextScaler.linear(1),
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
