import 'package:flutter/material.dart';
import 'package:project/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Student extends StatefulWidget {
  Student({Key? key}) : super(key: key);

  @override
  _StudentState createState() => _StudentState();
}

class _StudentState extends State<Student> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      appBar: AppBar(
        leading: const Icon(Icons.android_sharp),
        title: const Text('Student Page'),
        backgroundColor: Colors.teal,
        elevation: 4,
      ),
      body: Column(children: [
        Divider(),
        ExpandableWidget(
          content: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  'https://t4.ftcdn.net/jpg/01/26/70/79/360_F_126707959_wvPkULtxG3MEYUL9fav9o4ZzLTVDtlUg.jpg',
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
        Divider(),
        ExpandableWidget2(
          content: Container(
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                  'https://t4.ftcdn.net/jpg/01/26/70/79/360_F_126707959_wvPkULtxG3MEYUL9fav9o4ZzLTVDtlUg.jpg',
                  width: 200,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ),
      ]),
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
  int level = 1;

  @override
  Widget build(BuildContext context) {
    if (level >= 1) {
      _isExpanded = true;
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          if (level >= 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyApp()),
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
          color: Colors.teal,
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
  int level = 1;

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
              MaterialPageRoute(builder: (context) => MyApp()),
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
          color: Colors.teal,
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
