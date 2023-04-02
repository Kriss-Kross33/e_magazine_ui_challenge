import 'package:e_magazine_ui_challenge/src/ui/ui.dart';
import 'package:e_magazine_ui_challenge/src/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.defaultTheme,
      home: const MagazineHomeScreen(),
    );
  }
}
