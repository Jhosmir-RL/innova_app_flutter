import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Editar Perfil")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const _EditProfileHeader(),
            const SizedBox(height: 20),
            const _EditProfileForm(),
            const SizedBox(height: 20),
            _EditProfileActions(),
          ],
        ),
      ),
    );
  }
}

// Widget para mostrar el encabezado de edición
class _EditProfileHeader extends StatelessWidget {
  const _EditProfileHeader();

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Actualiza tu información",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
    );
  }
}

// Widget para el formulario de edición
class _EditProfileForm extends StatelessWidget {
  const _EditProfileForm();

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
      ],
    );
  }
}

// Widget para los botones de guardar cambios y cancelar
class _EditProfileActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            // Guardar cambios del perfil
          },
          child: const Text("Guardar Cambios"),
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
