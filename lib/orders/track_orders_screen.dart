import 'package:flutter/material.dart';

class TrackOrdersScreen extends StatelessWidget {
  const TrackOrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Mis Pedidos', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        children: [
          // Texto debajo del título con fondo violeta
          Container(
            width: double.infinity,
            color: Colors.purple,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: const Text(
              'Aquí puedes hacer seguimiento a tus pedidos recientes.',
              style: TextStyle(fontSize: 14, color: Colors.white),
            ),
          ),
          
          // Fondo blanco con esquinas redondeadas
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
                itemCount: 4, // Número de pedidos
                itemBuilder: (context, index) {
                  return const OrderCard();
                },
              ),
            ),
          ),
        ],
      ),
      
      // Barra de navegación inferior
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.purple,
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

class OrderCard extends StatelessWidget {
  const OrderCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 2, // Sombra sutil
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    // Icono más grande
                    const Icon(Icons.shopping_bag, size: 60, color: Colors.purple),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('SAMSUNG', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[800], fontSize: 16)),
                          const SizedBox(height: 4),
                          const Text('Monitor 24" Full HD 75Hz HDMI VGA', style: TextStyle(color: Colors.grey, fontSize: 14)),
                          const SizedBox(height: 4),
                          const Text('Cantidad adquirida: 2', style: TextStyle(color: Colors.blue, fontSize: 12)),
                          const SizedBox(height: 8),
                          const Text('S/ 1,299', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.purple)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            
            // Estado "Entregado" en la esquina inferior derecha
            Positioned(
              bottom: 5,
              right: 10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.pink[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text('Entregado', style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}