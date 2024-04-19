import 'package:flutter/material.dart';
import 'package:on_chat/models/page_model.dart';
import 'package:on_chat/pages/chats_list_page.dart';
import 'package:on_chat/pages/find_page.dart';
import 'package:on_chat/pages/account_page.dart';
import 'package:on_chat/services/auth_service.dart';

List<PageModel> pages = [
  PageModel(
    screen: ChatsListPage(),
    title: const Text("Mesajlarım"),
    navigationModel: const PageNavigationModel(
      icon: Icon(Icons.chat),
      selectedIcon: Icon(Icons.chat),
      label: "Mesajlarım",
    ),
  ),
  const PageModel(
    screen: FindPage(),
    title: Text("Bul"),
    navigationModel: PageNavigationModel(
      icon: Icon(Icons.search),
      selectedIcon: Icon(Icons.search),
      label: "Bul",
    ),
  ),
  PageModel(
    screen: AccountPage(),
    title: const Text("Hesabım"),
    navigationModel: const PageNavigationModel(
      icon: Icon(Icons.account_circle),
      selectedIcon: Icon(Icons.account_circle),
      label: "Hesabım",
    ),
  ),
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeIndex = 0;

  final _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("OnChat"),
        actions: [
          IconButton(
            onPressed: () async {
              await _authService.signOut();
            },
            icon: const Icon(Icons.logout),
            tooltip: "Çıkış Yap",
          ),
        ],
      ),
      body: pages[activeIndex].screen,
      bottomNavigationBar: NavigationBar(
        selectedIndex: activeIndex,
        onDestinationSelected: (value) {
          setState(() {
            activeIndex = value;
          });
        },
        destinations: [
          ...pages.map(
            (p) => NavigationDestination(
              icon: p.navigationModel.icon,
              label: p.navigationModel.label,
              selectedIcon: p.navigationModel.selectedIcon,
            ),
          ),
        ],
      ),
    );
  }
}
