import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'Data.dart';
import 'StudentHome.dart';

class Pre extends StatefulWidget {
  const Pre({Key? key}) : super(key: key);

  @override
  _PreState createState() => _PreState();
}

class _PreState extends State<Pre> with TickerProviderStateMixin {
  final Random _random = Random();

  // Possible equations and answers
  final List<Map<String, dynamic>> _equations = [
    {'equation': '', 'answer': 8},
    {'equation': '', 'answer': 2},
    {'equation': '', 'answer': 4},
    {'equation': '٩ [  ] ٠ ', 'answer': 0},
    {'equation': '٣ [  ] ٧ ', 'answer': 1},
    {'equation': '٨ [  ] ٨ ', 'answer': 2},
    {'equation': '٢ + ٤ ', 'answer': 6},
    {'equation': '٣ + ١ ', 'answer': 4},
    {'equation': '٥ + ٣ ', 'answer': 8},
    {'equation': '٧ - ٩ ', 'answer': 2},
    {'equation': '٣ - ٧ ', 'answer': 4},
    {'equation': '٨ - ٨ ', 'answer': 0},
  ];

  List<String> options = ['<', '>', '='];

  // Current equation and correct answer
  late String _currentEquation;
  late int _correctAnswer;

  // List of answers to display on doors
  List<int> _answers = [];

  // List<String> options = ['٢', '٦', '٤'];

  late int correctIndex = 0;
  int? droppedIndex;
  // String imageOne = '';
  // String compar = '';
  // double prog = 0.0;

  late AnimationController animationController;
  late AnimationController animationController2;

  final _player = AudioPlayer();

  late PageController _pageController;

  List<String> sounds = [
    "moreVocices/Where8.mp3",
    "moreVocices/Where2.mp3",
    "moreVocices/Where4.mp3",
    "moreVocices/ChosenRihteComp.mp3",
    "moreVocices/ChosenRihteComp.mp3",
    "moreVocices/ChosenRihteComp.mp3",
    "moreVocices/ChoseRightAdd.mp3",
    "moreVocices/ChoseRightAdd.mp3",
    "moreVocices/ChoseRightAdd.mp3",
    "moreVocices/ChoseRightSub.mp3",
    "moreVocices/ChoseRightSub.mp3",
    "moreVocices/ChoseRightSub.mp3",
  ];

  List<String> Myans = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

  late int index;

  @override
  void initState() {
    super.initState();
    _player.play(AssetSource(sounds[0]));

    index = 0;

    _pageController = PageController(initialPage: _currentIndex);

    animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    animationController2 = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _pickNewEquation();
    _player.play(AssetSource(sounds[_currentIndex]));
  }

  void _pickNewEquation() {
    // Pick a random equation and answer
    // final index = _random.nextInt(_equations.length);
    final equation = _equations[index];
    _currentEquation = equation['equation'];
    _correctAnswer = equation['answer'];

    // Generate three possible answers, one of which is correct
    _answers = [_correctAnswer];
    while (_answers.length < 3) {
      if (_currentIndex == 2 || _currentIndex == 3 || _currentIndex == 4) {
        if (_correctAnswer == 0) {
          _answers.add(1);
          _answers.add(2);
        }
        if (_correctAnswer == 1) {
          _answers.add(0);
          _answers.add(2);
        }
        if (_correctAnswer == 2) {
          _answers.add(1);
          _answers.add(0);
        }
      } else {
        final answer = _random.nextInt(9) + 1;
        if (!_answers.contains(answer)) {
          _answers.add(answer);
        }
      }
    }
    _answers.shuffle();
    index = index + 1;
  }

  int _currentIndex = 0;

  void _navigateToNextView() {
    if (_currentIndex == 11) {
      int level = (_currentIndex / 3) as int;
      FirebaseFirestore.instance.collection('StudentProgres').add({
        'email': User.email,
        'Level': level,
        'InLevel': 1,
      });

      User.level = level;
      User.Inlevel = 1;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Student()),
      );
    }
    if (_currentIndex < 12 - 1) {
      _pageController.animateToPage(
        _currentIndex + 1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onContainerTap(int answer) {
    if (answer == _correctAnswer) {
      // _player.play(AssetSource("path"));
       
      Future.delayed(const Duration(milliseconds: 500), () {
        _navigateToNextView();
        setState(() {
          _pickNewEquation();
        });
        _player.play(AssetSource(sounds[_currentIndex + 1]));
      });
      
    } else {
      int level = (_currentIndex / 3) as int;
      FirebaseFirestore.instance.collection('StudentProgres').add({
        'email': User.email,
        'Level': level,
        'InLevel': 1,
      });

      User.level = level;
      User.Inlevel = 1;

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Student()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      body: PageView.builder(
        controller: _pageController,
        itemCount: 12,
        itemBuilder: (BuildContext context, int index) {
          return Scaffold(
            backgroundColor: const Color(0xfff4f4f4),
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/preBackGround.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(height: 160),
                    Text(
                      _currentEquation,
                      style: TextStyle(
                        fontSize: 50,
                        color: Color.fromARGB(255, 222, 243, 33),
                      ),
                    ),
                    const SizedBox(height: 100),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // The draggable containers
                        for (int i = 0; i < _answers.length; i++)
                          GestureDetector(
                            onTap: () => _onContainerTap(_answers[i]),
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 222, 243, 33),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Center(
                                child: Text(
                                  _currentIndex == 3 ||
                                          _currentIndex == 4 ||
                                          _currentIndex == 5
                                      ? options[_answers[i]]
                                      : Myans[_answers[i]],
                                  style: TextStyle(
                                    color: Color.fromARGB(151, 12, 23, 143),
                                    fontSize: 60,
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
        },
        onPageChanged: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}