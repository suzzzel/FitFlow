import 'package:fitflow/features/auth/auth_sign_up/domain/providers/select_level_provider.dart';
import 'package:fitflow/features/auth/auth_sign_up/presentation/level/level_button_content.dart';
import 'package:fitflow/features/auth/auth_sign_up/presentation/level/level_button_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      });
    }

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.height * 0.07),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 31),
            child: AnimatedContainer(
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 300),
              width: levelSelect.state == 'beginner'
                  ? MediaQuery.of(context).size.width * 0.8
                  : MediaQuery.of(context).size.width * 0.8,
              height: levelSelect.state == 'beginner'
                  ? MediaQuery.of(context).size.height * 0.09
                  : MediaQuery.of(context).size.height * 0.07,
              child: ElevatedButton(
                  onPressed: () {
                    changeLevel('beginner');
                  },
                  style: createLevelButtonStyle(
                      context: context,
                      level: levelSelect.state,
                      tempLevel: 'beginner'),
                  child: LevelButtonContent(
                    isPrimary: levelSelect.state == 'beginner' ? true : false,
                    level: 'Только\nначинаю',
                    iconLevel: 'assets/auth/beginner.png',
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 31),
            child: AnimatedContainer(
              curve: Curves.easeInOut,
              duration: const Duration(milliseconds: 300),
              width: levelSelect.state == 'skilled'
                  ? MediaQuery.of(context).size.width * 0.8
                  : MediaQuery.of(context).size.width * 0.8,
              height: levelSelect.state == 'skilled'
                  ? MediaQuery.of(context).size.height * 0.09
                  : MediaQuery.of(context).size.height * 0.07,
              child: ElevatedButton(
                  key: const Key('level_skilled'),
                  onPressed: () {
                    changeLevel('skilled');
                  },
                  style: createLevelButtonStyle(
                      context: context,
                      level: levelSelect.state,
                      tempLevel: 'skilled'),
                  child: LevelButtonContent(
                    isPrimary: levelSelect.state == 'skilled' ? true : false,
                    level: 'Занимался\nранее',
                    iconLevel: 'assets/auth/skilled.png',
                  )),
            ),
          ),
          AnimatedContainer(
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 300),
            width: levelSelect.state == 'master'
                ? MediaQuery.of(context).size.width * 0.8
                : MediaQuery.of(context).size.width * 0.8,
            height: levelSelect.state == 'master'
                ? MediaQuery.of(context).size.height * 0.09
                : MediaQuery.of(context).size.height * 0.07,
            child: ElevatedButton(
                onPressed: () {
                  changeLevel('master');
                },
                style: createLevelButtonStyle(
                    context: context,
                    level: levelSelect.state,
                    tempLevel: 'master'),
                child: LevelButtonContent(
                  isPrimary: levelSelect.state == 'master' ? true : false,
                  level: 'Занимаюсь\nрегулярно',
                  iconLevel: 'assets/auth/master.png',
                )),
          )
        ],
      ),
    );
  }
}
