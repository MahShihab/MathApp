import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:math';
import 'dart:async';
import 'Data.dart';
import 'package:flutter/services.dart';
import 'package:audioplayers/audioplayers.dart';
import 'Numbers1_9.dart';

class ANum1_9 extends StatefulWidget {
  @override
  _ANum1_9State createState() => _ANum1_9State();
}

class _ANum1_9State extends State<ANum1_9> {
  final _player = AudioPlayer();
  final _pageController = PageController(initialPage: 0);
  final List<String> _pageTitles = [
    'Page 1',
    'Page 2',
    'Page 3',
    'Page 4',
    'Page 5',
    'Page 6',
    'Page 7',
    'Page 8',
    'Page 9',
    'Page 10',
    'Page 11',
    'Page 12'
  ];

  bool isRight = false; // Declare the boolean variable here
  bool isWrong = false; // Declare the boolean variable here
  bool justOneTimeForAudio_whatIsTheNymberOfFishs = true;

  @override
  void initState() {
    super.initState();

    // _player.play(source);
    _player.play(AssetSource('moreVocices/Fishe1.mp3'));
    // .then((value) => _pageController.nextPage(
    //       duration: Duration(milliseconds: 500),
    //       curve: Curves.ease,
    //     ));
    Timer(Duration(seconds: 4), () {
      _pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: _pageTitles.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return Container(
              color: Color.fromARGB(255, 43, 150, 237),
              child: SafeArea(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform.rotate(
                        angle: 1.5708,
                        child: Transform.scale(
                          scaleX: 5.1,
                          scaleY: 5,
                          child: Lottie.asset(
                            'assets/OceanActivity/fishStart.json',
                            height: 200,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            );
          } else {
            if (index + 1 < _pageTitles.length)
              return buildPageWithStack(index);
            else {
              return lastPageInPageView();
            }
          }
        },
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }

  Widget buildStackWithValues(String targetValue) {
    List<String> values = ['۰', '۱', '۲', '۳', '٤', '٥', '٦', '٧', '۸', '۹'];
    List<double> tops = [750, 630, 510, 750, 630, 510, 750, 630, 510, 630];
    List<double> rights = [30, 30, 30, 130, 130, 130, 230, 230, 230, 330];

    List<Color> colorList =
        List.generate(10, (_) => Colors.black.withOpacity(0.5));

    List<Widget> positionedWidgets = [];

    for (int i = 0; i < values.length; i++) {
      positionedWidgets.add(
        Positioned(
          top: tops[i],
          right: rights[i],
          child: Transform.scale(
            scale: 1.2,
            child: Transform.rotate(
              angle: 1.5708,
              child: GestureDetector(
                onTapDown: (TapDownDetails details) {
                  setState(() {
                    String pressedText = values[i];
                    if (pressedText == targetValue) {
                      isRight = true;
                      _player.play(AssetSource('true.mp3'));
                      colorList[i] = Colors.green;
                    } else {
                      isWrong = true;
                      _player.play(AssetSource('false.mp3'));
                      colorList[i] = Colors.red;
                    }

                    Timer(Duration(seconds: 3), () {
                      setState(() {
                        if (isWrong) {
                          isWrong = false;
                          colorList[i] = Colors.black.withOpacity(0.5);
                        }
                        if (isRight) {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                          isRight = false;
                          colorList[i] = Colors.black.withOpacity(0.5);
                        }
                      });
                    });
                  });
                },
                child: Container(
                  width: 74,
                  height: 74,
                  color: colorList[i],
                  child: Center(
                    child: Text(
                      values[i],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Stack(children: positionedWidgets);
  }

  Scaffold buildPageWithStack(int index) {
    if (index == 1 && justOneTimeForAudio_whatIsTheNymberOfFishs) {
      justOneTimeForAudio_whatIsTheNymberOfFishs = false;
      _player.play(AssetSource('moreVocices/Fishe2.mp3'));
    }
    String assetName = 'fish${index - 1}.png';
    String textValue = '${index - 1}';
    Map<String, String> numbers = {
      '0': '۰',
      '1': '۱',
      '2': '۲',
      '3': '۳',
      '4': '٤',
      '5': '٥',
      '6': '٦',
      '7': '٧',
      '8': '۸',
      '9': '۹'
    };

    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(left: 0.0),
                child: Transform.rotate(
                  angle: 1.5708,
                  child: Transform.scale(
                    scaleX: 2.15,
                    scaleY: 2.0,
                    child: Image.asset(
                      'assets/OceanActivity/$assetName',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Transform.rotate(
              angle: 1.5708, // desired angle in radians
              child: Lottie.asset(
                'assets/OceanActivity/bubbles.json',
                fit: BoxFit.cover,
              ),
            ),
          ),
          buildStackWithValues(numbers[textValue]!),
          // Show the Lottie animation after the audio finishes playing
          Positioned(
            top: 300,
            right: 100, // adjust this value to move the box to the right
            child: Visibility(
              visible: isRight,
              child: Transform.scale(
                scaleX: 2.15,
                scaleY: 1.8,
                child: Transform.rotate(
                  angle: 1.5708,
                  child: Lottie.asset(
                    'assets/OceanActivity/86023-earn-rewards.json',
                    height: 220,
                    width: 220,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 300,
            right: 100, // adjust this value to move the box to the right
            child: Visibility(
              visible: isWrong,
              child: Transform.scale(
                scaleX: 2.15,
                scaleY: 1.8,
                child: Transform.rotate(
                  angle: 1.5708,
                  child: Lottie.asset(
                    'assets/29121-wrong.json',
                    height: 220,
                    width: 220,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container lastPageInPageView() {
    _player.play(AssetSource('moreVocices/Fishe3.mp3'));
    Future.delayed(Duration(seconds: 11)).then((_) async {
      if (User.level == 1 && User.Inlevel == 2) {
        final usersRef =
            FirebaseFirestore.instance.collection('StudentProgres');
        final querySnapshot =
            await usersRef.where('StudentEmail', isEqualTo: User.email).get();

        if (querySnapshot.docs.isNotEmpty) {
          // User with given email found in Firestore
          final userDoc = querySnapshot.docs.first;

          await usersRef.doc(userDoc.id).update({
            'InLevel': 1,
            'Level': 2,
          });
          User.Inlevel = 1;
          User.level = 2;
        } else {
          print("error");
        }
      }
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => Num1_9(),
        ),
      );
    });

    return Container(
      color: Color.fromARGB(255, 43, 150, 237),
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.rotate(
                angle: 1.5708,
                child: Transform.scale(
                  scaleX: 5.1,
                  scaleY: 5,
                  child: Lottie.asset(
                    'assets/OceanActivity/fishStart.json',
                    height: 200,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
