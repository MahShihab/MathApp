import 'package:flutter/material.dart';
import 'package:project/Data.dart';
import 'package:project/StudentInfo.dart';
import 'package:project/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/profile.dart';
import 'AdminHome.dart';
import 'firebase_options.dart';

class StudentInfo extends StatelessWidget {
  StudentInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      /*******************--[focus here 🧐]--*******************/
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Code to execute when the icon is tapped
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Admin()),
            );
          },
        ),
        title: const Text('Profile Page'),
        backgroundColor: Colors.teal,
        elevation: 4,
      ),
      body: myWidget(context),
      /*******************--[focus here 🧐]--*******************/
    );
  }

  Widget myWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.account_circle,
            size: 200,
          ),
          SizedBox(height: 20),
          FutureBuilder<String>(
            future: getFullNameFromEmail(User.StudentEmailInfo),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasData) {
                return Text(
                  snapshot.data!,
                  style: TextStyle(fontSize: 16),
                );
              } else if (snapshot.hasError) {
                return Text("Error");
              } else {
                return const Text("Loading...");
              }
            },
          ),
          SizedBox(height: 10),
          Text(
            User.StudentEmailInfo,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  // Handle delete profile button press
                  deleteDocument(User.email);

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Admin()),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.view_kanban_outlined),
                onPressed: () {
                  // Handle edit profile button press
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<String> getFullNameFromEmail(String email) async {
    var querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      var fullname = querySnapshot.docs.first.get('fullname');
      return fullname as String;
    } else {
      return 'Loading...';
    }
  }

  void deleteDocument(String email) async {
    final userRef = FirebaseFirestore.instance.collection('StudentsList');
    final snapshot = await userRef
        .where('AdminEmail', isEqualTo: email)
        .where('StudentEmail', isEqualTo: User.StudentEmailInfo)
        .get();

    if (snapshot.docs.isNotEmpty) {
      final docId = snapshot.docs.first.id;
      await userRef.doc(docId).delete();
      print('Document deleted successfully!');
    } else {
      print('No document found for this email.');
    }
  }
}
