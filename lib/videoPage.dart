
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';




class VideoPageWidget extends StatefulWidget {
  const VideoPageWidget({Key? key}) : super(key: key);

  @override
  _VideoPageWidgetState createState() => _VideoPageWidgetState();
}

class _VideoPageWidgetState extends State<VideoPageWidget> {
  //late VideoPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

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
  @override
Widget build(BuildContext context) {
  return Scaffold(
    key: scaffoldKey,
    backgroundColor: Color.fromARGB(255, 210, 187, 102),
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
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: YoutubePlayer(
                      controller: YoutubePlayerController(
                        initialVideoId: 'jAc_AH9SwFY',
                        flags: YoutubePlayerFlags(
                          autoPlay: false,
                          loop: true,
                          mute: false,
                          controlsVisibleAtStart: true,
                          hideControls: false,
                        ),
                      ),
                      showVideoProgressIndicator: true,
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
