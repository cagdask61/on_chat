import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:on_chat/models/user_model.dart';

class UserService {
  final String _relationName = "users";
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _fireStore
        .collection(_relationName)
        .snapshots()
        .map((snapshot) => (snapshot.docs.map((doc) => doc.data()).toList()));
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getByUserName(String userName) {
    return _fireStore
        .collection(_relationName)
        .where("userName", isEqualTo: userName)
        .get();
  }

  Future<DocumentReference<Map<String, dynamic>>> add(UserModel user) {
    return _fireStore.collection(_relationName).add(user.toMap());
  }
}