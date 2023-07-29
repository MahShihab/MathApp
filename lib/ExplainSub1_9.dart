import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:audioplayers/audioplayers.dart';
import 'package:project/ImageCarousel.dart';

import 'ImageCarouselSup.dart';


class ESub1_9 extends StatefulWidget {
  const ESub1_9({Key? key}) : super(key: key);

  @override
  _ESub1_9State createState() =>
      _ESub1_9State();
}

class _ESub1_9State
    extends State<ESub1_9> {
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
        child: ImageCarouselSup(
          imageUrls: [
            'assets/Sup/Sup1.jpg',
            'assets/Sup/Sup3.jpg',
            'assets/Sup/Sup2.jpg',
            'assets/Sup/Sup4.jpg',
            'assets/Sup/Sup5.jpg',
            'assets/Sup/Sup6.jpg',
              

          ],
          audioUrls: [
            'Sup/Ballon2.mp3',
            'Sup/Ballon3.mp3',
            'Sup/Ballon4.mp3',
            'Sup/Ballon5.mp3',
            'Sup/Ballon6.mp3',
            'Sup/Ballon7.mp3',
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

