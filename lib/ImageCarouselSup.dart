
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import 'Subtract1_9.dart';


class ImageCarouselSup extends StatefulWidget {
  final List<String> imageUrls;
  final List<String> audioUrls;
  //final double height;
  final int durationSeconds;

  const ImageCarouselSup({
    required this.imageUrls,
    required this.audioUrls,
    //this.height = 200,
    this.durationSeconds = 20,
    Key? key,
  }) : super(key: key);

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarouselSup> {
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

    _timer = Timer.periodic(Duration(seconds: widget.durationSeconds), (Timer timer) {
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
              scaleY: 1.5,
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
        Future.delayed(Duration(seconds: 7), () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => sub1_9(),
            ),
          );
        });
      }
        },
      ),
    );
  }
}