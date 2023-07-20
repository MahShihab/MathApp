import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:math';
import 'dart:async';

import 'Data.dart';
import 'Sum1_9.dart';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:project/ModuleforKide.dart';
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

  @override
  void dispose() {
    //_model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

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
            'StarsAudiosForNumbersFromZeroToNine/هيا نذهب في رحلة الى الفضاء كي نساعد رجل.m4a',
            'StarsAudiosForNumbersFromZeroToNine/النجوم لم تظهر بعد العدد صفر.mp3',
            'StarsAudiosForNumbersFromZeroToNine/عثرنا على نجمة واحدة في الفضاء العدد واح.mp3',
            'StarsAudiosForNumbersFromZeroToNine/يوجد في الفضاء نجمتين وبالتالي العدد اثن.mp3',
            'StarsAudiosForNumbersFromZeroToNine/يوجد في الفضاء ثلاثة نجوم وبالتالي العدد.mp3',
            'StarsAudiosForNumbersFromZeroToNine/يوجد في الفضاء أربعة نجوم وبالتالي العدد.mp3',
            'StarsAudiosForNumbersFromZeroToNine/يوجد في الفضاء خمسة نجوم وبالتالي العدد .mp3',
            'StarsAudiosForNumbersFromZeroToNine/يوجد في الفضاء ستة نجوم وبالتالي العدد س.m4a',
            'StarsAudiosForNumbersFromZeroToNine/يوجد في الفضاء سبعة نجوم وبالتالي العدد .m4a',
            'StarsAudiosForNumbersFromZeroToNine/يوجد في الفضاء ثمانية نجوم وبالتالي العد.m4a',
            'StarsAudiosForNumbersFromZeroToNine/يوجد في الفضاء تسعة نجوم وبالتالي العدد .m4a',
            'StarsAudiosForNumbersFromZeroToNine/شكرا لمساعدتكم على عد النجوم رافقتكم الس.mp3',

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

