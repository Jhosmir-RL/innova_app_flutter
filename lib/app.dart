import 'package:flutter/material.dart';
import 'package:app_innova/home_view/start_screen.dart';
import 'package:app_innova/home_view/home_screen.dart';


class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      title: 'Innova System',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeScreen(),  // Asegúrate de que tiene los paréntesis
    );
  }
}
