import 'dart:async';
import 'dart:developer';

import 'package:fitflow/features/auth/auth_state_new/domain/models/app_user.dart';
import 'package:fitflow/features/auth/auth_state_new/domain/models/app_user_state.dart';
import 'package:fitflow/features/general_providers/supabase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'authstate_repo.g.dart';

@riverpod
Stream<AppUserState> authStateNEW(Ref ref) {
  final streamController = StreamController<AppUserState>();
  final supabaseClient = ref.watch(supabaseProvider);
  final authSubscription = supabaseClient.auth.onAuthStateChange.listen(
    (data) async {
      final Session? session = data.session;
      if (session != null) {
        streamController.add(const AppUserState.unknown());
        final userData = await supabaseClient
            .from('users')
            .select()
            .eq('email', session.user.email!);
        final user = AppUser.fromMap(userData.first);
        streamController.add(AppUserState.auth(user));
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
