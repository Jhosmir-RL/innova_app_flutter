import 'package:flutter/material.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB792C6),
      appBar: AppBar(
        title: const Text('Historial de Pedidos', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFFB792C6),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Texto informativo en la parte superior
          Container(
            width: double.infinity,
            color: const Color(0xFFB792C6),
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: const Text(
              'Aquí puedes revisar el estado de tus pedidos y su progreso de entrega.',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
          
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const OrderItem();
                },
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFFB792C6),
        unselectedItemColor: Colors.grey,
        currentIndex: 0, // Ajusta según la pantalla activa
        onTap: (index) {
          // Aquí puedes manejar la navegación entre pantallas
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Inicio"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
        ],
      ),
    );
  }
}

class OrderItem extends StatelessWidget {
  const OrderItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(vertical: 12),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Icono del producto más grande
                const Icon(Icons.shopping_cart, size: 60, color: Color(0xFFB792C6)),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Monitor Samsung 24"', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const Text('En espera', style: TextStyle(color: Colors.orange, fontSize: 14, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5),
                      Text('Enviado desde: Lima - 12/02/2025', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                      Text('Destino: Cusco - 15/02/2025', style: TextStyle(color: Colors.grey[600], fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const OrderProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

class OrderProgressIndicator extends StatelessWidget {
  const OrderProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildProgressStep(Icons.radio_button_checked, const Color(0xFFB792C6)),
        _buildProgressLine(),
        _buildProgressStep(Icons.radio_button_checked, const Color(0xFFB792C6)),
        _buildProgressLine(),
        _buildProgressStep(Icons.radio_button_checked, Colors.orange),
      ],
    );
  }

  Widget _buildProgressStep(IconData icon, Color color) {
    return Icon(icon, color: color, size: 28);
  }

  Widget _buildProgressLine() {
    return Container(
      width: 30,
      height: 5,
      color: const Color(0xFFB792C6).withOpacity(0.5),
    );
  }
}
