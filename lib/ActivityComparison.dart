import 'dart:js';
import 'dart:math';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ACompar extends StatefulWidget {
  const ACompar({Key? key}) : super(key: key);

  @override
  _AComparState createState() => _AComparState();
}

class _AComparState extends State<ACompar> with TickerProviderStateMixin {
  List<String> options = ['>', '<', '='];
  // late int correctIndex = Random()
  //     .nextInt(options.length - 1); // subtract 1 to exclude the empty string
  late int correctIndex = 0;
  int? droppedIndex;

  var _isShow = true;
  var _isShow2 = true;

  late AnimationController animationController;
  late Animation<Offset> animation;
  late AnimationController animationController2;
  late Animation<Offset> animation2;

  @override
  void initState() {
    super.initState();
    // Assign a random index for the correct answer
    correctIndex = 0;

    animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _isShow = false;
        // Update the state of the widget to remove the LottieBuilder
        setState(() {});
      }
    });

    animationController2 = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    animationController2.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Update the state of the widget to remove the LottieBuilder
        _isShow2 = false;
        setState(() {});
      }
    });
  }

  final TextStyle textStyle = const TextStyle(fontSize: 40);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 100),
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
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 222, 243, 33),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Center(
                          child: Text(
                            options[i],
                            style: TextStyle(
                              color: Color.fromARGB(151, 12, 23, 143),
                              fontSize: 60,
                            ),
                          ),
                        ),
                      ),
                      feedback: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 222, 243, 33),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        // color: Colors.blue,
                        child: Center(
                          child: Text(
                            options[i],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ),
                    ),
                  // const SizedBox(width: 20),
                  // The drop target or dropped container
                ],
              ),
              const SizedBox(height: 40),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // const SizedBox(width: 90),
                    Image.asset(
                      'assets/4.gif',
                      height: 100,
                      width: 100,
                    ),
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
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 60),
                                  )
                                : Text(
                                    'Drag here',
                                    textAlign: TextAlign.center,
                                  ),
                          ),
                        ),
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: DragTarget<int>(
                            builder: (BuildContext context,
                                List<int?> candidateData,
                                List<dynamic> rejectedData) {
                              // The invisible drop target widget
                              return Container(
                                decoration: BoxDecoration(
                                  border: Border.all(width: 2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              );
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

                                  animationController.forward();

                                  // ScaffoldMessenger.of(context).showSnackBar(
                                  //   SnackBar(content: Text('Correct!')),
                                  // );
                                }
                              } else {
                                animationController2.forward();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/2.gif',
                      height: 100,
                      width: 100,
                    )
                  ],
                ),
              ),
              Stack(
                children: [
                  Visibility(
                    visible: _isShow,
                    child: Lottie.asset(
                      'assets/lotties/correct.json',
                      width: 400,
                      height: 250,
                      controller: animationController,
                      animate: true,
                    ),
                  ),
                  Visibility(
                    visible: _isShow ? _isShow2 : false,
                    child: Lottie.asset(
                      'assets/lotties/wrong.json',
                      width: 400,
                      height: 200,
                      controller: animationController2,
                      animate: true,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
