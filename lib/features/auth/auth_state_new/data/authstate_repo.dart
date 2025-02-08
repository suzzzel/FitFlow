import 'dart:async';
import 'dart:developer';

import 'package:fitflow/features/auth/auth_state_new/domain/models/app_user.dart';
import 'package:fitflow/features/auth/auth_state_new/domain/models/app_user_state.dart';
import 'package:fitflow/features/general_providers/supabase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'authstate_repo.g.dart';

@riverpod
Stream<AppUserState> authState(Ref ref) {
  final streamController = StreamController<AppUserState>();
  final supabaseClient = ref.watch(supabaseProvider);
  const localSecureStorage = FlutterSecureStorage();
  final authSubscription = supabaseClient.auth.onAuthStateChange.listen(
    (data) async {
      final Session? session = data.session;
      log(data.event.toString());
      if (session != null) {
        if (data.event != AuthChangeEvent.passwordRecovery) {
          if (data.event != AuthChangeEvent.initialSession) {
            await Future.delayed(const Duration(seconds: 1));
          }
          streamController.add(const AppUserState.unknown());
          try {
            final userData = await supabaseClient
                .from('users')
                .select()
                .eq('email', session.user.email!)
                .maybeSingle();
            if (userData != null) {
              final user = AppUser.fromMap(userData);
              localSecureStorage.write(key: 'name', value: user.name);
              streamController.add(AppUserState.auth(user));
            } else {
              streamController.add(const AppUserState.unauth());
            }
          } catch (e) {
            String? name = await localSecureStorage.read(key: 'name');
            if (name != null) {
              streamController.add(
                  AppUserState.auth(AppUser(name: name, offlineMode: true)));
            }
          }
        }
      } else {
        streamController.add(const AppUserState.unauth());
      }
    },
  );

  streamController.onCancel = () {
    log('cancel');
    authSubscription.cancel();
  };
  return streamController.stream;
}
