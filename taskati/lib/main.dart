import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskati/core/theme/theme_app.dart';
import 'package:taskati/splash_view.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('user');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: applightmode,
        darkTheme: appdarktmode,
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        home: const SplashView());
  }
}
