import 'package:flutter/material.dart';
import 'package:app_innova/routes.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  StartScreenState createState() => StartScreenState();
}

class StartScreenState extends State<StartScreen> {
  @override
  void initState() {
    super.initState();
    // Redirigir a HomeScreen después de 4 segundos
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacementNamed(context, AppRoutes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFBA93CA), Color(0xFF936CAD)], // Gradiente de fondo
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            _LogoWidget(),
            SizedBox(height: 20),
            _LoadingIndicator(),
          ],
        ),
      ),
    );
  }
}

// Widget para mostrar el logo centrado
class _LogoWidget extends StatelessWidget {
  const _LogoWidget();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/innova2.png",
      width: 200,
    );
  }
}

// Widget para el indicador de carga
class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator();

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
    );
  }
}
