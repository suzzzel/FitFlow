import 'dart:async';
import 'dart:developer';
import 'package:fitflow/features/auth/auth_state_new/domain/models/app_user.dart';
import 'package:fitflow/features/auth/auth_state_new/domain/models/app_user_state.dart';
import 'package:fitflow/features/general_comonents/drift_app_database_provider.dart';
import 'package:fitflow/features/general_comonents/supabase_provider.dart';
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
  final localDB = ref.watch(localDatabaseProvider);
  final localDBManager = localDB.managers;

  final authSubscription = supabaseClient.auth.onAuthStateChange.listen(
    (data) async {
      final Session? session = data.session;
      if (session != null) {
        if (data.event != AuthChangeEvent.passwordRecovery) {
          if (data.event != AuthChangeEvent.initialSession) {
            await Future.delayed(const Duration(seconds: 1));
          }
          // streamController.add(const AppUserState.unknown()); ??? пока так оставим
          for (int x = 0; x != 5; x++) {
            try {
              final userData = await supabaseClient
                  .from('app_users')
                  .select()
                  .eq('email', session.user.email!)
                  .maybeSingle();
              if (userData != null) {
                final user = AppUser.fromMap(userData);
                localSecureStorage.write(key: 'name', value: user.name);
                localDBManager.userInfoTable.delete();
                localDBManager.userInfoTable.create((value) => value(
                    id: user.id!,
                    createdAt: user.created_at!,
                    name: user.name!,
                    age: user.age!,
                    email: user.email!,
                    goal: user.goal!,
                    sex: user.sex!,
                    height: user.height!,
                    weight: user.weight!,
                    level: user.level!));
                final print2 = await localDBManager.userInfoTable.get();
                log(print2.single.toString());
                log('online');
                streamController.add(AppUserState.auth(user));
                streamController.close();
                break;
              } else {
                streamController.add(const AppUserState.unauth());
              }
            } catch (e) {
              if (x != 4) {
                log('fail № $x');
                continue;
              } else {
                String? name = await localSecureStorage.read(key: 'name');
                if (name != null) {
                  try {
                    final AppUser offlineUserMode = await localDBManager
                        .userInfoTable
                        .get()
                        .then((user) => AppUser(
                            id: user.single.id,
                            created_at: user.single.createdAt,
                            name: user.single.name,
                            age: user.single.age,
                            email: user.single.email,
                            goal: user.single.goal,
                            sex: user.single.sex,
                            height: user.single.height,
                            weight: user.single.weight,
                            level: user.single.level,
                            offlineMode: true));
                    streamController.add(AppUserState.auth(offlineUserMode));
                  } catch (e) {
                    log(e.runtimeType.toString());
                  }
                }
              }
            }
          }
        }
      } else {
        streamController.add(const AppUserState.unauth());
      }
    },
  );

  streamController.onCancel = () {
    authSubscription.cancel();
  };
  return streamController.stream;
}
