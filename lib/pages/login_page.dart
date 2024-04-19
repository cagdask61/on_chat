import 'package:flutter/material.dart';
import 'package:on_chat/components/button.dart';
import 'package:on_chat/components/text_input.dart';
import 'package:on_chat/pages/register_page.dart';
import 'package:on_chat/services/auth_service.dart';
import 'package:on_chat/services/user_service.dart';

class LoginPage extends StatelessWidget {
  final _authService = AuthService();
  final _userService = UserService();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});

  Future<void> login(BuildContext context) async {
    if (_userNameController.text.isEmpty || _passwordController.text.isEmpty) {
      return;
    }

    final userEmail =
        (await _userService.getByUserName(_userNameController.text))
            .docs
            .firstOrNull
            ?.get("email");

    if (userEmail == null) return;

    await _authService.login(
      userEmail,
      _passwordController.text,
    );
  }

  void redirectToRegisterPage(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => RegisterPage(),
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
                "Hoş Geldiniz",
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
                  controller: _userNameController,
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
                onTap: () => login(context),
                text: "Giriş",
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Yeni misin? ",
                    style: TextStyle(
                      color: colorScheme.primary,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => redirectToRegisterPage(context),
                    child: Text(
                      "Hesap oluştur",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary,
                      ),
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
