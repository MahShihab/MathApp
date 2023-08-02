import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import 'Data.dart';
import 'Numbers1_9.dart';

class ImageCarousel extends StatefulWidget {
  final List<String> imageUrls;
  final List<String> audioUrls;
  //final double height;
  final int durationSeconds;

  const ImageCarousel({
    required this.imageUrls,
    required this.audioUrls,
    //this.height = 200,
    this.durationSeconds = 20,
    Key? key,
  }) : super(key: key);

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;
  // AudioCache? _audioPlayer;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    // _audioPlayer = AudioCache();
    // _audioPlayer = AudioPlayer();
    print("k,ans,jmabnsm,ba,sbm,bad,bmad");

    _timer = Timer.periodic(Duration(seconds: widget.durationSeconds),
        (Timer timer) {
      if (_currentPage < widget.imageUrls.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
    // String audio = widget.audioUrls[_currentPage];
    // _audioPlayer.play(AssetSource(audio));
    _playAudio();
  }

  // @override
  // void dispose() {
  //   _timer?.cancel();
  //   _pageController.dispose();
  //   //_audioPlayer?.stop();
  //  // _audioPlayer?.dispose();
  //   super.dispose();
  // }

  Future<void> _playAudio() async {
    if (_audioPlayer != null && widget.audioUrls[_currentPage].isNotEmpty) {
      // await _audioPlayer.play(AssetSource(widget.audioUrls[_currentPage] ));
      String audio = widget.audioUrls[_currentPage];
      _audioPlayer.play(AssetSource(widget.audioUrls[_currentPage]));
      //await _audioPlayer!.play(isLocal: false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: widget.height,
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (BuildContext context, int index) {
          return Transform.rotate(
            angle: 1.5708,
            child: Transform.scale(
              scaleX: 2.2,
              scaleY: 1.8,
              child: Image.asset(
                widget.imageUrls[index],
                //fit: BoxFit.cover,
              ),
            ),
          );
        },
        itemCount: widget.imageUrls.length,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
          _playAudio();
          if (_currentPage == widget.imageUrls.length - 1) {
            Future.delayed(Duration(seconds: 7), () async {
              if (User.level == 1 && User.Inlevel == 1) {
                final usersRef =
                    FirebaseFirestore.instance.collection('StudentProgres');
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
                MaterialPageRoute(
                  builder: (context) => Num1_9(),
                ),
              );
            });
          }
        },
      ),
    );
  }
}
