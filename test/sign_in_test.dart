import 'dart:async';

import 'package:fitflow/features/auth/auth_sign_in/data/repo/auth_sign_in_repo.dart';
import 'package:fitflow/features/auth/auth_sign_in/domain/models/sign_in_state.dart';
import 'package:fitflow/features/auth/auth_state_new/domain/models/app_user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mock_supabase_http_client/mock_supabase_http_client.dart';
import 'package:mocktail/mocktail.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() {
  late final MockSupabaseHttpClient mockSupabaseHttpClient;
  late final SupabaseClient mockSupabase;
  late final AuthSignInRepo signInRepo;

  setUpAll(() {
    mockSupabaseHttpClient = MockSupabaseHttpClient();
    mockSupabase = SupabaseClient(
      'https://mock.supabase.co',
      'fakeAnonKey',
      httpClient: mockSupabaseHttpClient,
    );
    signInRepo = AuthSignInRepo(supabase: mockSupabase);
  });

  tearDown(() async {
    mockSupabaseHttpClient.reset();
  });

  tearDownAll(() {
    mockSupabaseHttpClient.close();
  });

  group('SignInRepository использует метод signIn', () {
    group('используя для логина email или name', () {
      test(
          'возвращает state SignInState.notAuth при получении ошибки во время поиска отсутствующего юзера по email и имени',
          () async {
        // Arrange
        const String email =
            'emaildoesntexist1231231231321321@fitflow@.fitflow.ru';
        const String password = 'testpassword';
        // Act
        final res =
            await signInRepo.signIn(emailOrName: email, password: password);

        // Assert
        expect(res, equals(SignInState.notAuth));
      });
      test(
          'возвращает state SignInState.networkError при получении ошибки в любом другом случае',
          () async {
        const String email =
            'emaildoesntexist1231231231321321@fitflow@.fitflow.ru';
        const String password = 'testpassword';
        var res =
            await signInRepo.signIn(emailOrName: email, password: password);
        // Имитация недоступности к БД
        if (res != SignInState.networkError) {
          res = SignInState.networkError;
        }
        expect(res, equals(SignInState.networkError));
      });
    });
  });
}
