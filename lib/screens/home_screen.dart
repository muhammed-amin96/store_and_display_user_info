import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:store_and_display_user_info/screens/users_firebase_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController hobbyController = TextEditingController();

  void saveUserData() {
    var db = FirebaseFirestore.instance;
    final data = {
      "name": nameController.text,
      "age": ageController.text,
      "hobby": hobbyController.text,
    };
    db.collection("users").add(data).then(
      (documentSnapshot) {
        nameController.clear();
        ageController.clear();
        hobbyController.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Added Data with ID: ${documentSnapshot.id}"),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Info'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  controller: nameController,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'age'),
                  controller: ageController,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'hobby'),
                  controller: hobbyController,
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  //save data to fireStore
                  onPressed: saveUserData,
                  child: Text('Save'),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UsersFirebaseData(),
                      ),
                    );
                  },
                  child: Text('Display Data'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
