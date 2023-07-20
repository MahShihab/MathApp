import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'Data.dart';
import 'Sum1_9.dart';

class ESum1_9 extends StatefulWidget {
  const ESum1_9({Key? key}) : super(key: key);

  @override
  ESum1_9State createState() => ESum1_9State();
}

class ESum1_9State extends State<ESum1_9> {
  double _opacityLevel1 = 0.0;
  double _opacityLevel2 = 0.0;
  double _opacityLevel3 = 0.0;
  double _opacityLevel4 = 0.0;
  double _firstButton = 0.0;

  List<String> _imagePaths1 = [
    "assets/Addition/firstAdd4.png",
    "assets/Addition/firstAdd3.png",
    "assets/Addition/firstAdd2.png",
    "assets/Addition/firstAdd1.png",
  ];
  List<String> _imagePaths2 = [
    "assets/Addition/secondAdd4.png",
    "assets/Addition/secondAdd3.png",
    "assets/Addition/secondAdd2.png",
    "assets/Addition/secondAdd1.png",
  ];
  List<String> _imagePaths3 = [
    "assets/Addition/thirdAdd4.png",
    "assets/Addition/thirdAdd3.png",
    "assets/Addition/thirdAdd2.png",
    "assets/Addition/thirdAdd1.png",
  ];
  List<String> _imagePaths4 = [
    "assets/Addition/forthAdd4.png",
    "assets/Addition/forthAdd3.png",
    "assets/Addition/forthAdd2.png",
    "assets/Addition/forthAdd1.png",
  ];
  List<String> _imagePaths5 = [
    "assets/Addition/fifthAdd4.png",
    "assets/Addition/fifthAdd3.png",
    "assets/Addition/fifthAdd2.png",
    "assets/Addition/fifthAdd1.png",
  ];
  List<String> _imagePaths6 = [
    "assets/Addition/sixthAdd4.png",
    "assets/Addition/sixthAdd3.png",
    "assets/Addition/sixthAdd2.png",
    "assets/Addition/sixthAdd1.png",
  ];
  List<String> _imagePaths7 = [
    "assets/Addition/seventhAdd4.png",
    "assets/Addition/seventhAdd3.png",
    "assets/Addition/seventhAdd2.png",
    "assets/Addition/seventhAdd1.png",
  ];
  int _currentImageIndex = 0;

  @override
  void initState() {
    super.initState();

    _showImages();
  }

