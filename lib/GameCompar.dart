import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'Comparison1_9.dart';
import 'Data.dart';

class GCompar extends StatefulWidget {
  const GCompar({Key? key}) : super(key: key);

  @override
  _GComparState createState() => _GComparState();
}

class _GComparState extends State<GCompar> with TickerProviderStateMixin {
  List<String> options = ['٢', '٦', '٤'];

  late int correctIndex = 0;
  int? droppedIndex;
  String imageOne = '';
  String compar = '';
  double prog = 0.0;

  late AnimationController animationController;
  late AnimationController animationController2;

  final List<Widget> _views = [
    _buildView(
      'assets/background1.jpg',
      Colors.red,
      'First View',
      Colors.white,
    ),
    _buildView(
      'assets/background2.jpg',
      Colors.blue,
      'Second View',
      Colors.white,
    ),
    _buildView(
      'assets/background3.jpg',
      Colors.green,
      'Third View',
      Colors.white,
    ),
  ];

  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    imageOne = 'assets/4.gif';
    compar = '<';
    _pageController = PageController(initialPage: _currentIndex);

    animationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    animationController2 = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
  }

  int _currentIndex = 0;

  void _navigateToNextView() {
    if (_currentIndex < 5 - 1) {
      _pageController.animateToPage(
        _currentIndex + 1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _navigateToFirstView() {
    if (_currentIndex > 0) {
      _pageController.animateToPage(
        _currentIndex = 0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _navigateToPreviousView() {
    if (_currentIndex > 0) {
      _pageController.animateToPage(
        _currentIndex - 1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      body: PageView.builder(
        controller: _pageController,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Scaffold(
            backgroundColor: const Color(0xfff4f4f4),
            body: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/background1.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 100),
                    Container(
                      height: 30,
                      width: 350,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor:
                            prog, // Replace with your own value (between 0.0 and 1.0)
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 222, 243, 33),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 100),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // The draggable containers
                        for (int i = 0; i < options.length; i++)
                          Draggable(
                            data: i,
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 222, 243, 33),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Center(
                                child: Text(
                                  options[i],
                                  style: TextStyle(
                                    color: Color.fromARGB(151, 12, 23, 143),
                                    fontSize: 60,
                                  ),
                                ),
                              ),
                            ),
                            feedback: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 222, 243, 33),
                                borderRadius: BorderRadius.circular(40),
                              ),
                              // color: Colors.blue,
                              child: Center(
                                child: Text(
                                  options[i],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        // const SizedBox(width: 20),
                        // The drop target or dropped container
                      ],
                    ),
                    const SizedBox(height: 40),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // const SizedBox(width: 90),
                          Stack(
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(width: 2),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: droppedIndex != null
                                      ? Text(
                                          options[droppedIndex!],
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 60),
                                        )
                                      : Text(
                                          'Drag here',
                                          textAlign: TextAlign.center,
                                        ),
                                ),
                              ),
                              SizedBox(
                                height: 100,
                                width: 100,
                                child: DragTarget<int>(
                                  builder: (BuildContext context,
                                      List<int?> candidateData,
                                      List<dynamic> rejectedData) {
                                    // The invisible drop target widget
                                    return Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(width: 2),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    );
                                  },
                                  onWillAccept: (data) => true,
                                  onAccept: (data) {
                                    // Check if the dragged container is the correct answer
                                    if (data == correctIndex) {
                                      // Check if the drop target is empty
                                      if (droppedIndex == null) {
                                        setState(() {
                                          // Replace the drop target with the dropped container
                                          droppedIndex = data;
                                          options[data] = options[correctIndex];
                                        });

                                        animationController.forward().then(
                                            (value) =>
                                                animationController.reverse());

                                        if (_currentIndex == 0) {
                                          Future.delayed(
                                              const Duration(
                                                  milliseconds: 2000), () {
                                            _navigateToNextView();
                                            setState(() {
                                              // Reset the game
                                              imageOne = 'assets/3.gif';
                                              compar = '>';
                                              options[0] = '٠';
                                              options[1] = '٣';
                                              options[2] = '٥';
                                              droppedIndex = null;
                                              correctIndex = 2;
                                              prog = 0.2;
                                            });
                                          });
                                        }

                                        if (_currentIndex == 1) {
                                          Future.delayed(
                                              const Duration(
                                                  milliseconds: 2000), () {
                                            _navigateToNextView();
                                            setState(() {
                                              // Reset the game
                                              imageOne = 'assets/5.gif';
                                              compar = '=';
                                              options[0] = '٤';
                                              options[1] = '٥';
                                              options[2] = '٧';
                                              droppedIndex = null;
                                              correctIndex = 1;
                                              prog = 0.4;
                                            });
                                          });
                                        }

                                        if (_currentIndex == 2) {
                                          Future.delayed(
                                              const Duration(
                                                  milliseconds: 2000), () {
                                            _navigateToNextView();
                                            setState(() {
                                              // Reset the game
                                              imageOne = 'assets/7.gif';
                                              compar = '<';
                                              options[0] = '٧';
                                              options[1] = '٩';
                                              options[2] = '٢';
                                              droppedIndex = null;
                                              correctIndex = 2;
                                              prog = 0.6;
                                            });
                                          });
                                        }

                                        if (_currentIndex == 3) {
                                          Future.delayed(
                                              const Duration(
                                                  milliseconds: 2000), () {
                                            _navigateToNextView();
                                            setState(() {
                                              // Reset the game
                                              imageOne = 'assets/2.gif';
                                              compar = '=';
                                              options[0] = '٢';
                                              options[1] = '٨';
                                              options[2] = '٠';
                                              droppedIndex = null;
                                              correctIndex = 0;
                                              prog = 0.8;
                                            });
                                          });
                                        }

                                        if (_currentIndex == 4) {
                                          Future.delayed(
                                              const Duration(
                                                  milliseconds: 2000),
                                              () async {
                                            prog = 1.0;

                                            final usersRef = FirebaseFirestore
                                                .instance
                                                .collection('StudentProgres');
                                            final querySnapshot = await usersRef
                                                .where('StudentEmail',
                                                    isEqualTo: User.email)
                                                .get();

                                            if (querySnapshot.docs.isNotEmpty) {
                                              // User with given email found in Firestore
                                              final userDoc =
                                                  querySnapshot.docs.first;

                                              await usersRef
                                                  .doc(userDoc.id)
                                                  .update({
                                                'InLevel': 1,
                                                'Level': 3,
                                              });
                                              User.Inlevel = 1;
                                              User.level = 3;
                                            } else {
                                              print("error");
                                            }

                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      comparison1_9()),
                                            );
                                          });
                                        }

                                        // ScaffoldMessenger.of(context).showSnackBar(
                                        //   SnackBar(content: Text('Correct!')),
                                        // );
                                      }
                                    } else {
                                      animationController2
                                          .forward()
                                          .then((value) =>
                                              animationController2.reverse())
                                          .then((value) =>
                                              _navigateToFirstView());

                                      Future.delayed(
                                          const Duration(milliseconds: 2000),
                                          () {
                                        setState(() {
                                          // Reset the game
                                          imageOne = 'assets/4.gif';
                                          compar = '<';
                                          options[0] = '٢';
                                          options[1] = '٦';
                                          options[2] = '٤';
                                          droppedIndex = null;
                                          correctIndex = 0;
                                          prog = 0.0;
                                        });
                                      });

                                      // animationController2.reverse();
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          Text(
                            compar,
                            style: TextStyle(
                              color: Color.fromARGB(151, 12, 23, 143),
                              fontSize: 60,
                            ),
                          ),
                          Image.asset(
                            imageOne,
                            height: 100,
                            width: 100,
                          )
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        Lottie.asset(
                          'assets/lotties/correct.json',
                          width: 400,
                          height: 250,
                          controller: animationController,
                          animate: true,
                        ),
                        Lottie.asset(
                          'assets/lotties/wrong.json',
                          width: 400,
                          height: 200,
                          controller: animationController2,
                          animate: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        onPageChanged: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
      ),
      // bottomNavigationBar: BottomAppBar(
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     children: [
      //       if (_currentIndex > 0)
      //         IconButton(
      //           onPressed: _navigateToPreviousView,
      //           icon: Icon(Icons.arrow_upward),
      //         ),
      //       if (_currentIndex < 5 - 1)
      //         IconButton(
      //           onPressed: _navigateToNextView,
      //           icon: Icon(Icons.arrow_downward),
      //         ),
      //     ],
      //   ),
      // ),
    );
  }

  static Widget _buildView(
    String backgroundImage,
    Color backgroundColor,
    String title,
    Color titleColor,
  ) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backgroundImage),
          fit: BoxFit.cover,
        ),
        color: backgroundColor,
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 40,
            color: titleColor,
          ),
        ),
      ),
    );
  }
}
