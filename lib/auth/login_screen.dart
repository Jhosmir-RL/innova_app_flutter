import 'package:flutter/material.dart';
import 'package:app_innova/routes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const _LoginHeader(),
            const SizedBox(height: 20),
            const _LoginForm(),
            const SizedBox(height: 20),
            _LoginActions(),
          ],
        ),
      ),
    );
  }
}

// Widget para el encabezado de la pantalla
class _LoginHeader extends StatelessWidget {
  const _LoginHeader();

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Iniciar Sesión",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}

// Widget para el formulario de inicio de sesión
class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextField(
          decoration: InputDecoration(labelText: "Correo electrónico"),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 10),
        const TextField(
          decoration: InputDecoration(labelText: "Contraseña"),
          obscureText: true,
        ),
      ],
    );
  }
}

// Widget para los botones de acciones de login
class _LoginActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {
              // Implementar recuperación de contraseña
            },
            child: const Text("¿Olvidaste tu contraseña?"),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, AppRoutes.home);
          },
          child: const Text("Ingresar"),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.register);
          },
          child: const Text("¿No tienes cuenta? Regístrate"),
        ),
      ],
    );
  }
}
