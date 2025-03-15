import 'package:fitflow/features/auth/auth_sign_up/domain/providers/select_weight_age_provider.dart';
import 'package:fitflow/features/auth/presentation/reset_password_page/enter_recovery_code/network_error_snackbar.dart';
import 'package:fitflow/features/home/home_main_screen/domain/providers/home_update_indicators_domain_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class NextStepAfterAgeWeightHomeButton extends ConsumerStatefulWidget {
  final bool weightOrAge;
  const NextStepAfterAgeWeightHomeButton(
      {super.key, required this.weightOrAge});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NextStepAfterAgeHeightHomeButtonState();
}

class _NextStepAfterAgeHeightHomeButtonState
    extends ConsumerState<NextStepAfterAgeWeightHomeButton> {
  bool isLoading = false;

  void _updateIndicator(int newValue) async {
    setState(() {
      isLoading = !isLoading;
    });
    final response = widget.weightOrAge
        ? await ref
            .read(homeUpdateIndicatorsDomainProvider)
            .updateWeight(newWeight: newValue)
        : await ref
            .read(homeUpdateIndicatorsDomainProvider)
            .updateAge(newAge: newValue);
    if (!response) {
      setState(() {
        isLoading = !isLoading;
        showNetworkError(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final prov = widget.weightOrAge
        ? ref.watch(selectWeightProvider)
        : ref.watch(selectAgeProvider);
    return Padding(
      padding: const EdgeInsets.only(
        left: 21,
        right: 21,
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 750),
        width: !isLoading ? MediaQuery.of(context).size.width : 70,
        height: !isLoading ? 70 : 40,
        child: ElevatedButton(
            onPressed: !isLoading
                ? () async {
                    _updateIndicator(prov);
                  }
                : () {},
            style: ButtonStyle(
                fixedSize: WidgetStatePropertyAll(
                    Size(MediaQuery.of(context).size.width, 70)),
                backgroundColor: WidgetStatePropertyAll(
                  prov != 0
                      ? Theme.of(context).colorScheme.secondary
                      : Theme.of(context).colorScheme.tertiary,
                )),
            child: !isLoading
                ? FittedBox(
                    child: Text(
                      'Продолжить',
                      textScaler: const TextScaler.linear(1),
                      style: GoogleFonts.inter(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                : const SizedBox(
                    width: 30,
                    height: 30,
                    child: FittedBox(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    ),
                  )),
      ),
    );
  }
}
