import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:math';
import 'dart:async';

import 'Data.dart';
import 'StudentInfo.dart';
import 'Sum1_9.dart';

class StudentP extends StatefulWidget {
  const StudentP({Key? key}) : super(key: key);

  @override
  _StudentPState createState() => _StudentPState();
}

class _StudentPState extends State<StudentP> with TickerProviderStateMixin {
  late double level = 0 ;
  late String levelName = "nothing";
  late Future<String> fullNameFuture;

  @override
  void initState() {
    super.initState();
    fullNameFuture = getFullNameFromEmail(User.StudentEmailInfo);
    final usersRef = FirebaseFirestore.instance.collection('StudentProgres');
    // check if email already exists in the database
    usersRef
        .where('StudentEmail', isEqualTo: User.StudentEmailInfo)
        .get()
        .then((querySnapshot) {
      final studentLevel = querySnapshot.docs.first.get('Level');
      final studentInLevel = querySnapshot.docs.first.get('InLevel');
      User.level = studentLevel;
      User.Inlevel = studentInLevel;

      level = studentLevel + studentInLevel / 10;

      if (studentLevel == 1) {
        if (studentInLevel == 1) {
          levelName = "Explain numbers";
        } else if (studentInLevel == 2) {
          levelName = "Activity numbers";
        } else if (studentInLevel == 3) {
          levelName = "Game numbers";
        }
      } else if (studentLevel == 2) {
        if (studentInLevel == 1) {
          levelName = "Explain compar";
        } else if (studentInLevel == 2) {
          levelName = "Activity compar";
        } else if (studentInLevel == 3) {
          levelName = "Game compar";
        }
      } else if (studentLevel == 3) {
        if (studentInLevel == 1) {
          levelName = "Explain sumation";
        } else if (studentInLevel == 2) {
          levelName = "Activity sumation";
        } else if (studentInLevel == 3) {
          levelName = "Game sumation";
        }
      } else if (studentLevel == 4) {
        if (studentInLevel == 1) {
          levelName = "Explain subtract";
        } else if (studentInLevel == 2) {
          levelName = "Activity subtract";
        } else if (studentInLevel == 3) {
          levelName = "Game subtract";
        }
      }

      setState(() {}); // Update the state with the retrieved data
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Code to execute when the icon is tapped
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StudentInfo()),
            );
          },
        ),
        title: Text(
          'Student Progress',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text(
              "Name",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            FutureBuilder<String>(
              future: fullNameFuture,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text("Loading...");
                } else if (snapshot.hasData) {
                  return Text(
                    snapshot.data!,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.blue,
                    ),
                  );
                } else {
                  return Text("Error");
                }
              },
            ),
            SizedBox(height: 20),
            Text(
              "Level",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              level.toStringAsFixed(1),
              style: TextStyle(
                fontSize: 24,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Level Name",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              levelName,
              style: TextStyle(
                fontSize: 24,
                color: Colors.blue,
              ),
            ),
          ],
        ),
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
}
