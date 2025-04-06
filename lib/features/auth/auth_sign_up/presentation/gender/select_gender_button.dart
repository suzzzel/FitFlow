import 'dart:math';

import 'package:fitflow/features/auth/auth_sign_up/domain/providers/select_gender_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectGenderButton extends ConsumerWidget {
  final bool gender;
  const SelectGenderButton({
    super.key,
    required this.gender,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final genderController = ref.watch(selectGenderProvider);
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.375,
        height: MediaQuery.of(context).size.width * 0.375,
        decoration: BoxDecoration(
            border: Border.all(
                width: 2, color: Theme.of(context).colorScheme.onPrimary),
            shape: BoxShape.circle,
            gradient: gender
                ? genderController == 1
                    ? LinearGradient(colors: [
                        Theme.of(context).colorScheme.primaryFixed,
                        Theme.of(context).colorScheme.secondaryFixed
                      ], transform: const GradientRotation(pi / 4))
                    : null
                : genderController == 2
                    ? LinearGradient(colors: [
                        Theme.of(context).colorScheme.primaryFixed,
                        Theme.of(context).colorScheme.secondaryFixed
                      ], transform: const GradientRotation(pi / 4))
                    : null,
            color: Colors.white),
        child: IconButton(
          onPressed: () {
            ref.read(selectGenderProvider.notifier).state = gender ? 1 : 2;
          },
          icon: ShaderMask(
            blendMode: BlendMode.srcATop,
            shaderCallback: (bounds) => gender
                ? genderController == 1
                    ? const LinearGradient(colors: [Colors.white, Colors.white])
                        .createShader(bounds)
                    : LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                            Theme.of(context).colorScheme.primaryFixed,
                            Theme.of(context).colorScheme.secondaryFixed,
                          ]).createShader(bounds)
                : genderController == 2
                    ? const LinearGradient(colors: [Colors.white, Colors.white])
                        .createShader(bounds)
                    : LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                            Theme.of(context).colorScheme.primaryFixed,
                            Theme.of(context).colorScheme.secondaryFixed,
                          ]).createShader(bounds),
            child: Image.asset(
              gender
                  ? 'assets/auth/male_gender.png'
                  : 'assets/auth/female_gender.png',
            ),
          ),
        ),
      ),
    );
  }
}
