import 'dart:async';

import 'package:flutter/material.dart';
import 'package:project/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Data.dart';

class EComparison1_9 extends StatefulWidget {
  EComparison1_9({Key? key}) : super(key: key);

  @override
  _comparison1_9State createState() => _comparison1_9State();
}

class _comparison1_9State extends State<EComparison1_9> {
  double _opacityLevel1 = 0.0;
  double _opacityLevel2 = 0.0;
  double _opacityLevel3 = 0.0;

  @override
  void initState() {
    super.initState();

    // Use a Timer to update the state after 500ms
    Timer(Duration(milliseconds: 1000), () {
      setState(() {
        _opacityLevel1 = 1.0;
      });
    });

    Timer(Duration(milliseconds: 1500), () {
      setState(() {
        _opacityLevel2 = 1.0;
      });
    });

    Timer(Duration(milliseconds: 2000), () {
      setState(() {
        _opacityLevel3 = 1.0;
      });
    });

    Timer(Duration(milliseconds: 3000), () {
      setState(() {
        _opacityLevel3 = 0.0;
        _opacityLevel1 = 0.0;
        _opacityLevel2 = 0.0;
      });
    });

    Timer(Duration(milliseconds: 4000), () {
      setState(() {
        _opacityLevel1 = 1.0;
      });
    });

    Timer(Duration(milliseconds: 4500), () {
      setState(() {
        _opacityLevel2 = 1.0;
      });
    });

    Timer(Duration(milliseconds: 5000), () {
      setState(() {
        _opacityLevel3 = 1.0;
      });
    });

    Timer(Duration(milliseconds: 5500), () {
      setState(() {
        _opacityLevel3 = 0.0;
        _opacityLevel1 = 0.0;
        _opacityLevel2 = 0.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedOpacity(
            opacity: _opacityLevel1,
            duration: Duration(milliseconds: 1000),
            child: Image.network(
              'https://t4.ftcdn.net/jpg/01/26/70/79/360_F_126707959_wvPkULtxG3MEYUL9fav9o4ZzLTVDtlUg.jpg',
              height: 200,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          AnimatedOpacity(
            opacity: _opacityLevel2,
            duration: Duration(milliseconds: 1000),
            child: Image.network(
              'https://t4.ftcdn.net/jpg/01/26/70/79/360_F_126707959_wvPkULtxG3MEYUL9fav9o4ZzLTVDtlUg.jpg',
              height: 200,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          AnimatedOpacity(
            opacity: _opacityLevel3,
            duration: Duration(milliseconds: 1000),
            child: Image.network(
              'https://t4.ftcdn.net/jpg/01/26/70/79/360_F_126707959_wvPkULtxG3MEYUL9fav9o4ZzLTVDtlUg.jpg',
              height: 200,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          AnimatedOpacity(
            opacity: _opacityLevel1,
            duration: Duration(milliseconds: 1000),
            child: Image.network(
              'https://t4.ftcdn.net/jpg/01/26/70/79/360_F_126707959_wvPkULtxG3MEYUL9fav9o4ZzLTVDtlUg.jpg',
              height: 200,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          AnimatedOpacity(
            opacity: _opacityLevel2,
            duration: Duration(milliseconds: 1000),
            child: Image.network(
              'https://t4.ftcdn.net/jpg/01/26/70/79/360_F_126707959_wvPkULtxG3MEYUL9fav9o4ZzLTVDtlUg.jpg',
              height: 200,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          AnimatedOpacity(
            opacity: _opacityLevel3,
            duration: Duration(milliseconds: 1000),
            child: Image.network(
              'https://t4.ftcdn.net/jpg/01/26/70/79/360_F_126707959_wvPkULtxG3MEYUL9fav9o4ZzLTVDtlUg.jpg',
              height: 200,
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ],
      ),
    ));
  }
}
