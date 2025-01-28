import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:store_and_display_user_info/models/user_model.dart';

class UserService {
  var db = FirebaseFirestore.instance;

  Future<List<User>> getUsers() async {
    List<User> users = [];
    await db.collection("users").get().then((event) {
      for (var doc in event.docs) {
        users.add(User.fromFirestore(doc));
      }
    });
    return users;
  }
}
