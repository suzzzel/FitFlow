import 'dart:developer';

import 'package:fitflow/features/auth/auth_sign_up/domain/providers/select_level_provider.dart';
import 'package:fitflow/features/auth/auth_sign_up/presentation/level/level_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class LevelSelector extends ConsumerStatefulWidget {
  const LevelSelector({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LevelSelectorState();
}

class _LevelSelectorState extends ConsumerState<LevelSelector> {
  @override
  Widget build(BuildContext context) {
    final levelSelect = ref.watch(selectLevelProvider.notifier);

    void changeLevel(String newLevel) {
      setState(() {
        levelSelect.state = newLevel;
        log(levelSelect.state);
      });
    }

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: AnimatedSize(
                duration: const Duration(milliseconds: 500),
                curve: Curves.decelerate,
                child: ElevatedButton(
                    onPressed: () {
                      changeLevel('beginner');
                    },
                    style: ButtonStyle(
                        fixedSize: WidgetStatePropertyAll(Size(
                          levelSelect.state == 'beginner' ? 300 : 260,
                          levelSelect.state == 'beginner' ? 80 : 60,
                        )),
                        elevation: const WidgetStatePropertyAll(0),
                        backgroundColor: WidgetStatePropertyAll(
                            Theme.of(context).colorScheme.surface),
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(
                                width: 2,
                                color: levelSelect.state == 'beginner'
                                    ? Theme.of(context).colorScheme.secondary
                                    : Theme.of(context)
                                        .colorScheme
                                        .tertiary
                                        .withOpacity(1))))),
                    child: LevelButtonStyle(
                      isPrimary: levelSelect.state == 'beginner' ? true : false,
                      level: 'Новичок',
                      iconLevel: 'assets/auth/beginner.png',
                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: AnimatedSize(
              duration: const Duration(milliseconds: 500),
              curve: Curves.decelerate,
              alignment: Alignment.center,
              child: ElevatedButton(
                  onPressed: () {
                    changeLevel('skilled');
                  },
                  style: ButtonStyle(
                      elevation: const WidgetStatePropertyAll(0),
                      fixedSize: WidgetStatePropertyAll(Size(
                        levelSelect.state == 'skilled' ? 300 : 260,
                        levelSelect.state == 'skilled' ? 80 : 60,
                      )),
                      backgroundColor: WidgetStatePropertyAll(
                          Theme.of(context).colorScheme.surface),
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(
                              width: 2,
                              color: levelSelect.state == 'skilled'
                                  ? Theme.of(context).colorScheme.secondary
                                  : Theme.of(context)
                                      .colorScheme
                                      .tertiary
                                      .withOpacity(1))))),
                  child: LevelButtonStyle(
                    isPrimary: levelSelect.state == 'skilled' ? true : false,
                    level: 'Опытный',
                    iconLevel: 'assets/auth/skilled.png',
                  )),
            ),
          ),
          AnimatedSize(
            duration: const Duration(milliseconds: 500),
            curve: Curves.decelerate,
            child: ElevatedButton(
                onPressed: () {
                  changeLevel('master');
                },
                style: ButtonStyle(
                    fixedSize: WidgetStatePropertyAll(Size(
                      levelSelect.state == 'master' ? 300 : 260,
                      levelSelect.state == 'master' ? 80 : 60,
                    )),
                    elevation: const WidgetStatePropertyAll(0),
                    backgroundColor: WidgetStatePropertyAll(
                        Theme.of(context).colorScheme.surface),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                            width: 2,
                            color: levelSelect.state == 'master'
                                ? Theme.of(context).colorScheme.secondary
                                : Theme.of(context)
                                    .colorScheme
                                    .tertiary
                                    .withOpacity(1))))),
                child: LevelButtonStyle(
                  isPrimary: levelSelect.state == 'master' ? true : false,
                  level: 'Мастер',
                  iconLevel: 'assets/auth/master.png',
                )),
          )
        ],
      ),
    );
  }
}
