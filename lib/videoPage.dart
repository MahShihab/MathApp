import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:project/ModuleforKide.dart';
import 'package:audioplayers/audioplayers.dart';



class VideoPageWidget extends StatefulWidget {
  const VideoPageWidget({Key? key}) : super(key: key);

  @override
  _VideoPageWidgetState createState() => _VideoPageWidgetState();
}

class _VideoPageWidgetState extends State<VideoPageWidget> {
  //late VideoPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  final audioPlayer = AudioCache();

  @override
  void initState() {
    super.initState();
    // _model = createModel(context, () => VideoPageModel());
  }

  @override
  void dispose() {
    //_model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Transform.rotate(
                    angle: 1.5708,
                    child: Transform.scale(
                      scaleX: 2,
                      scaleY: 1.8,
                      child: YoutubePlayer(
                        onEnded: (_) async {
                          await audioPlayer.play('sound1.mp3');
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ModuleforKideWidget(
                                email: '',
                              ),
                            ),
                          );
                          // play the audio file
                          
                          
                          
                        },
                        controller: YoutubePlayerController(
                          initialVideoId: 'jAc_AH9SwFY',
                          flags: YoutubePlayerFlags(
                            autoPlay: true,
                            loop: false,
                            mute: false,
                            controlsVisibleAtStart: true,
                            hideControls: false,
                          ),
                        ),
                        showVideoProgressIndicator: false,
                        progressIndicatorColor: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
