import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(
  clientId: "TU_CLIENT_ID.apps.googleusercontent.com", // Reemplaza con tu Client ID de Firebase
  scopes: ['email'],
);

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        print("Inicio de sesión cancelado por el usuario");
        return; // Si el usuario cancela, detener el proceso
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);

      // Si la autenticación es exitosa, redirigir a HomeScreen
      Navigator.pushReplacementNamed(context, "/home");
    } catch (e) {
      print("Error al iniciar sesión con Google: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => _signInWithGoogle(context),
          child: const Text("Iniciar con Google"),
        ),
      ),
    );
  }
}
