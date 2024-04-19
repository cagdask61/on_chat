import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:on_chat/pages/home_page.dart';
import 'package:on_chat/pages/login_page.dart';

class AuthGuardPage extends StatelessWidget {
  const AuthGuardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
