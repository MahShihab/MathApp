import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project/profile.dart';
import 'Comparison1_9.dart';
import 'Data.dart';
import 'Numbers1_9.dart';
import 'Subtract1_9.dart';
import 'Sum1_9.dart';

class Student extends StatefulWidget {
  Student({Key? key}) : super(key: key);

  @override
  _StudentState createState() => _StudentState();
}

class _StudentState extends State<Student> {
  late double level = 0;
  late int studentLevel = User.level;
  late int studentInLevel = User.Inlevel;

  @override
  void initState() {
    super.initState();
    level = studentLevel + studentInLevel / 10;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      appBar: AppBar(
        leading:
            // Expanded(
            // child: Row(
            //   mainAxisSize: MainAxisSize.min,
            //   children: [
            IconButton(
          icon: Icon(Icons.star),
          onPressed: () {
            // Code to execute when the icon is tapped
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Profile()),
            );
          },
        ),
        // Container(
        //   // Wrap the GestureDetector with a Container
        //   width: 35, // Set the desired width
        //   height: 20, // Set the desired height
        // child:
        //  Scrollbar(
        //    child: GestureDetector(
        //     onTap: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(builder: (context) => Profile()),
        //       );
        //     },
        //     child: Text(
        //       level.toStringAsFixed(
        //           1), // Replace "5" with the desired number
        //       style: TextStyle(
        //         fontSize: 16,
        //         fontWeight: FontWeight.bold,
        //       ),
        //     ),
        //                  ),
        //  ),
        // ),
        // ],
        //   ),
        // ),
        // ... Rest of the code ...
        title: const Text('رياضيات الصف الأول'),
        backgroundColor: Colors.teal,
        elevation: 4,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background1.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Divider(),
            ExpandableWidget(
              content: Container(
                color: Color.fromARGB(255, 0, 232, 209),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Image.network(
                    //   'https://t4.ftcdn.net/jpg/01/26/70/79/360_F_126707959_wvPkULtxG3MEYUL9fav9o4ZzLTVDtlUg.jpg',
                    //   width: 200,
                    //   fit: BoxFit.cover,
                    // ),
                    Lottie.asset(
                      'assets/lotties/num.json',
                      height: 100,
                      width: 200,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),
            ),
            Divider(),
            ExpandableWidget2(
              content: Container(
                color: Color.fromARGB(255, 0, 232, 209),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Image.network(
                    //   'https://t4.ftcdn.net/jpg/01/26/70/79/360_F_126707959_wvPkULtxG3MEYUL9fav9o4ZzLTVDtlUg.jpg',
                    //   width: 200,
                    //   fit: BoxFit.cover,
                    // ),
                    Lottie.asset(
                      'assets/lotties/comp.json',
                      height: 120,
                      width: 300,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),
            ),
            Divider(),
            ExpandableWidget3(
              content: Container(
                color: Color.fromARGB(255, 0, 232, 209),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Image.network(
                    //   'https://t4.ftcdn.net/jpg/01/26/70/79/360_F_126707959_wvPkULtxG3MEYUL9fav9o4ZzLTVDtlUg.jpg',
                    //   width: 200,
                    //   fit: BoxFit.cover,
                    // ),
                    Lottie.asset(
                      'assets/lotties/Sum.json',
                      height: 120,
                      width: 180,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),
            ),
            Divider(),
            ExpandableWidget4(
              content: Container(
                color: Color.fromARGB(255, 0, 232, 209),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Image.network(
                    //   'https://t4.ftcdn.net/jpg/01/26/70/79/360_F_126707959_wvPkULtxG3MEYUL9fav9o4ZzLTVDtlUg.jpg',
                    //   width: 200,
                    //   fit: BoxFit.cover,
                    // ),
                    Lottie.asset(
                      'assets/lotties/Sub.json',
                      height: 120,
                      width: 200,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ExpandableWidget extends StatefulWidget {
  final Widget content;

  ExpandableWidget({required this.content});

  @override
  _ExpandableWidgetState createState() => _ExpandableWidgetState();
}

class _ExpandableWidgetState extends State<ExpandableWidget> {
  bool _isExpanded = false;
  int level = User.level;

  @override
  Widget build(BuildContext context) {
    if (level >= 1) {
      _isExpanded = true;
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          if (level >= 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Num1_9()),
            );
          } else if (_isExpanded == true) {
            _isExpanded = false;
          } else {
            _isExpanded = true;
          }
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 0, 232, 209),
          borderRadius: BorderRadius.circular(50),
        ),
        // color: Colors.teal,
        width: _isExpanded ? MediaQuery.of(context).size.width : 100.0,
        height: _isExpanded ? 121.0 : 100.0,
        child: _isExpanded
            ? Column(
                children: [
                  Expanded(
                    child: widget.content,
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     setState(() {
                  //       _isExpanded = false;
                  //     });
                  //   },
                  //   child: const Text('Close'),
                  // ),
                ],
              )
            : null,
      ),
    );
  }
}

class ExpandableWidget2 extends StatefulWidget {
  final Widget content;

  ExpandableWidget2({required this.content});

  @override
  _ExpandableWidgetState2 createState() => _ExpandableWidgetState2();
}

class _ExpandableWidgetState2 extends State<ExpandableWidget2> {
  bool _isExpanded = false;
  int level = User.level;

  @override
  Widget build(BuildContext context) {
    if (level >= 2) {
      _isExpanded = true;
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          if (level >= 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => comparison1_9()),
            );
          } else if (_isExpanded == true) {
            _isExpanded = false;
          } else {
            _isExpanded = true;
          }
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 0, 232, 209),
          borderRadius: BorderRadius.circular(50),
        ),
        // color: Colors.teal,
        width: _isExpanded ? MediaQuery.of(context).size.width : 100.0,
        height: _isExpanded ? 121.0 : 100.0,
        child: _isExpanded
            ? Column(
                children: [
                  Expanded(
                    child: widget.content,
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     setState(() {
                  //       _isExpanded = false;
                  //     });
                  //   },
                  //   child: const Text('Close'),
                  // ),
                ],
              )
            : null,
      ),
    );
  }
}

class ExpandableWidget3 extends StatefulWidget {
  final Widget content;

  ExpandableWidget3({required this.content});

  @override
  _ExpandableWidgetState3 createState() => _ExpandableWidgetState3();
}

class _ExpandableWidgetState3 extends State<ExpandableWidget3> {
  bool _isExpanded = false;
  int level = User.level;

  @override
  Widget build(BuildContext context) {
    if (level >= 3) {
      _isExpanded = true;
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          if (level >= 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Sum1_9()),
            );
          } else if (_isExpanded == true) {
            _isExpanded = false;
          } else {
            _isExpanded = true;
          }
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 0, 232, 209),
          borderRadius: BorderRadius.circular(50),
        ),
        // color: Colors.teal,
        width: _isExpanded ? MediaQuery.of(context).size.width : 100.0,
        height: _isExpanded ? 121.0 : 100.0,
        child: _isExpanded
            ? Column(
                children: [
                  Expanded(
                    child: widget.content,
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     setState(() {
                  //       _isExpanded = false;
                  //     });
                  //   },
                  //   child: const Text('Close'),
                  // ),
                ],
              )
            : null,
      ),
    );
  }
}

class ExpandableWidget4 extends StatefulWidget {
  final Widget content;

  ExpandableWidget4({required this.content});

  @override
  _ExpandableWidgetState4 createState() => _ExpandableWidgetState4();
}

class _ExpandableWidgetState4 extends State<ExpandableWidget4> {
  bool _isExpanded = false;
  int level = User.level;

  @override
  Widget build(BuildContext context) {
    if (level >= 4) {
      _isExpanded = true;
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          if (level >= 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => sub1_9()),
            );
          } else if (_isExpanded == true) {
            _isExpanded = false;
          } else {
            _isExpanded = true;
          }
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 0, 232, 209),
          borderRadius: BorderRadius.circular(50),
        ),
        // color: Colors.teal,
        width: _isExpanded ? MediaQuery.of(context).size.width : 100.0,
        height: _isExpanded ? 121.0 : 100.0,
        child: _isExpanded
            ? Column(
                children: [
                  Expanded(
                    child: widget.content,
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     setState(() {
                  //       _isExpanded = false;
                  //     });
                  //   },
                  //   child: const Text('Close'),
                  // ),
                ],
              )
            : null,
      ),
    );
  }
}
