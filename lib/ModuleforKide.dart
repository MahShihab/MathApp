import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:project/videoPage.dart';
//import 'package:audioplayers/audioplayers.dart';



//import '/video_page/video_page_widget.dart';

//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//import 'modulefor_kide_model.dart';
//export 'modulefor_kide_model.dart';

class ModuleforKideWidget extends StatefulWidget {
  const ModuleforKideWidget({
    Key? key,
    this.email,
  }) : super(key: key);

  final String? email;

  @override
  _ModuleforKideWidgetState createState() => _ModuleforKideWidgetState();
}

class _ModuleforKideWidgetState extends State<ModuleforKideWidget> {
  //late ModuleforKideModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();
  //final audioPlayer = AudioCache();


  @override
  void initState() {
    super.initState();
    //_model = createModel(context, () => ModuleforKideModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {});
  }

  @override
  void dispose() {
   // _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color.fromARGB(204, 246, 86, 160),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 237, 93, 150),
        automaticallyImplyLeading: true,
        title: Align(
          alignment: AlignmentDirectional(-0.35, 0),
          child: Text(
            'الرياضيات للأطفال',
            textAlign: TextAlign.center,
            style: TextStyle(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 35,
                ),
          ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        primary: false,
        child: SafeArea(
          child: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
            child: Align(
              alignment: AlignmentDirectional(0.05, 0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-0.1, 0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                          child: Container(
                            width: 220,
                            height: 140,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.network(
                                  '',
                                ).image,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 7,
                                  color: Color(0x33000000),
                                  offset: Offset(7, 7),
                                  spreadRadius: 7,
                                )
                              ],
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFF35539F),
                                  Color(0xFF673AB7),
                                  Colors.blue
                                ],
                                stops: [0, 0.3, 1],
                                begin: AlignmentDirectional(-1, 0),
                                end: AlignmentDirectional(1, 0),
                              ),
                              borderRadius: BorderRadius.circular(20),
                              shape: BoxShape.rectangle,
                            ),
                            child: InkWell(
                              onTap: () async {
                               
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => VideoPageWidget(),
                                  ),
                                );
                              },
                              child: Image.asset(
                                'assets/OneToTen.png',
                                height: 200,
                                width: 300,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                        child: Container(
                            width: 220,
                            height: 140,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: Image.network(
                                  '',
                                ).image,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 7,
                                  color: Color(0x33000000),
                                  offset: Offset(7, 7),
                                  spreadRadius: 7,
                                )
                              ],
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFF35539F),
                                  Color(0xFF673AB7),
                                  Colors.blue
                                ],
                                stops: [0, 0.3, 1],
                                begin: AlignmentDirectional(-1, 0),
                                end: AlignmentDirectional(1, 0),
                              ),
                              borderRadius: BorderRadius.circular(20),
                              shape: BoxShape.rectangle,
                            ),
                            child: InkWell(
                              onTap: () async {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => VideoPageWidget(),
                                  ),
                                );
                              },
                              child: Image.asset(
                                'assets/OneToTen.png',
                                height: 200,
                                width: 300,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 7,
                                color: Color(0x33000000),
                                offset: Offset(7, 7),
                                spreadRadius: 7,
                              )
                            ],
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF5EBE42),
                                Color(0xFF35539F),
                                Color(0xFF673AB7),
                                Colors.blue
                              ],
                              stops: [0, 0, 0.3, 1],
                              begin: AlignmentDirectional(-1, 0),
                              end: AlignmentDirectional(1, 0),
                            ),
                            borderRadius: BorderRadius.circular(20),
                            shape: BoxShape.rectangle,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Icon(
                              Icons.stars,
                              color: Color(0xFFD5E411),
                              size: 70,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 7,
                                color: Color(0x33000000),
                                offset: Offset(7, 7),
                                spreadRadius: 7,
                              )
                            ],
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF5EBE42),
                                Color(0xFF35539F),
                                Color(0xFF673AB7),
                                Colors.blue
                              ],
                              stops: [0, 0, 0.3, 1],
                              begin: AlignmentDirectional(-1, 0),
                              end: AlignmentDirectional(1, 0),
                            ),
                            borderRadius: BorderRadius.circular(20),
                            shape: BoxShape.rectangle,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Icon(
                              Icons.stars,
                              color: Color(0xFFD5E411),
                              size: 70,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 7,
                                color: Color(0x33000000),
                                offset: Offset(7, 7),
                                spreadRadius: 7,
                              )
                            ],
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFF5EBE42),
                                Color(0xFF35539F),
                                Color(0xFF673AB7),
                                Colors.blue
                              ],
                              stops: [0, 0, 0.3, 1],
                              begin: AlignmentDirectional(-1, 0),
                              end: AlignmentDirectional(1, 0),
                            ),
                            borderRadius: BorderRadius.circular(20),
                            shape: BoxShape.rectangle,
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0, 0),
                            child: Icon(
                              Icons.stars,
                              color: Color(0xFFD5E411),
                              size: 70,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
