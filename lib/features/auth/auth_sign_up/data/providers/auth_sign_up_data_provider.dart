import 'package:fitflow/features/auth/auth_sign_up/data/repo/auth_sign_up_data.dart';
import 'package:fitflow/features/general_providers/supabase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authSignUpProvider = Provider<AuthSignUpData>((ref) {
  final supabaseClient = ref.watch(supabaseProvider);
  return AuthSignUpData(supabase: supabaseClient);
});
