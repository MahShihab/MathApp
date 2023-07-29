import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:audioplayers/audioplayers.dart';
import 'package:project/ImageCarousel.dart';


class ENum1_9 extends StatefulWidget {
  const ENum1_9({Key? key}) : super(key: key);

  @override
  _ENum1_9State createState() =>
      _ENum1_9State();
}

class _ENum1_9State
    extends State<ENum1_9> {
  //late StarsPageForNumberFromZeroToNineModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  final audioPlayer = AudioCache();

  @override
  void initState() {
    super.initState();
    //_model =reateModel(context, () => StarsPageForNumberFromZeroToNineModel());
  }

  // @override
  // void dispose() {
  //   //_model.dispose();

  //   _unfocusNode.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: ImageCarousel(
          imageUrls: [
            'assets/StarsPicturesForNumbersFromZeroToNine/manSpace.jpg',
            'assets/StarsPicturesForNumbersFromZeroToNine/space0.jpg',
            'assets/StarsPicturesForNumbersFromZeroToNine/space1.jpg',
            'assets/StarsPicturesForNumbersFromZeroToNine/space2.jpg',
            'assets/StarsPicturesForNumbersFromZeroToNine/space3.jpg',
            'assets/StarsPicturesForNumbersFromZeroToNine/space4.jpg',
            'assets/StarsPicturesForNumbersFromZeroToNine/space5.jpg',
            'assets/StarsPicturesForNumbersFromZeroToNine/space6.jpg',
            'assets/StarsPicturesForNumbersFromZeroToNine/space7.jpg',
            'assets/StarsPicturesForNumbersFromZeroToNine/space8.jpg',
            'assets/StarsPicturesForNumbersFromZeroToNine/space9.jpg',
            'assets/StarsPicturesForNumbersFromZeroToNine/spaceThanksForCountingStars.jpg',  

          ],
          audioUrls: [
            'stars/S1.mp3',
            'stars/S2.mp3',
            'stars/S3.mp3',
            'stars/S4.mp3',
            'stars/S5.mp3',
            'stars/S6.mp3',
            'stars/S7.mp3',
            'stars/S8.mp3',
            'stars/S9.mp3',
            'stars/Wefound8.mp3',
            'stars/S10.mp3',
            'stars/S11.mp3',

            // add more audio URLs here
          ],
          //height: 400,
          //width: 400,
          durationSeconds: 8,
        ),
      ),
    );
  }
}

