import 'package:flutter/material.dart';
import 'package:store_and_display_user_info/models/user_model.dart';
import 'package:store_and_display_user_info/services/user_service.dart';

class UsersFirebaseData extends StatefulWidget {
  const UsersFirebaseData({super.key});

  @override
  State<UsersFirebaseData> createState() => _UsersFirebaseDataState();
}

class _UsersFirebaseDataState extends State<UsersFirebaseData> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    getUsersFromFirebase();
  }

  Future<void> getUsersFromFirebase() async {
    var usersFromFirebase = await UserService().getUsers();
    setState(() {
      users = usersFromFirebase;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Users Data'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(users[index].name ?? '--'),
            subtitle: Text(users[index].age ?? '--'),
          );
        },
      ),
    );
  }
}
