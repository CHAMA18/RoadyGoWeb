import 'package:flutter/material.dart';
import 'package:roadygo_website/theme.dart';
import 'package:roadygo_website/nav.dart';

/// Main entry point for Roady GO
void main() {
  runApp(const RoadyGoApp());
}

class RoadyGoApp extends StatelessWidget {
  const RoadyGoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Roady GO - Ultra-Premium Rescue',
      debugShowCheckedModeBanner: false,
      theme: roadyGoTheme,
      darkTheme: roadyGoTheme,
      themeMode: ThemeMode.dark,
      routerConfig: AppRouter.router,
    );
  }
}
