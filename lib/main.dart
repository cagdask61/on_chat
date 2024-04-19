import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:on_chat/firebase_options.dart';
import 'package:on_chat/themes/light_mode.dart';
import 'package:on_chat/pages/auth_guard_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      home: const AuthGuardPage(),
    );
  }
}
