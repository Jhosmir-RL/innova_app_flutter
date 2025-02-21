import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:app_innova/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  String _role = "user"; // Por defecto, usuario normal

  Future<String> _getFilePath() async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/usuarios.json';
  }

  Future<void> _loadUserRole() async {
    final path = await _getFilePath();
    final file = File(path);
    if (!file.existsSync()) return;

    List<dynamic> users = json.decode(file.readAsStringSync());

    // Obtener usuario logueado (En este caso, lo simulamos con "admin")
    var loggedInUser = users.firstWhere((user) => user['username'] == "admin",
        orElse: () => null);

    if (loggedInUser != null) {
      setState(() {
        _role = loggedInUser['role'];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadUserRole();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
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
              if (_role == "admin") // 🔥 Solo mostrar si el usuario es admin
                MenuItem(
                  title: "Administrar Usuarios",
                  icon: Icons.admin_panel_settings,
                  iconColor: Colors.blue,
                  routeName: AppRoutes.adminPanel,
                ),
              MenuItem(
                title: "Cerrar sesión",
                icon: Icons.logout,
                iconColor: Colors.red,
                isLogout: true,
                onLogout: () => _logout(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _logout(BuildContext context) async {
    final path = await _getFilePath();
    final file = File(path);
    if (file.existsSync()) {
      await file.delete();
    }
    Navigator.pushReplacementNamed(context, AppRoutes.login);
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
  final String? routeName;
  final bool isLogout;
  final VoidCallback? onLogout;

  const MenuItem({
    super.key,
    required this.title,
    required this.icon,
    required this.iconColor,
    this.routeName,
    this.isLogout = false,
    this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isLogout && onLogout != null) {
          onLogout!();
        } else if (routeName != null) {
          Navigator.pushNamed(context, routeName!);
        }
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
