// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:fitflow/features/auth/auth_sign_up/domain/models/sign_up_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:fitflow/features/auth/auth_sign_up/data/repo/auth_sign_up_data_impl.dart';
import 'package:fitflow/features/auth/auth_state_new/domain/models/app_user.dart';

class AuthSignUpData implements AuthSignUpDataImpl {
  final SupabaseClient supabase;
  AuthSignUpData({
    required this.supabase,
  });

  @override
  Future<bool> signUp(
      {required String email,
      required String password,
      required AppUser user}) async {
    try {
      final AuthResponse res =
          await supabase.auth.signUp(password: password, email: email);
      final Session? session = res.session;
      final User? userSupabase = res.user;
      if (userSupabase!.aud == 'authenticated') {
        try {
          final Map<String, dynamic> userToSupabase = user.toMap();
          userToSupabase.remove('id');
          await supabase.from('users').insert(userToSupabase);
          await Future.delayed(const Duration(seconds: 1));
          return true;
        } catch (e) {
          final error = e as PostgrestException;
          if (error.code == '23505') {
            rethrow;
          }
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  @override
  Future<SignUpState> signUpNEW(
      {required String email,
      required String password,
      required AppUser user}) async {
    try {
      final AuthResponse res =
          await supabase.auth.signUp(password: password, email: email);
      final Session? session = res.session;
      final User? userSupabase = res.user;
      if (userSupabase!.aud == 'authenticated') {
        try {
          final Map<String, dynamic> userToSupabase = user.toMap();
          userToSupabase.remove('id');
          await supabase.from('users').insert(userToSupabase);
          await Future.delayed(const Duration(seconds: 1));
          return SignUpState.success;
        } catch (e) {
          final error = e as PostgrestException;
          if (error.code == '23505') {
            return SignUpState.userAlreadyExist;
          }
          return SignUpState.networkError;
        }
      } else {
        return SignUpState.networkError;
      }
    } catch (e) {
      return SignUpState.userAlreadyExist;
    }
  }
}
