import 'package:flutter/material.dart';
import 'package:app_innova/routes.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const _RegisterHeader(),
            const SizedBox(height: 20),
            const _RegisterForm(),
            const SizedBox(height: 20),
            _RegisterActions(),
          ],
        ),
      ),
    );
  }
}

// Widget para el encabezado de la pantalla
class _RegisterHeader extends StatelessWidget {
  const _RegisterHeader();

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Registro de Usuario",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}

// Widget para el formulario de registro
class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextField(decoration: InputDecoration(labelText: "Nombre")),
        const SizedBox(height: 10),
        const TextField(decoration: InputDecoration(labelText: "Apellidos")),
        const SizedBox(height: 10),
        const TextField(
          decoration: InputDecoration(labelText: "Correo electrónico"),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 10),
        const TextField(
          decoration: InputDecoration(labelText: "Teléfono"),
          keyboardType: TextInputType.phone,
        ),
        const SizedBox(height: 10),
        const TextField(decoration: InputDecoration(labelText: "Dirección")),
        const SizedBox(height: 10),
        const TextField(
          decoration: InputDecoration(labelText: "Contraseña"),
          obscureText: true,
        ),
      ],
    );
  }
}

// Widget para los botones de acciones de registro
class _RegisterActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, AppRoutes.home);
          },
          child: const Text("Registrarse"),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, AppRoutes.login);
          },
          child: const Text("¿Ya tienes cuenta? Inicia sesión"),
        ),
      ],
    );
  }
}
