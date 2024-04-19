import 'package:flutter/material.dart';
import 'package:on_chat/components/button.dart';
import 'package:on_chat/components/text_input.dart';
import 'package:on_chat/models/user_model.dart';
import 'package:on_chat/pages/login_page.dart';
import 'package:on_chat/services/auth_service.dart';
import 'package:on_chat/services/user_service.dart';

class RegisterPage extends StatelessWidget {
  final _authService = AuthService();
  final _userService = UserService();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _userNameController = TextEditingController();

  RegisterPage({super.key});

  Future<void> register() async {
    if (_emailController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _userNameController.text.isEmpty) {
      return;
    }

    final String? currenUserId = (await _authService.register(
            _emailController.text, _passwordController.text))
        .user
        ?.uid;
    if (currenUserId == null) return;
    await _userService.add(
      UserModel(
          id: currenUserId,
          email: _emailController.text,
          userName: _userNameController.text),
    );
  }

  void redirectToLoginPage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorScheme.background,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "OnChat",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Hesap Oluştur",
                style: TextStyle(
                  color: colorScheme.primary,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextInput(
                    hintText: "Kullanıcı Adı",
                    obscureText: false,
                    controller: _userNameController),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextInput(
                  hintText: "E-Posta",
                  obscureText: false,
                  controller: _emailController,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: TextInput(
                    hintText: "Şifre",
                    obscureText: true,
                    controller: _passwordController),
              ),
              const SizedBox(
                height: 50,
              ),
              Button(
                onTap: () => register(),
                text: "Kayıt",
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hesabın varmı? ",
                    style: TextStyle(color: colorScheme.primary),
                  ),
                  GestureDetector(
                    onTap: () => redirectToLoginPage(context),
                    child: Text(
                      "Giriş yap",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.primary),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
