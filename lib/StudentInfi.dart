import 'package:flutter/material.dart';
import 'package:project/Data.dart';
import 'package:project/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

class StudentInfo extends StatelessWidget {
  StudentInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      /*******************--[focus here 🧐]--*******************/
      appBar: AppBar(
        leading: const Icon(Icons.android_sharp),
        title: const Text('Student Page'),

        backgroundColor: Colors.teal,
        elevation: 4,
      ),
      body: myWidget(),
      /*******************--[focus here 🧐]--*******************/
    );
  }

  Widget myWidget() {
    return Container(
        padding: EdgeInsets.all(20),
        child:
        /*******************--[focus here 🧐]--*******************/
        MyFirstQuiz_text()
      // MyFirstQuiz_text()
      // SecondQuiz_icon()
      // Quiz3_buttons()
      /*******************--[focus here 🧐]--*******************/
    );
  }
  Text MyFirstQuiz_text() {
    return Text(
      User.StudentEmailInfo,
      style: TextStyle(
          backgroundColor: Color.fromARGB(255, 229, 10, 185),
          fontSize: 50,
          color: Colors.green,
          fontStyle: FontStyle.italic,
          fontFamily: 'casual',
          letterSpacing: 5),
    );
  }
}