import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:project/ModuleforKide.dart';

class ActicityPageWidget extends StatefulWidget {
  const ActicityPageWidget({Key? key}) : super(key: key);

  @override
  _ActicityPageWidgetState createState() => _ActicityPageWidgetState();
}

class _ActicityPageWidgetState extends State<ActicityPageWidget> {
  //late ActicityPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  final audioPlayer = AudioCache();

  @override
  void initState() {
    super.initState();
    audioPlayer.play('المزارع بحاجة الى عجلة واحدة هل يمكنك ان.mp3');
    // _model = createModel(context, () => ActicityPageModel());
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
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
          child: Center(
            child: Transform.rotate(
              angle: 1.5708,
              child: Transform.scale(
                scale: 1.6,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      left: 2,
                      child: GestureDetector(
                        onTap: () {
                          // Perform your action here
                          audioPlayer.play('إجابة خاطئة.mp3');
                        },
                        child: Image.asset(
                          'assets/TwoWheel.jpg',
                          height: 102,
                          width: 95,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 100,
                      child: Image.asset(
                        'assets/FarmerWithoutWheel.jpg',
                        height: 200,
                        width: 250,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      child: GestureDetector(
                        onTap: () async {
                          await audioPlayer.play('إجابة صحيحة.mp3');
                          Future.delayed(Duration(seconds: 4), () {
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ModuleforKideWidget(),
                            ),
                          );
                          });
                          
                        },
                        child: Image.asset(
                          'assets/OneWheel.jpg',
                          height: 60,
                          width: 60,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
