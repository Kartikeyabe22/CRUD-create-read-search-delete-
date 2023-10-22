import 'package:crud_app/pages/allUsers.dart';
import 'package:crud_app/pages/create.dart';
import 'package:crud_app/pages/delete.dart';
import 'package:crud_app/pages/search.dart';
import 'package:crud_app/pages/update.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text('CRUD',
      style:TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Create()));
                }, child: Text('Create',
            style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Search()));
                }, child: Text('Search',
              style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Update()));
                }, child: Text('Update',
              style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Delete()));
                }, child: Text('Delete',
              style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AllUsers()));
                }, child: Text('ShowAll',
              style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
            ),
          ],
        ),
      ),
    );
  }
}
