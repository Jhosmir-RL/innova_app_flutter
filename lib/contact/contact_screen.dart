import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text("Contáctanos", style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const _ContactHeader(),
            const SizedBox(height: 25),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              elevation: 3,
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: _ContactInfo(),
              ),
            ),
            const SizedBox(height: 25),
            const _ContactActions(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
        ],
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

// Encabezado
class _ContactHeader extends StatelessWidget {
  const _ContactHeader();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(Icons.support_agent, size: 80, color: Colors.deepPurple),
        const SizedBox(height: 10),
        const Text(
          "Comunícate con nosotros",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.deepPurple),
        ),
        const SizedBox(height: 5),
        const Text(
          "Estamos aquí para ayudarte. Contáctanos por cualquiera de nuestros canales.",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }
}

// Información de contacto
class _ContactInfo extends StatelessWidget {
  const _ContactInfo();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        _InfoRow(icon: Icons.phone, text: "+51 987 654 321"),
        Divider(),
        _InfoRow(icon: Icons.email, text: "contacto@innovasystem.com"),
        Divider(),
        _InfoRow(icon: Icons.location_on, text: "Jr. Junín Mza. H Urb. Satipo (Nro. 283), Junín – Satipo"),
      ],
    );
  }
}

// Fila de información de contacto
class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.deepPurple, size: 28),
        const SizedBox(width: 12),
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

// Botones de contacto
class _ContactActions extends StatelessWidget {
  const _ContactActions();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton.icon(
          onPressed: () {},
          icon: const FaIcon(FontAwesomeIcons.whatsapp, color: Colors.white),
          label: const Text("WhatsApp"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
        const SizedBox(height: 15),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.call, color: Colors.white),
          label: const Text("Llamar"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ],
    );
  }
}
