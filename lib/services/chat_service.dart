import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:on_chat/models/message.dart';

class ChatService {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final String _relationName = "chat_rooms";

  Future<void> sendMessage(String receiverId, String message) async {
    final String userId = _auth.currentUser!.uid;
    final String userEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    Message newMessage = Message(
      senderId: userId,
      senderEmail: userEmail,
      receiverId: receiverId,
      message: message,
      timestamp: timestamp,
    );

    final String chatRoomId = "${userId}_$receiverId";
    await _fireStore
        .collection(_relationName)
        .doc(chatRoomId)
        .collection("messages")
        .add(newMessage.toMap());
  }

  Stream<QuerySnapshot> getMessages(String userId, String otherUserId) {
    final String chatRoomId = "${userId}_$otherUserId";
    return _fireStore
        .collection(_relationName)
        .doc(chatRoomId)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
