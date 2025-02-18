import 'package:flutter/material.dart';
import 'package:app_innova/routes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Perfil")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _ProfileHeader(), // Eliminado const para evitar errores
            const SizedBox(height: 20),
            _ProfileDetails(),
            const SizedBox(height: 20),
            _ProfileActions(),
          ],
        ),
      ),
    );
  }
}

// Widget para mostrar la imagen y nombre del usuario
class _ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage("assets/images/profile_placeholder.png"),
        ),
        const SizedBox(height: 10),
        const Text(
          "Mateo Daniel Richety",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const Text("usuario@gmail.com", style: TextStyle(fontSize: 16, color: Colors.black54)),
      ],
    );
  }
}

// Widget para mostrar los detalles del usuario
class _ProfileDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _InfoRow(icon: Icons.phone, text: "+51 987 654 321"),
        const SizedBox(height: 10),
        const _InfoRow(icon: Icons.location_on, text: "Jr. Real N 345, Satipo"),
      ],
    );
  }
}

// Widget reutilizable para mostrar información de perfil
class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.deepPurple),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}

// Widget para los botones de editar perfil y cerrar sesión
class _ProfileActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton.icon(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.editProfile);
          },
          icon: const Icon(Icons.edit),
          label: const Text("Editar Perfil"),
        ),
        const SizedBox(height: 10),
        ElevatedButton.icon(
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.logoutConfirmation);
          },
          icon: const Icon(Icons.logout),
          label: const Text("Cerrar Sesión"),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red, foregroundColor: Colors.white),
        ),
      ],
    );
  }
}
