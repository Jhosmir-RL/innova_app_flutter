import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFBA93CA), Color(0xFF936CAD)], // Gradiente vertical
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo de la app
              Image.asset(
                "assets/images/innova2.png",
                width: 260,
              ),
              // Título
              Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  "Bienvenido",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ),
              // Descripción
              Container(
                margin: EdgeInsets.symmetric(horizontal: 60),
                child: Text(
                  "Unete a nuestra aplicacion y tendras una gran experiencia de compras en linea con uso de la inteligencia artificial.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white54,
                  ),
                  textAlign: TextAlign.center,  // Asegura que el texto esté centrado
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
