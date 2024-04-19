

import 'package:flutter/material.dart';
import 'package:on_chat/services/auth_service.dart';
import 'package:on_chat/services/user_service.dart';

class AccountPage extends StatelessWidget {
  final _userService = UserService();
  final _authService = AuthService();

  AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(_authService?.currentUser?.email ?? "Kullanıcı Yok");
  }
}