  Future<void> _showImages() async {
    int currentImageSet = 1;

    while (currentImageSet <= 7) {
      List<String> currentImagePaths;

      if (currentImageSet == 1) {
        currentImagePaths = _imagePaths1;
      }
      if (currentImageSet == 2) {
        currentImagePaths = _imagePaths2;
      }
      if (currentImageSet == 3) {
        currentImagePaths = _imagePaths3;
      }
      if (currentImageSet == 4) {
        currentImagePaths = _imagePaths4;
      }
      if (currentImageSet == 5) {
        currentImagePaths = _imagePaths5;
      }
      if (currentImageSet == 6) {
        currentImagePaths = _imagePaths6;
      } else {
        currentImagePaths = _imagePaths7;
      }

      for (int i = 0; i < 5; i++) {
        await Future.delayed(Duration(seconds: 2));
        print(_imagePaths1);
        setState(() {
          _currentImageIndex = i;
          if (i == 0) {
            _opacityLevel1 = 0.0;
            _opacityLevel2 = 0.0;
            _opacityLevel3 = 0.0;
            _opacityLevel4 = 1.0;
          } else if (i == 1) {
            // _opacityLevel1 = 0.0;
            _opacityLevel2 = 1.0;
            _opacityLevel3 = 0.0;
            _opacityLevel4 = 0.0;
          } else if (i == 2) {
            // _opacityLevel1 = 0.0;
            // _opacityLevel2 = 0.0;
            _opacityLevel3 = 1.0;
            _opacityLevel4 = 0.0;
          } else if (i == 3) {
            _opacityLevel1 = 1.0;
          } else {
            if (currentImageSet != 7) {
              _opacityLevel1 = 0.0;
              _opacityLevel2 = 0.0;
              _opacityLevel3 = 0.0;
              _opacityLevel4 = 0.0;
            }
            if (currentImageSet == 7) {
              _firstButton = 1.0;
              // _secondButton = 1.0;
            }
          }
        });
      }

      if (currentImageSet == 1) {
        // After showing the first set of images, wait for 2 seconds and clear the screen
        await Future.delayed(Duration(seconds: 2));
        setState(() {
          _imagePaths1 = _imagePaths2;
        });
      }
      if (currentImageSet == 2) {
        // After showing the first set of images, wait for 2 seconds and clear the screen
        await Future.delayed(Duration(seconds: 2));
        setState(() {
          _imagePaths1 = _imagePaths3;
        });
      }
      if (currentImageSet == 3) {
        // After showing the first set of images, wait for 2 seconds and clear the screen
        await Future.delayed(Duration(seconds: 2));
        setState(() {
          _imagePaths1 = _imagePaths4;
        });
      }
      if (currentImageSet == 4) {
        // After showing the first set of images, wait for 2 seconds and clear the screen
        await Future.delayed(Duration(seconds: 2));
        setState(() {
          _imagePaths1 = _imagePaths5;
        });
      }
      if (currentImageSet == 5) {
        // After showing the first set of images, wait for 2 seconds and clear the screen
        await Future.delayed(Duration(seconds: 2));
        setState(() {
          _imagePaths1 = _imagePaths6;
        });
      }
      if (currentImageSet == 6) {
        // After showing the first set of images, wait for 2 seconds and clear the screen
        await Future.delayed(Duration(seconds: 2));
        setState(() {
          _imagePaths1 = _imagePaths7;
        });
      }

      currentImageSet++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background2.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildImage(_imagePaths1[0], _opacityLevel1),
              _buildImage(_imagePaths1[1], _opacityLevel2),
              _buildImage(_imagePaths1[2], _opacityLevel3),
              _buildImage(_imagePaths1[3], _opacityLevel4),
              // SizedBox(height: 20.0),
            ],
          ),
          Align(
            alignment: Alignment.topLeft,
            child: AnimatedOpacity(
              opacity: _firstButton,
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
              child: SizedBox(
                height: 100,
                width: 100,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ESum1_9()),
                    );
                  },
                  child: Icon(
                    Icons.replay_outlined,
                    size: 70,
                  ),
                  backgroundColor: Color.fromARGB(255, 193, 244, 54),
                  shape: CircleBorder(),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: AnimatedOpacity(
              opacity: _firstButton,
              duration: Duration(seconds: 1),
              curve: Curves.easeInOut,
              child: SizedBox(
                height: 100,
                width: 100,
                child: FloatingActionButton(
                  onPressed: () async {
                    if (User.level == 3 && User.Inlevel == 1) {
                      final usersRef = FirebaseFirestore.instance
                          .collection('StudentProgres');
                      final querySnapshot = await usersRef
                          .where('StudentEmail', isEqualTo: User.email)
                          .get();

                      if (querySnapshot.docs.isNotEmpty) {
                        // User with given email found in Firestore
                        final userDoc = querySnapshot.docs.first;

                        await usersRef.doc(userDoc.id).update({
                          'InLevel': 2,
                        });
                        User.Inlevel = 2;
                      } else {
                        print("error");
                      }
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Sum1_9()),
                    );
                  },
                  child: Icon(
                    Icons.arrow_circle_down_outlined,
                    size: 70,
                  ),
                  backgroundColor: Color.fromARGB(255, 193, 244, 54),
                  shape: CircleBorder(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(String assetPath, double opacityLevel) {
    return AnimatedOpacity(
      opacity: opacityLevel,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
      child: Image.asset(assetPath),
    );
  }
}
