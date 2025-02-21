import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart'; // 🔥 IMPORTANTE
import 'dart:io';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  AdminScreenState createState() => AdminScreenState();
}

class AdminScreenState extends State<AdminScreen> {
  List<dynamic> _users = [];

  Future<String> _getFilePath() async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/usuarios.json';
  }

  Future<void> _loadUsers() async {
    final path = await _getFilePath();
    final file = File(path);
    if (!file.existsSync()) return;
    setState(() {
      _users = json.decode(file.readAsStringSync());
    });
  }

  Future<void> _deleteUser(int index) async {
    _users.removeAt(index);
    final path = await _getFilePath();
    File(path).writeAsStringSync(json.encode(_users));
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Administrar Usuarios')),
      body: _users.isEmpty
          ? const Center(child: Text('No hay usuarios registrados'))
          : ListView.builder(
              itemCount: _users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_users[index]['username']),
                  subtitle: Text("Rol: ${_users[index]['role']}"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteUser(index),
                  ),
                );
              },
            ),
    );
  }
}

