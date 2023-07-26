import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Comparison1_9.dart';
import 'Data.dart';

class EComparison1_9 extends StatefulWidget {
  const EComparison1_9({Key? key}) : super(key: key);

  @override
  _Comparison1_9State createState() => _Comparison1_9State();
}

class _Comparison1_9State extends State<EComparison1_9> {
  double _opacityLevel1 = 0.0;
  double _opacityLevel2 = 0.0;
  double _opacityLevel3 = 0.0;
  double _firstButton = 0.0;
  double _secondButton = 0.0;

  List<String> _imagePaths1 = [
    "assets/compar/firstCompar1.jpg",
    "assets/compar/firstCompar2.jpg",
    "assets/compar/firstCompar3.jpg",
  ];
  List<String> _imagePaths2 = [
    "assets/compar/secondCompar1.jpg",
    "assets/compar/secondCompar2.jpg",
    "assets/compar/secondCompar3.jpg",
  ];
  List<String> _imagePaths3 = [
    "assets/compar/thirdCompar1.jpg",
    "assets/compar/thirdCompar2.jpg",
    "assets/compar/thirdCompar3.jpg",
  ];
  List<String> _imagePaths4 = [
    "assets/compar/fourthCompar1.jpg",
    "assets/compar/fourthCompar2.jpg",
    "assets/compar/fourthCompar3.jpg",
  ];
  List<String> _imagePaths5 = [
    "assets/compar/fifthCompar1.jpg",
    "assets/compar/fifthCompar2.jpg",
    "assets/compar/fifthCompar3.jpg",
  ];
  List<String> _imagePaths6 = [
    "assets/compar/sixthCompar1.jpg",
    "assets/compar/sixthCompar2.jpg",
    "assets/compar/sixthCompar3.jpg",
  ];
  List<String> _imagePaths7 = [
    "assets/compar/SeventhCompar1.jpg",
    "assets/compar/SeventhCompar2.jpg",
    "assets/compar/SeventhCompar3.jpg",
  ];

  List<String> sounds1 = [
    "assets/Addition/firstAdd4.png",
    "assets/Addition/firstAdd3.png",
    "assets/Addition/firstAdd2.png",
  ];
  List<String> sounds2 = [
    "assets/Addition/secondAdd4.png",
    "assets/Addition/secondAdd3.png",
    "assets/Addition/secondAdd2.png",
  ];
  List<String> sounds3 = [
    "assets/Addition/thirdAdd4.png",
    "assets/Addition/thirdAdd3.png",
    "assets/Addition/thirdAdd2.png",
  ];
  List<String> sounds4 = [
    "assets/Addition/forthAdd4.png",
    "assets/Addition/forthAdd2.png",
    "assets/Addition/forthAdd1.png",
  ];
  List<String> sounds5 = [
    "assets/Addition/fifthAdd4.png",
    "assets/Addition/fifthAdd3.png",
    "assets/Addition/fifthAdd2.png",
  ];
  List<String> sounds6 = [
    "assets/Addition/sixthAdd4.png",
    "assets/Addition/sixthAdd2.png",
    "assets/Addition/sixthAdd1.png",
  ];
  List<String> sounds7 = [
    "assets/Addition/seventhAdd3.png",
    "assets/Addition/seventhAdd2.png",
    "assets/Addition/seventhAdd1.png",
  ];

  int _currentImageIndex = 0;

  final player = AudioPlayer();


  @override
  Future<void> initState() async {
    super.initState();
    player.play(AssetSource('OceanActivity/divingInOhean.mpeg'));
    await Future.delayed(Duration(seconds: 2));
    _showImages();
  }

  
  Future<void> _showImages() async {
    int currentImageSet = 1;

    while (currentImageSet <= 7) {
      List<String> currentImagePaths;
      List<String> currentSoundsPaths;

      if (currentImageSet == 1) {
        currentImagePaths = _imagePaths1;
        currentSoundsPaths = sounds1;
      }
      if (currentImageSet == 2) {
        currentImagePaths = _imagePaths2;
        currentSoundsPaths = sounds2;
      }
      if (currentImageSet == 3) {
        currentImagePaths = _imagePaths3;
        currentSoundsPaths = sounds3;
      }
      if (currentImageSet == 4) {
        currentImagePaths = _imagePaths4;
        currentSoundsPaths = sounds4;
      }
      if (currentImageSet == 5) {
        currentImagePaths = _imagePaths5;
        currentSoundsPaths = sounds5;
      }
      if (currentImageSet == 6) {
        currentImagePaths = _imagePaths6;
        currentSoundsPaths = sounds6;
      } else {
        currentImagePaths = _imagePaths7;
        currentSoundsPaths = sounds7;
      }

      for (int i = 0; i < 4; i++) {
        await Future.delayed(Duration(seconds: 2));
        print(_imagePaths1);
        setState(() {
          _currentImageIndex = i;
          if (i == 0) {
            player.play(AssetSource(sounds1[0]));
            _opacityLevel1 = 0.0;
            _opacityLevel2 = 0.0;
            _opacityLevel3 = 1.0;
          } else if (i == 1) {
            player.play(AssetSource(sounds1[1]));
            // _opacityLevel1 = 0.0;
            _opacityLevel1 = 1.0;
            _opacityLevel2 = 0.0;
          } else if (i == 2) {
            player.play(AssetSource(sounds1[2]));
            // _opacityLevel1 = 0.0;
            // _opacityLevel2 = 0.0;
            _opacityLevel2 = 1.0;
          } else {
            // player.play(AssetSource(sounds1[0]));
            if (currentImageSet != 7) {
              _opacityLevel1 = 0.0;
              _opacityLevel2 = 0.0;
              _opacityLevel3 = 0.0;
            }
            if (currentImageSet == 7) {
              // player.play(AssetSource(sounds1[0]));
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
          sounds1 = sounds2;
        });
      }
      if (currentImageSet == 2) {
        // After showing the first set of images, wait for 2 seconds and clear the screen
        await Future.delayed(Duration(seconds: 2));
        setState(() {
          _imagePaths1 = _imagePaths3;
          sounds1 = sounds3;
        });
      }
      if (currentImageSet == 3) {
        // After showing the first set of images, wait for 2 seconds and clear the screen
        await Future.delayed(Duration(seconds: 2));
        setState(() {
          _imagePaths1 = _imagePaths4;
          sounds1 = sounds4;
        });
      }
      if (currentImageSet == 4) {
        // After showing the first set of images, wait for 2 seconds and clear the screen
        await Future.delayed(Duration(seconds: 2));
        setState(() {
          _imagePaths1 = _imagePaths5;
          sounds1 = sounds5;
        });
      }
      if (currentImageSet == 5) {
        // After showing the first set of images, wait for 2 seconds and clear the screen
        await Future.delayed(Duration(seconds: 2));
        setState(() {
          _imagePaths1 = _imagePaths6;
          sounds1 = sounds6;
        });
      }
      if (currentImageSet == 6) {
        // After showing the first set of images, wait for 2 seconds and clear the screen
        await Future.delayed(Duration(seconds: 2));
        setState(() {
          _imagePaths1 = _imagePaths7;
          sounds1 = sounds7;
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
                      MaterialPageRoute(builder: (context) => EComparison1_9()),
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
                    if (User.level == 2 && User.Inlevel == 1) {
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
                      MaterialPageRoute(builder: (context) => comparison1_9()),
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
