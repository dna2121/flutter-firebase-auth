import 'package:flutter/material.dart';
import 'package:flutter_firebase_authentication/auth/controller/auth_controller.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome!"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {AuthController.instance.signOut();},
          child: const Text("Sign out"),
        ),
      ),
    );
  }
}
