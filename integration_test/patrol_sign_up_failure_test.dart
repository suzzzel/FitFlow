import 'package:fitflow/app_keys.dart';
import 'package:fitflow/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() {
  patrolSetUp(() async {
    await Supabase.initialize(
        url: APPKEYS.SUPABASE_URL, anonKey: APPKEYS.SUPABASE_ANON_KEY);
  });
  patrolTest(
      'Пользователь проходит неуспешный процесс регистрации нового аккаунта (аккаунт уже существует)',
      framePolicy: LiveTestWidgetsFlutterBindingFramePolicy.fullyLive,
      ($) async {
    await $.pumpWidgetAndSettle(const ProviderScope(child: MainApp()));
    await $(#sign_up_first_button).tap();
    await $(#female_gender).tap();
    await $(#confirm_gender).tap();
    await $(#pop_sign_button).tap();
    await $(#male_gender).tap();
    await $(#confirm_gender).tap();
    await $('85').scrollTo(view: $(#weight_selector).$(Scrollable));
    await $(#confirm_weight).tap();
    await $('182').scrollTo(view: $(#height_selector).$(Scrollable));
    await $(#confrim_height).tap();
    await $('26').scrollTo(
        view: $(#age_selector).$(Scrollable),
        scrollDirection: AxisDirection.left);
    await $(#confirm_age).tap();
    await $(#confirm_goal).tap();
    await $(#level_skilled).tap();
    await $(#confirm_level).tap();
    await $(#name_imput_sign_up).enterText('testUser');
    await $(#email_imput_sign_up).enterText('testUser@mail.ru');
    await $(#password_imput_sign_up).enterText('123321');
    await $(#password_repeat_imput_sign_up).enterText('123321');
    await $(#confirm_sign_up).tap();
    expect(find.text('Создать аккаунт'), findsOneWidget);
  });
}
