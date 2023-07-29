import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:math';
import 'dart:async';

import 'Data.dart';
import 'Sum1_9.dart';

class ASum1_9 extends StatefulWidget {
  const ASum1_9({Key? key}) : super(key: key);

  @override
  _ASum1_9State createState() => _ASum1_9State();
}

class _ASum1_9State extends State<ASum1_9> with TickerProviderStateMixin {
  final Random _random = Random();

  // Possible equations and answers
  final List<Map<String, dynamic>> _equations = [
    {'equation': '٢ + ٤ ', 'answer': 6},
    {'equation': '٣ + ١ ', 'answer': 4},
    {'equation': '٥ + ٣ ', 'answer': 8},
    {'equation': '٩ + ٠ ', 'answer': 9},
    {'equation': '٧ + ١ ', 'answer': 8},
    {'equation': '٨ + ١ ', 'answer': 9},
  ];

  // Current equation and correct answer
  late String _currentEquation;
  late int _correctAnswer;
  late String theCave;

  // List of answers to display on doors
  List<int> _answers = [];

  // Current state of the game
  int _currentRound = 1;
  bool _gameOver = false;

  List<double> _doorMarginsleft = [0.0, 0.0, 0.0];
  List<double> _doorMarginsright = [0.0, 0.0, 0.0];

  List<String> Myans = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

  late AnimationController animationController;
  late AnimationController animationController2;

  final _player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _player.play(AssetSource('moreVocices/StartSum.mp3'));
    theCave = 'assets/Cave.jpg';

    animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    animationController2 = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _pickNewEquation();
  }

  void _pickNewEquation() {
    // Pick a random equation and answer
    final index = _random.nextInt(_equations.length);
    final equation = _equations[index];
    _currentEquation = equation['equation'];
    _correctAnswer = equation['answer'];

    // Generate three possible answers, one of which is correct
    _answers = [_correctAnswer];
    while (_answers.length < 3) {
      final answer = _random.nextInt(9) + 1;
      if (!_answers.contains(answer)) {
        _answers.add(answer); 
      }
    }
    _answers.shuffle();
  }

  void _onDoorTap(int answer) {
    if (answer == _correctAnswer) {
      if (_currentRound == 3) {
        setState(() {
          _player.play(AssetSource('moreVocices/AhsantWasaltKanz.mp3'));
          _gameOver = true;
        });
      } else {
        _player.play(AssetSource('true.mp3'));
        setState(() {
          _moveDoors(answer);
          _currentRound++;
          if (_currentRound == 2) {
            theCave = 'assets/Cave2.jpg';
          }
          // Show correct animation
          animationController
              .forward()
              .then((value) => animationController.reverse());
        });
        Future.delayed(const Duration(milliseconds: 500), () {
          setState(() {
            _pickNewEquation();
          });
        });
        Future.delayed(const Duration(milliseconds: 1000), () {
          setState(() {
            _doorMarginsleft[0] = 0.0;
            _doorMarginsleft[1] = 0.0;
            _doorMarginsleft[2] = 0.0;
            _doorMarginsright[0] = 0.0;
            _doorMarginsright[1] = 0.0;
            _doorMarginsright[2] = 0.0;
          });
        });
      }
    } else {
      _player.play(AssetSource('false.mp3'));
      // Show wrong animation
      animationController2
          .forward()
          .then((value) => animationController2.reverse());
    }
  }

  void _moveDoors(int answer) {
    setState(() {
      _doorMarginsleft[0] = (answer == _answers[0]) ? -100.0 : 0.0;
      _doorMarginsleft[1] = (answer == _answers[1]) ? -100.0 : 0.0;
      _doorMarginsleft[2] = (answer == _answers[2]) ? -100.0 : 0.0;
      _doorMarginsright[0] = (answer == _answers[0]) ? 100.0 : 0.0;
      _doorMarginsright[1] = (answer == _answers[1]) ? 100.0 : 0.0;
      _doorMarginsright[2] = (answer == _answers[2]) ? 100.0 : 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(theCave),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!_gameOver) ...[
                Text(
                  'المرحلة  ${Myans[_currentRound]}',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  _currentEquation,
                  style: TextStyle(
                    fontSize: 32,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                ),
                SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 100, // Set the desired width value
                      height: 200, // Set the desired height value
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 4, 139, 33),
                          width: 1.0,
                        ),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          AnimatedPositioned(
                            duration: Duration(milliseconds: 500),
                            left: _doorMarginsleft[0],
                            child: GestureDetector(
                              onTap: () => _onDoorTap(_answers[0]),
                              child: Container(
                                width: 100,
                                height: 150,
                                alignment: Alignment.center,
                                child: Image.asset(
                                  'assets/door.png',
                                ),
                              ),
                            ),
                          ),
                          AnimatedPositioned(
                            duration: Duration(milliseconds: 500),
                            left: _doorMarginsright[0],
                            child: GestureDetector(
                              onTap: () => _onDoorTap(_answers[0]),
                              child: Container(
                                width: 100,
                                height: 150,
                                alignment: Alignment.center,
                                child: Image.asset(
                                  'assets/door.png',
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => _onDoorTap(_answers[0]),
                            child: Container(
                              width: 100, // Set the desired width value
                              child: Center(
                                child: Text(
                                  Myans[_answers[0]],
                                  style: TextStyle(
                                    fontSize: 80,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 100, // Set the desired width value
                      height: 200, // Set the desired height value
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 4, 139, 33),
                          width: 1.0,
                        ),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          AnimatedPositioned(
                            duration: Duration(milliseconds: 500),
                            left: _doorMarginsleft[1],
                            child: GestureDetector(
                              onTap: () => _onDoorTap(_answers[1]),
                              child: Container(
                                width: 100,
                                height: 150,
                                alignment: Alignment.center,
                                child: Image.asset(
                                  'assets/door.png',
                                ),
                              ),
                            ),
                          ),
                          AnimatedPositioned(
                            duration: Duration(milliseconds: 500),
                            left: _doorMarginsright[1],
                            child: GestureDetector(
                              onTap: () => _onDoorTap(_answers[1]),
                              child: Container(
                                width: 100,
                                height: 150,
                                alignment: Alignment.center,
                                child: Image.asset(
                                  'assets/door.png',
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => _onDoorTap(_answers[1]),
                            child: Container(
                              width: 100, // Set the desired width value
                              child: Center(
                                child: Text(
                                  Myans[_answers[1]],
                                  style: TextStyle(
                                    fontSize: 80,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 100, // Set the desired width value
                      height: 200, // Set the desired height value
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 4, 139, 33),
                          width: 1.0,
                        ),
                      ),

                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          AnimatedPositioned(
                            duration: Duration(milliseconds: 500),
                            left: _doorMarginsleft[2],
                            child: GestureDetector(
                              onTap: () => _onDoorTap(_answers[2]),
                              child: Container(
                                width: 100,
                                height: 150,
                                alignment: Alignment.center,
                                child: Image.asset(
                                  'assets/door.png',
                                ),
                              ),
                            ),
                          ),
                          AnimatedPositioned(
                            duration: Duration(milliseconds: 500),
                            left: _doorMarginsright[2],
                            child: GestureDetector(
                              onTap: () => _onDoorTap(_answers[2]),
                              child: Container(
                                width: 100,
                                height: 150,
                                alignment: Alignment.center,
                                child: Image.asset(
                                  'assets/door.png',
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () => _onDoorTap(_answers[2]),
                            child: Container(
                              width: 100, // Set the desired width value
                              child: Center(
                                child: Text(
                                  Myans[_answers[2]],
                                  style: TextStyle(
                                    fontSize: 80,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
              if (_gameOver) ...[
                Row(
                  children: [
                    Lottie.asset(
                      'assets/lotties/treasure.json',
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                    Lottie.asset(
                      'assets/lotties/treasure.json',
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                // Lottie.asset(
                //   'assets/lotties/treasure.json',
                //   width: 200,
                //   height: 200,
                //   fit: BoxFit.cover,
                // ),
                SizedBox(height: 16),
                Text(
                  "أحسنت لقد أتممت جميع المراحل",
                  style: TextStyle(
                      fontSize: 24, color: Color.fromARGB(255, 255, 255, 255)),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 50),
                ElevatedButton(
                  onPressed: () async {
                    if (User.level == 3 && User.Inlevel == 2) {
                      final usersRef = FirebaseFirestore.instance
                          .collection('StudentProgres');
                      final querySnapshot = await usersRef
                          .where('StudentEmail', isEqualTo: User.email)
                          .get();

                      if (querySnapshot.docs.isNotEmpty) {
                        // User with given email found in Firestore
                        final userDoc = querySnapshot.docs.first;

                        await usersRef.doc(userDoc.id).update({
                          'InLevel': 3,
                        });
                        User.Inlevel = 3;
                      } else {
                        print("error");
                      }
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Sum1_9()),
                    );
                  },
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(Size(150, 50)),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 209, 19, 19)),
                  ),
                  child: Icon(Icons.settings_backup_restore_rounded),
                )
              ],
              if (!_gameOver) ...[
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
            ],
          ),
        ),
      ),
    );
  }
}
