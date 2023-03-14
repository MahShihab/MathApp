import 'package:flutter/material.dart';
import 'package:project/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Student extends StatelessWidget {
  Student({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      /*******************--[focus here 🧐]--*******************/
      appBar: AppBar(
        leading: const Icon(Icons.android_sharp),
        title: const Text('Admin Page'),

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
    return const Text(
      'Admin page',
      style: TextStyle(
          backgroundColor: Colors.yellow,
          fontSize: 50,
          color: Colors.green,
          fontStyle: FontStyle.italic,
          fontFamily: 'casual',
          letterSpacing: 5),
    );
  }
}