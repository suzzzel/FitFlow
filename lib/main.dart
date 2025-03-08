import 'package:fitflow/app_keys.dart';
import 'package:fitflow/features/themes/domain/providers/theme_app_domain_provider.dart';
import 'package:fitflow/navigation/new_router.dart';
import 'package:fitflow/navigation/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: APPKEYS.SUPABASE_URL, anonKey: APPKEYS.SUPABASE_ANON_KEY);
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final config = ref.watch(newRouterProvider);
    final themeApp = ref.watch(themeProvider);
    return MaterialApp.router(
      routerConfig: config,
      theme: themeApp,
    );
  }
}
