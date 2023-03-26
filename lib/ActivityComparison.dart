import 'dart:js';
import 'dart:math';
import 'package:flutter/material.dart';

class ACompar extends StatefulWidget {
  const ACompar({Key? key}) : super(key: key);

  @override
  _AComparState createState() => _AComparState();
}

class _AComparState extends State<ACompar> {
  List<String> options = ['Option 1', 'Option 2', 'Option 3'];
  late int correctIndex = Random()
      .nextInt(options.length - 1); // subtract 1 to exclude the empty string
  int? droppedIndex;

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
        child: Column(
          children: [
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
                      color: Colors.blue,
                      child: Center(
                        child: Text(
                          options[i],
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                // const SizedBox(width: 20),
                // The drop target or dropped container
              ],
            ),
            const SizedBox(height: 40),
            Stack(
              children: [
                
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: droppedIndex != null
                        ? Text(
                            options[droppedIndex!],
                            style: TextStyle(color: Colors.black),
                          )
                        : Text(
                            'Drag and drop the correct answer here',
                            textAlign: TextAlign.center,
                          ),
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: 100,
                  child: DragTarget<int>(
                    builder: (BuildContext context, List<int?> candidateData,
                        List<dynamic> rejectedData) {
                      // The invisible drop target widget
                      return Container(decoration: BoxDecoration(
                    border: Border.all(width: 2),
                    borderRadius: BorderRadius.circular(10),
                  ),);
                    },
                    onWillAccept: (data) => true,
                    onAccept: (data) {
                      // Check if the dragged container is the correct answer
                      if (data == correctIndex) {
                        // Check if the drop target is empty
                        if (droppedIndex == null) {
                          setState(() {
                            // Replace the drop target with the dropped container
                            droppedIndex = data;
                            options[data] = options[correctIndex];
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Correct!')),
                          );
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Incorrect!')),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
