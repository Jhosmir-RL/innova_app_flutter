import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:app_innova/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(DemoApp(isLoggedIn: isLoggedIn));
}

class DemoApp extends StatelessWidget {
  final bool isLoggedIn;

  const DemoApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: isLoggedIn ? AppRoutes.home : AppRoutes.start,
      routes: AppRoutes.routes,
    );
  }
}
