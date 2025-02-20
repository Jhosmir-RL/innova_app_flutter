import 'package:flutter/material.dart';
import 'package:app_innova/routes.dart';

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.start, // Inicia en StartScreen
      routes: AppRoutes.routes, // Usa las rutas definidas en routes.dart
    );
  }
}
