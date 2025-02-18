import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Contáctanos")),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _ContactHeader(),
            SizedBox(height: 20),
            _ContactInfo(),
            SizedBox(height: 20),
            _ContactActions(),
          ],
        ),
      ),
    );
  }
}

// Widget para el encabezado de la pantalla
class _ContactHeader extends StatelessWidget {
  const _ContactHeader();

  @override
  Widget build(BuildContext context) {
    return const Text(
      "Comunícate con nosotros",
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }
}

// Widget para mostrar la información de contacto
class _ContactInfo extends StatelessWidget {
  const _ContactInfo();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const _InfoRow(icon: Icons.phone, text: "+51 987 654 321"),
        const SizedBox(height: 10),
        const _InfoRow(icon: Icons.email, text: "contacto@innovasystem.com"),
        const SizedBox(height: 10),
        const _InfoRow(icon: Icons.location_on, text: "Jr. Junín Mza. H Urb. Satipo (Nro. 283), Junín – Satipo"),
      ],
    );
  }
}

// Widget para cada fila de información de contacto
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

// Widget para los botones de acciones de contacto
class _ContactActions extends StatelessWidget {
  const _ContactActions();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton.icon(
          onPressed: () {
            // Implementar acción de WhatsApp
          },
          icon: const Icon(Icons.chat),
          label: const Text("WhatsApp"),
        ),
        const SizedBox(height: 10),
        ElevatedButton.icon(
          onPressed: () {
            // Implementar acción de llamada
          },
          icon: const Icon(Icons.call),
          label: const Text("Llamar"),
        ),
      ],
    );
  }
}
