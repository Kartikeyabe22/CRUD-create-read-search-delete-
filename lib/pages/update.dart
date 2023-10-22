import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Update extends StatefulWidget {
  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController relationship = TextEditingController();
  TextEditingController secret = TextEditingController();
  TextEditingController bio = TextEditingController();
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

Future<void> updateUser() {
      return users
          .doc('profile')//here put auth email which is diff of all users
          .update({

        'full_name':name.text,
        'age':age.text,
        'relationship':relationship.text,
        'You':{
          'secret':secret.text,
          'bio':bio.text,
        }
          })
          .then((value) => print("User Updated"))
          .catchError((error) => print("Failed to update user: $error"));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
    child: Column(
    children: [
    SizedBox(
      height: 50,
    ),
    Padding(
    padding: const EdgeInsets.all(12.0),
    child: TextField(
    controller: name,
    decoration: InputDecoration(
    border: OutlineInputBorder(
    borderRadius:BorderRadius.circular(60.0)),
    hintText: 'Name',
    ),
    ),
    ),
    SizedBox(
    height: 20,
    ),
    Padding(
    padding: const EdgeInsets.all(12.0),
    child: TextField(
    controller: age,
    decoration: InputDecoration(
    border: OutlineInputBorder(
    borderRadius:BorderRadius.circular(60.0)),
    hintText: 'Age',
    ),
    ),
    ),
    SizedBox(
    height: 20,
    ),
    Padding(
    padding: const EdgeInsets.all(12.0),
    child: TextField(
    controller: relationship,
    decoration: InputDecoration(
    border: OutlineInputBorder(
    borderRadius:BorderRadius.circular(60.0)),
    hintText: 'Relationship Status',
    ),
    ),
    ),
    SizedBox(
    height: 20,
    ),
    Padding(
    padding: const EdgeInsets.all(12.0),
    child: TextField(
    controller: secret,
    decoration: InputDecoration(
    border: OutlineInputBorder(
    borderRadius:BorderRadius.circular(60.0)),
    hintText: 'Secret',
    ),
    ),
    ),
    SizedBox(
    height: 20,
    ),
    Padding(
    padding: const EdgeInsets.all(12.0),
    child: TextField(
    controller: bio,
    decoration: InputDecoration(
    border: OutlineInputBorder(
    borderRadius:BorderRadius.circular(60.0)),
    hintText: 'Bio',
    ),
    ),
    ),
    SizedBox(
    height: 50,
    ),
    ElevatedButton(
    style: ElevatedButton.styleFrom(
    backgroundColor: Colors.grey,

    ),
    onPressed: (){
    updateUser();
    },
    child: Text('Update Yourself',
    style: TextStyle(
    color: Colors.black38,
    ),
    ),
    )
    ],
    ),
    ),
    );
  }
}
