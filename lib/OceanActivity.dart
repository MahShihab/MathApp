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
  bool isAudioFinished = false; // Declare the boolean variable here

  @override
  void initState() {
    super.initState();
    //_model =reateModel(context, () => OceanActivityModel());
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
          Positioned(
            top: 510,
            right: 30, // adjust this value to move the box to the right
            child: Transform.scale(
              scale: 1.2, // desired scaling factor
              child: Transform.rotate(
                  angle: 1.5708, // desired angle in radians
                  child: GestureDetector(
                    onTapDown: (TapDownDetails details) {
                      setState(() {
                        colorList[2] = Colors.green
                            .withOpacity(0.5); // change the color when pressed
                        audioPlayer.play('إجابة صحيحة.mp3');
                        isAudioFinished = true;
                      });
                    },
                    onTapUp: (TapUpDetails details) {
                      setState(() {
                        colorList[2] = Colors.black.withOpacity(
                            0.5); // change the color back when released
                      });
                    },
                    child: Container(
                      width: 74,
                      height: 74,
                      decoration: BoxDecoration(
                        color: colorList[2],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          '۲',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )),
            ),
          ),
          Positioned(
            top: 630,
            right: 30, // adjust this value to move the box to the right
            child: Transform.scale(
              scale: 1.2, // desired scaling factor
              child: Transform.rotate(
                  angle: 1.5708, // desired angle in radians
                  child: GestureDetector(
                    onTapDown: (TapDownDetails details) {
                      setState(() {
                        colorList[1] = Colors.red
                            .withOpacity(0.5); // change the color when pressed
                      });
                    },
                    onTapUp: (TapUpDetails details) {
                      setState(() {
                        colorList[1] = Colors.black.withOpacity(
                            0.5); // change the color back when released
                      });
                    },
                    child: Container(
                      width: 74,
                      height: 74,
                      decoration: BoxDecoration(
                        color: colorList[1],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          '۱',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )),
            ),
          ),
          Positioned(
            top: 750,
            right: 30, // adjust this value to move the box to the right
            child: Transform.scale(
              scale: 1.2, // desired scaling factor
              child: Transform.rotate(
                  angle: 1.5708, // desired angle in radians
                  child: GestureDetector(
                    onTapDown: (TapDownDetails details) {
                      setState(() {
                        colorList[0] = Colors.red
                            .withOpacity(0.5); // change the color when pressed
                      });
                    },
                    onTapUp: (TapUpDetails details) {
                      setState(() {
                        colorList[0] = Colors.black.withOpacity(
                            0.5); // change the color back when released
                      });
                    },
                    child: Container(
                      width: 74,
                      height: 74,
                      decoration: BoxDecoration(
                        color: colorList[0],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          '۰',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )),
            ),
          ),
          Positioned(
            top: 510,
            right: 130, // adjust this value to move the box to the right
            child: Transform.scale(
              scale: 1.2, // desired scaling factor
              child: Transform.rotate(
                  angle: 1.5708, // desired angle in radians
                  child: GestureDetector(
                    onTapDown: (TapDownDetails details) {
                      setState(() {
                        colorList[5] = Colors.red
                            .withOpacity(0.5); // change the color when pressed
                      });
                    },
                    onTapUp: (TapUpDetails details) {
                      setState(() {
                        colorList[5] = Colors.black.withOpacity(
                            0.5); // change the color back when released
                      });
                    },
                    child: Container(
                      width: 74,
                      height: 74,
                      decoration: BoxDecoration(
                        color: colorList[5],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          '٥',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )),
            ),
          ),
          Positioned(
            top: 510,
            right: 230, // adjust this value to move the box to the right
            child: Transform.scale(
              scale: 1.2, // desired scaling factor
              child: Transform.rotate(
                  angle: 1.5708, // desired angle in radians
                  child: GestureDetector(
                    onTapDown: (TapDownDetails details) {
                      setState(() {
                        colorList[8] = Colors.red
                            .withOpacity(0.5); // change the color when pressed
                      });
                    },
                    onTapUp: (TapUpDetails details) {
                      setState(() {
                        colorList[8] = Colors.black.withOpacity(
                            0.5); // change the color back when released
                      });
                    },
                    child: Container(
                      width: 74,
                      height: 74,
                      decoration: BoxDecoration(
                        color: colorList[8],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          '۸',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )),
            ),
          ),
          Positioned(
            top: 630,
            right: 130, // adjust this value to move the box to the right
            child: Transform.scale(
              scale: 1.2, // desired scaling factor
              child: Transform.rotate(
                  angle: 1.5708, // desired angle in radians
                  child: GestureDetector(
                    onTapDown: (TapDownDetails details) {
                      setState(() {
                        colorList[4] = Colors.red
                            .withOpacity(0.5); // change the color when pressed
                      });
                    },
                    onTapUp: (TapUpDetails details) {
                      setState(() {
                        colorList[4] = Colors.black.withOpacity(
                            0.5); // change the color back when released
                      });
                    },
                    child: Container(
                      width: 74,
                      height: 74,
                      decoration: BoxDecoration(
                        color: colorList[4],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          '٤',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )),
            ),
          ),
          Positioned(
            top: 750,
            right: 130, // adjust this value to move the box to the right
            child: Transform.scale(
              scale: 1.2, // desired scaling factor
              child: Transform.rotate(
                  angle: 1.5708, // desired angle in radians
                  child: GestureDetector(
                    onTapDown: (TapDownDetails details) {
                      setState(() {
                        colorList[3] = Colors.red
                            .withOpacity(0.5); // change the color when pressed
                      });
                    },
                    onTapUp: (TapUpDetails details) {
                      setState(() {
                        colorList[3] = Colors.black.withOpacity(
                            0.5); // change the color back when released
                      });
                    },
                    child: Container(
                      width: 74,
                      height: 74,
                      decoration: BoxDecoration(
                        color: colorList[3],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          '۳',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )),
            ),
          ),
          Positioned(
            top: 750,
            right: 230, // adjust this value to move the box to the right
            child: Transform.scale(
              scale: 1.2, // desired scaling factor
              child: Transform.rotate(
                  angle: 1.5708, // desired angle in radians
                  child: GestureDetector(
                    onTapDown: (TapDownDetails details) {
                      setState(() {
                        colorList[6] = Colors.red
                            .withOpacity(0.5); // change the color when pressed
                      });
                    },
                    onTapUp: (TapUpDetails details) {
                      setState(() {
                        colorList[6] = Colors.black.withOpacity(
                            0.5); // change the color back when released
                      });
                    },
                    child: Container(
                      width: 74,
                      height: 74,
                      decoration: BoxDecoration(
                        color: colorList[6],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          '٦',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )),
            ),
          ),
          Positioned(
            top: 630,
            right: 230, // adjust this value to move the box to the right
            child: Transform.scale(
              scale: 1.2, // desired scaling factor
              child: Transform.rotate(
                  angle: 1.5708, // desired angle in radians
                  child: GestureDetector(
                    onTapDown: (TapDownDetails details) {
                      setState(() {
                        colorList[7] = Colors.red
                            .withOpacity(0.5); // change the color when pressed
                      });
                    },
                    onTapUp: (TapUpDetails details) {
                      setState(() {
                        colorList[7] = Colors.black.withOpacity(
                            0.5); // change the color back when released
                      });
                    },
                    child: Container(
                      width: 74,
                      height: 74,
                      decoration: BoxDecoration(
                        color: colorList[7],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          '٧',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )),
            ),
          ),
          Positioned(
            top: 630,
            right: 330, // adjust this value to move the box to the right
            child: Transform.scale(
              scale: 1.2, // desired scaling factor
              child: Transform.rotate(
                  angle: 1.5708, // desired angle in radians
                  child: GestureDetector(
                    onTapDown: (TapDownDetails details) {
                      setState(() {
                        colorList[9] = Colors.red
                            .withOpacity(0.5); // change the color when pressed
                      });
                    },
                    onTapUp: (TapUpDetails details) {
                      setState(() {
                        colorList[9] = Colors.black.withOpacity(
                            0.5); // change the color back when released
                      });
                    },
                    child: Container(
                      width: 72,
                      height: 72,
                      decoration: BoxDecoration(
                        color: colorList[9],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          '۹',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 60,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )),
            ),
          ),
          // Show the Lottie animation after the audio finishes playing
          Positioned(
            top: 300,
            right: 100, // adjust this value to move the box to the right
            child: Visibility(
              visible: isAudioFinished,
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
        ],
      ),
    );
  }
}
