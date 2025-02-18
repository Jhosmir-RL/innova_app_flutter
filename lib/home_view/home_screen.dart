import 'package:flutter/material.dart';
import 'package:app_innova/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    debugPrint("Navegando a índice: $index");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.black54,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderSection(),
              const SizedBox(height: 10),
              MenuItem(
                title: "Seguir mis pedidos",
                icon: Icons.local_shipping,
                iconColor: Colors.purple,
                routeName: AppRoutes.trackOrders,
              ),
              MenuItem(
                title: "Mis pedidos",
                icon: Icons.shopping_bag,
                iconColor: Colors.purple,
                routeName: AppRoutes.orderHistory,
              ),
              MenuItem(
                title: "Contáctanos",
                icon: Icons.store,
                iconColor: Colors.purple,
                routeName: AppRoutes.contact,
              ),
              MenuItem(
                title: "Ubícanos",
                icon: Icons.location_on,
                iconColor: Colors.purple,
                routeName: AppRoutes.location,
              ),
              MenuItem(
                title: "Cerrar sesión",
                icon: Icons.logout,
                iconColor: Colors.red,
                routeName: AppRoutes.logoutConfirmation,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Widget del encabezado con logo y fondo degradado
class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFBA93CA), Color(0xFF936CAD)],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.center,
      child: Column(
        children: [
          Image.asset(
            "assets/images/innova2.png",
            width: 160,
          ),
        ],
      ),
    );
  }
}

// Widget para los elementos del menú con navegación
class MenuItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color iconColor;
  final String routeName;

  const MenuItem({
    super.key,
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.routeName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint("Navegando a: $routeName");
        Navigator.pushNamed(context, routeName);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Icon(icon, color: iconColor),
            const SizedBox(width: 10),
            const Icon(Icons.arrow_forward_ios, color: Colors.black54, size: 16),
          ],
        ),
      ),
    );
  }
}
