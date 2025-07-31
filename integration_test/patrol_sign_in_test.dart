import 'package:fitflow/app_keys.dart';
import 'package:fitflow/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() {
  patrolSetUp(() async {
    await Supabase.initialize(
        url: APPKEYS.SUPABASE_URL, anonKey: APPKEYS.SUPABASE_ANON_KEY);
  });

  patrolTest('Пользователь совершает успешный вход в свой аккаунт с 1 - раза',
      framePolicy: LiveTestWidgetsFlutterBindingFramePolicy.fullyLive,
      ($) async {
    await $.pumpWidgetAndSettle(const ProviderScope(child: MainApp()));

    await $(#sign_in_first_button).tap();

    await $(#emain_sign_in).enterText('suzzz');
    await $(#password_sign_in).enterText('1337228');

    await $(#sign_in_second_button).tap();

    expect(find.text('Главная'), findsOneWidget);
  });

  patrolTest('Пользователь совершает попытку неуспешного входа',
      framePolicy: LiveTestWidgetsFlutterBindingFramePolicy.fullyLive,
      ($) async {
    await $.pumpWidgetAndSettle(const ProviderScope(child: MainApp()));

    await $(#sign_in_first_button).tap();
    await $(#emain_sign_in).enterText('fake_login');
    await $(#password_sign_in).enterText('fakepassword');

    await $(#sign_in_second_button).tap();
    expect(find.text('Неверное имя пользователя или email'), findsOneWidget);
  });
}
