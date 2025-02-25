import 'dart:developer';

import 'package:fitflow/features/auth/auth_sign_up/domain/providers/select_weight_age_provider.dart';
import 'package:fitflow/features/home/home_main_screen/domain/providers/home_update_indicators_domain_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class NextStepAfterAgeHomeButton extends ConsumerWidget {
  final bool weightOrAge;
  const NextStepAfterAgeHomeButton({super.key, required this.weightOrAge});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeUpdateIndicatorProvider =
        ref.watch(homeUpdateIndicatorsDomainProvider);
    final prov = ref.watch(selectAgeProvider);
    return Padding(
      padding: const EdgeInsets.only(
        left: 21,
        right: 21,
      ),
      child: ElevatedButton(
          onPressed: weightOrAge
              ? () {}
              : () async {
                  final response =
                      await homeUpdateIndicatorProvider.updateAge(newAge: prov);
                  if (response) {
                    log('ok');
                  } else {
                    log('pizda');
                  }
                },
          style: ButtonStyle(
              fixedSize: WidgetStatePropertyAll(
                  Size(MediaQuery.of(context).size.width, 70)),
              backgroundColor: WidgetStatePropertyAll(
                prov != 0
                    ? Theme.of(context).colorScheme.secondary
                    : Theme.of(context).colorScheme.tertiary,
              )),
          child: FittedBox(
            child: Text(
              'Продолжить',
              textScaler: const TextScaler.linear(1),
              style: GoogleFonts.inter(
                  color: Theme.of(context).colorScheme.onSecondary,
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
            ),
          )),
    );
  }
}

class NewButtonTest extends ConsumerStatefulWidget {
  final bool weightOrAge;
  const NewButtonTest({super.key, required this.weightOrAge});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewButtonTestState();
}

class _NewButtonTestState extends ConsumerState<NewButtonTest> {
  bool isLoading = false;

  void _updateAge(int newAge) async {
    setState(() {
      isLoading = !isLoading;
    });
    final response = await ref
        .read(homeUpdateIndicatorsDomainProvider)
        .updateAge(newAge: newAge);
    if (response) {
    } else {
      setState(() {
        isLoading = !isLoading;
        log('message'); // DO IT DO IT DO IT DO IT DO IT DO IT DO IT DO IT DO IT DO IT DO IT DO IT DO IT DO IT DO IT
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final prov = ref.watch(selectAgeProvider);
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
            onPressed: widget.weightOrAge
                ? () {}
                : !isLoading
                    ? () async {
                        _updateAge(prov);
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
