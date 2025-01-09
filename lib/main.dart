import 'package:flutter/material.dart';
import 'package:github_feed/core/app_injector.dart';
import 'package:github_feed/core/constants/theme/app_theme.dart';
import 'package:github_feed/core/router/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInjector.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final _router = AppRouter.router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppThemeDefault().data,
      routerConfig: _router,
    );
  }
}
