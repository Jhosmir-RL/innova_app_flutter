import 'package:flutter/material.dart';
import 'package:app_innova/routes.dart';

class LogoutConfirmationScreen extends StatelessWidget {
  const LogoutConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const _LogoutHeader(),
            const SizedBox(height: 20),
            const _LogoutMessage(),
            const SizedBox(height: 20),
            _LogoutActions(),
          ],
        ),
      ),
    );
  }
}

// Widget para el encabezado de la pantalla
class _LogoutHeader extends StatelessWidget {
  const _LogoutHeader();

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Cerrar Sesión",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}

// Widget para el mensaje de confirmación
class _LogoutMessage extends StatelessWidget {
  const _LogoutMessage();

  @override
  Widget build(BuildContext context) {
    return const Text(
      "¿Estás seguro de que deseas cerrar sesión?",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 18, color: Colors.black54),
    );
  }
}

// Widget para los botones de acción (Cerrar sesión o Cancelar)
class _LogoutActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            // Redirigir a la pantalla de inicio de sesión después de cerrar sesión
            Navigator.pushNamedAndRemoveUntil(context, AppRoutes.login, (route) => false);
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
          child: const Text("Sí, cerrar sesión"),
        ),
        const SizedBox(height: 10),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancelar"),
        ),
      ],
    );
  }
}
