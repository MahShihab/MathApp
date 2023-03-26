import 'dart:async';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:project/ModuleforKide.dart';
import 'package:project/ImageCarousel.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class OceanActivityWidget extends StatefulWidget {
  const OceanActivityWidget({Key? key}) : super(key: key);

  @override
  _OceanActivityWidgetState createState() => _OceanActivityWidgetState();
}

class _OceanActivityWidgetState extends State<OceanActivityWidget> {
  //late OceanActivityModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  final audioPlayer = AudioCache();
  List<Color> colorList = List.filled(10, Colors.black.withOpacity(0.5));
  bool isRight = false; // Declare the boolean variable here
  bool isWrong = false; // Declare the boolean variable here

  @override
  void initState() {
    super.initState();
    audioPlayer.play('OceanActivity/divingInOhean.mpeg');
    // Change isWrong to false after 5 seconds
  }

  @override
  void dispose() {
    //_model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Hide status bar and navigation bar
    SystemChrome.setEnabledSystemUIOverlays([]);
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
                      'assets/OceanActivity/fish2.png',
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
          buildStackWithValues('۲'),
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
Widget buildStackWithValues(String targetValue) {
  List<String> values = ['۰', '۱', '۲', '۳', '٤', '٥', '٦', '٧', '۸', '۹'];
  List<double> tops = [750, 630, 510, 750, 630, 510, 750, 630, 510, 630];
  List<double> rights = [30, 30, 30, 130, 130, 130, 230, 230, 230, 330];

  List<Color> colorList = List.generate(10, (_) => Colors.black.withOpacity(0.5));

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
                    audioPlayer.play('إجابة صحيحة.mp3');
                    colorList[i] = Colors.green;
                  } else {
                    isWrong = true;
                    audioPlayer.play('إجابة خاطئة.mp3');
                    colorList[i] = Colors.red;
                  }

                  Timer(Duration(seconds: 3), () {
                    setState(() {
                      if (isWrong) {
                        isWrong = false;
                        colorList[i] = Colors.black.withOpacity(0.5);
                      }
                      if (isRight) {
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

}
