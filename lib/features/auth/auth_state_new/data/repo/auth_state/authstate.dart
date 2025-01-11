import 'package:fitflow/features/general_providers/supabase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'authstate.g.dart';

@riverpod
Stream<AuthState> authState(Ref ref) {
  final supabaseClient = ref.watch(supabaseProvider);
  return supabaseClient.auth.onAuthStateChange;
}
