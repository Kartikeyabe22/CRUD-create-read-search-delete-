import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Delete extends StatefulWidget {
  const Delete({super.key});

  @override
  State<Delete> createState() => _DeleteState();
}

class _DeleteState extends State<Delete> {
  TextEditingController field = TextEditingController();
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> deleteUser() {
      return users
          .doc('profile0')
          .delete()
          .then((value) => print("User Deleted"))
          .catchError((error) => print("Failed to delete user: $error"));
    }
    Future<void> deleteField() {
      String fieldName = field.text;
      return users
          .doc('profile0')
          .update({
        fieldName: FieldValue.delete()
      })
          .then((value) => print("User's Property Deleted"))
          .catchError((error) => print("Failed to delete user's property: $error"));
    }


    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Delete',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [


          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: field,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius:BorderRadius.circular(60.0)),
                hintText: 'Field to be deleted',
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),

          Padding(
            padding: const EdgeInsets.only(left: 70),
            child: ElevatedButton(
                onPressed: (){
                  deleteUser();
                },
                child: Text('Delete Your Profile')
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 70),
            child: ElevatedButton(
                onPressed: (){
             deleteField();
                },
                child: Text('Delete a field'),
            ),
          ),
        ],

      ),

    );
  }
}
