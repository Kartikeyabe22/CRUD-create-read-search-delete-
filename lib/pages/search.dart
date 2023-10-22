import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Search extends StatefulWidget {
  const Search({Key? key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController search = TextEditingController();
  String? name;
  String? age;
  String? relationship;
  String? secret;
  String? bio;

  // Function to execute the Firestore query
  void searchUser() {
    String searchTerm = search.text;
    FirebaseFirestore.instance
        .collection('users')
        .where('full_name', isEqualTo: searchTerm)

        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        setState(() {
          // Assuming there's only one matching document
          var doc = querySnapshot.docs[0];
          name = doc['full_name'];
          age = doc['age'];
          relationship = doc['relationship'];
          secret = doc['You']['secret'];
          bio = doc['You']['bio'];
        });
      } else {
        // Handle no matching documents found
        setState(() {
          name = null;
          age = null;
          relationship = null;
          secret = null;
          bio = null;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60,
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    controller: search,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(60.0),
                      ),
                      hintText: 'Search Anyone',
                      suffixIcon: IconButton(
                        onPressed: searchUser, // Call the search function here
                        icon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          (name != null)
              ? Text(
            name!,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          )
              : Text(''),
          SizedBox(
            height: 10,
          ),
          (age != null)
              ? Text(
            age!,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          )
              : Text(''),
          SizedBox(
            height: 10,
          ),
          (relationship != null)
              ? Text(
            relationship!,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          )
              : Text(''),
          SizedBox(
            height: 10,
          ),
          (secret != null)
              ? Text(
            secret!,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          )
              : Text(''),
          SizedBox(
            height: 10,
          ),
          (bio != null)
              ? Text(
            bio!,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          )
              : Text(''),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
