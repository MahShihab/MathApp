import 'dart:js';
import 'dart:math';
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

class ACompar extends StatefulWidget {
  const ACompar({Key? key}) : super(key: key);

  @override
  _AComparState createState() => _AComparState();
}

class _AComparState extends State<ACompar> {
  late int correctIndex;
  List<String> options = ['Option 1', 'Option 2', 'Option 3'];

  @override
  void initState() {
    super.initState();
    // Assign a random index for the correct answer
    correctIndex = Random().nextInt(options.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      body: Center(
        child: Column(children: [
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // The draggable containers
              for (int i = 0; i < options.length; i++)
                Draggable(
                  data: i,
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.blue,
                    child: Center(
                      child: Text(
                        options[i],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  feedback: Container(
                    width: 100,
                    height: 100,
                    color: Colors.blue.withOpacity(0.5),
                    child: Center(
                      child: Text(
                        options[i],
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              const SizedBox(width: 20),
              // The drop target
            ],
          ),
          const SizedBox(height: 40),
          SizedBox(
            height: 100,
            width: 200,
            child: DragTarget<int>(
              builder: (BuildContext context, List<int?> candidateData,
                  List<dynamic> rejectedData) {
                // The drop target widget
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Drag and drop the correct answer here',
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
              onWillAccept: (data) => true,
              onAccept: (data) {
                // Check if the dragged container is the correct answer
                if (data == correctIndex) {
                  // Get the current position of the drop target
                  int dropTargetIndex = options.indexOf('');

                  // Swap the correct option with the drop target
                  setState(() {
                    options[dropTargetIndex] = 'Option ${correctIndex + 1}';
                    options[correctIndex] = '';
                  });

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Correct!')),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Incorrect!')),
                  );
                }
              },
            ),
          ),
        ]),
      ),
    );
  }
}
