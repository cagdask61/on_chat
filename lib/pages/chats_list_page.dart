import 'package:flutter/material.dart';
import 'package:on_chat/components/user_tile.dart';
import 'package:on_chat/pages/chat_page.dart';
import 'package:on_chat/services/chat_service.dart';
import 'package:on_chat/services/user_service.dart';

class ChatsListPage extends StatelessWidget {
  final _chatService = ChatService();
  final _userService = UserService();

  ChatsListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _userService.getUsersStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Hata var");
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Yükleniyor");
        }

        return ListView(
          children: [
            UserTile(
              text: "Çağdaş Kocaman",
              onTap: () {},
            ),
            UserTile(
              text: "Atakan Kocaman",
              onTap: () {},
            ),
            UserTile(
              text: "Saniye Kocaman",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatPage(
                        receiverEmail: "saniye@gmail.com",
                        receiverId: "as",
                      ),
                    ));
              },
            ),
          ],
        );

        // return ListView(
        //   children: snapshot.data!
        //       .map<Widget>((userData) => UserTile(
        //             text: userData["email"],
        //             onTap: () {
        //               Navigator.push(
        //                   context,
        //                   MaterialPageRoute(
        //                       builder: (context) => ChatPage(
        //                         receiverEmail: userData["email"],
        //                       )));
        //             },
        //           ))
        //       .toList(),
        // );
      },
    );
  }
}
