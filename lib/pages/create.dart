import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
  int i=1;
class Create extends StatefulWidget {
  @override
  State<Create> createState() => _CreateState();
}

class _CreateState extends State<Create> {
  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController relationship = TextEditingController();
  TextEditingController secret = TextEditingController();
  TextEditingController bio = TextEditingController();
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');



//this is when you wanna give a unique id to your document
    Future<void> addUser() {

      return users
          .doc('profile${++i}')
          .set({
        'full_name': name.text,
        'age': age.text,
        'relationship':relationship.text,
        'You':{
          'secret':secret.text,
          'bio':bio.text,
        }
      },
      //  SetOptions(merge: true),//this will basically replace the previous text and put new one
      )
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }
    return Scaffold(
      appBar: AppBar(
        title:  Text('Create',
          style:TextStyle(
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
                addUser();
                },
                child: Text('Create yourself',
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
