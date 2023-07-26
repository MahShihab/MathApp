import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'Comparison1_9.dart';
import 'Data.dart';

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
  String imageOne = '';
  String imageTwo = '';
  int playCount = 0;

  late AnimationController animationController;
  late AnimationController animationController2;

  final _player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    // Assign a random index for the correct answer
    _player.play(AssetSource('OceanActivity/divingInOhean.mpeg'));
    correctIndex = 0; 
    imageOne = 'assets/4.gif';
    imageTwo = 'assets/2.gif';
    playCount = 0;

    animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    animationController2 = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
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
                      imageOne,
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
                              _player.play(AssetSource('true.mp3'));
                                // Check if the drop target is empty
                                if (droppedIndex == null) {
                                  setState(() {
                                    // Replace the drop target with the dropped container
                                    droppedIndex = data;
                                    options[data] = options[correctIndex];
                                  });

                                  animationController.forward().then(
                                      (value) => animationController.reverse());

                                  playCount++;

                                  print(playCount);

                                  if (playCount == 1) {
                                    Future.delayed(Duration(milliseconds: 1500),
                                        () {
                                      setState(() {
                                        // Reset the game
                                        imageOne = 'assets/3.gif';
                                        imageTwo = 'assets/3.gif';
                                        droppedIndex = null;
                                        correctIndex = 2;
                                      });
                                    });
                                  }

                                  if (playCount == 2) {
                                    Future.delayed(Duration(milliseconds: 1500),
                                        () {
                                      setState(() {
                                        // Reset the game
                                        imageOne = 'assets/5.gif';
                                        imageTwo = 'assets/8.gif';
                                        droppedIndex = null;
                                        correctIndex = 1;
                                      });
                                    });
                                  }

                                  if (playCount == 3) {
                                    Future.delayed(Duration(milliseconds: 2000),
                                        () async {
                                      if (User.level == 2 && User.Inlevel == 2) {
                                        final usersRef = FirebaseFirestore
                                            .instance
                                            .collection('StudentProgres');
                                        final querySnapshot = await usersRef
                                            .where('StudentEmail',
                                                isEqualTo: User.email)
                                            .get();

                                        if (querySnapshot.docs.isNotEmpty) {
                                          // User with given email found in Firestore
                                          final userDoc =
                                              querySnapshot.docs.first;

                                          await usersRef
                                              .doc(userDoc.id)
                                              .update({
                                            'InLevel': 3,
                                          });
                                          User.Inlevel = 3;
                                        } else {
                                          print("error");
                                        }
                                      }
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                comparison1_9()),
                                      );
                                    });
                                  }

                                  // ScaffoldMessenger.of(context).showSnackBar(
                                  //   SnackBar(content: Text('Correct!')),
                                  // );
                                }
                              } else {
                                _player.play(AssetSource('false.mp3'));
                                animationController2.forward().then(
                                    (value) => animationController2.reverse());
                                // animationController2.reverse();
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      imageTwo,
                      height: 100,
                      width: 100,
                    )
                  ],
                ),
              ),
              Stack(
                children: [
                  Lottie.asset(
                    'assets/lotties/correct.json',
                    width: 400,
                    height: 250,
                    controller: animationController,
                    animate: true,
                  ),
                  Lottie.asset(
                    'assets/lotties/wrong.json',
                    width: 400,
                    height: 200,
                    controller: animationController2,
                    animate: true,
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
