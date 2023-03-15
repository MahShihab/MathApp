import 'package:flutter/material.dart';
import 'package:project/ModuleforKide.dart';

class Student extends StatelessWidget {
  Student({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      /*******************--[focus here 🧐]--*******************/
      appBar: AppBar(
        leading: const Icon(Icons.android_sharp),
        title: const Text('Student Page'),

        backgroundColor: Colors.teal,
        elevation: 4,
      ),
      body: studentMainBodyPage(context),
      /*******************--[focus here 🧐]--*******************/
    );
  }
/*
  Widget myWidget() {
    return studentMainBodyPage();
  }
 */ 
// Generated code for this Container Widget...
Container studentMainBodyPage(BuildContext context){

return Container(
  width: double.infinity,
  height: double.infinity,
  decoration: BoxDecoration(
    color: Color(0x14FFFFFF),
    image: DecorationImage(
      fit: BoxFit.cover,
      image: Image.network(
        '',
      ).image,
    ),
    shape: BoxShape.rectangle,
  ),
  child: Align(
    alignment: AlignmentDirectional(0, 0),
    child: SingleChildScrollView(
      primary: false,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(
            alignment: AlignmentDirectional(-0.8, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
              child: InkWell(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ModuleforKideWidget(
                        email: '',
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 170,
                  height: 170,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: Image.network(
                        'https://t4.ftcdn.net/jpg/01/26/70/79/360_F_126707959_wvPkULtxG3MEYUL9fav9o4ZzLTVDtlUg.jpg',
                      ).image,
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0xB608EE1F),
                        offset: Offset(10, 20),
                      )
                    ],
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.7, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 10, 0, 10),
              child: InkWell(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ModuleforKideWidget(
                        email: '',
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 170,
                  height: 170,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: Image.network(
                        'https://www.shutterstock.com/image-vector/mascot-illustration-featuring-mathematical-symbols-260nw-413888443.jpg',
                      ).image,
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0xBDFE0404),
                        offset: Offset(10, 20),
                      )
                    ],
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-0.75, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
              child: InkWell(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ModuleforKideWidget(
                        email: '',
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 170,
                  height: 170,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: Image.network(
                        'https://www.freepnglogos.com/uploads/plus-icon/add-green-plus-icon-39.png',
                      ).image,
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Colors.black,
                        offset: Offset(10, 20),
                      )
                    ],
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.8, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
              child: InkWell(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ModuleforKideWidget(
                        email: '',
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 170,
                  height: 170,
                  decoration: BoxDecoration(
                    //color: Colors.red
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWExyiKNS-t89N66ipjE2t-BCIt5ptYamPY_1D3-ns3EC6z7oTqc0PpocwaK-O48SP45I&usqp=CAU',
                      ).image,
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0xD3000000),
                        offset: Offset(10, 20),
                      )
                    ],
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(-0.75, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
              child: InkWell(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ModuleforKideWidget(
                        email: '',
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 170,
                  height: 170,
                  decoration: BoxDecoration(
                    //color: Colors.red
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBI63-axPF5gVr-9wunQi3xtbUnIEtlC7j7V3tqp0bCTT04rpUn_sxnmyD95Dl38odBd8&usqp=CAU',
                      ).image,
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0xD3000000),
                        offset: Offset(10, 20),
                      )
                    ],
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.8, 0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
              child: InkWell(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ModuleforKideWidget(
                        email: '',
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 170,
                  height: 170,
                  decoration: BoxDecoration(
                    //color: Colors.red
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: Image.network(
                        'data:image/jpeg;base64,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',
                      ).image,
                    ),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 4,
                        color: Color(0xD3000000),
                        offset: Offset(10, 20),
                      )
                    ],
                    shape: BoxShape.circle,
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


