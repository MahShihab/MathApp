import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project/ActivityComparison.dart';
import 'package:project/AdminHome.dart';
import 'package:project/StudentHome.dart';
import 'package:project/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Data.dart';
import 'ExplainComparison1_9.dart';
import 'GameCompar.dart';

class comparison1_9 extends StatelessWidget {
  const comparison1_9({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int num1 = User.Inlevel;
    int num2 = User.level;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 38, 182, 177),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    // Handle container 1 click
                    if (num1 >= 1 || num2 > 2) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => EComparison1_9()),
                      );
                    } else {
                      print("klndslkasndalndsklndalksnd");
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Color.fromARGB(255, 122, 14, 205),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset:
                              const Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    height: num1 >= 1 || num2 > 2 ? 200 : 100,
                    width: num1 >= 1 || num2 > 2 ? null : 100,
                    child: num1 >= 1 || num2 > 2
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: 
                            Lottie.asset(
                              'assets/lotties/apple.json',
                              // height: 100,
                              width: 300,
                              fit: BoxFit.fill,
                            ),
                            // Image.network(
                            //   'https://t4.ftcdn.net/jpg/01/26/70/79/360_F_126707959_wvPkULtxG3MEYUL9fav9o4ZzLTVDtlUg.jpg',
                            //   fit: BoxFit.cover,
                            // ),
                          )
                        : Icon(
                            Icons.star_border,
                            size: 50,
                          ),
                  ),
                ),
                const SizedBox(height: 40), // add vertical spacing here
                GestureDetector(
                  onTap: () {
                    // Handle container 1 click
                    if (num1 >= 2 || num2 > 2) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ACompar()),
                      );
                    } else {
                      print("klndslkasndalndsklndalksnd");
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Color.fromARGB(255, 122, 14, 205),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset:
                              const Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    height: num1 >= 2 || num2 > 2 ? 200 : 100,
                    width: num1 >= 2 || num2 > 2 ? null : 100,
                    child: num1 >= 2 || num2 > 2
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child:Lottie.asset(
                              'assets/lotties/apple2.json',
                              // height: 100,
                              width: 300,
                              fit: BoxFit.fill,
                            ),
                            //  Image.network(
                            //   'https://t4.ftcdn.net/jpg/01/26/70/79/360_F_126707959_wvPkULtxG3MEYUL9fav9o4ZzLTVDtlUg.jpg',
                            //   fit: BoxFit.cover,
                            // ),
                          )
                        : Icon(
                            Icons.star_border,
                            size: 50,
                          ),
                  ),
                ),
                const SizedBox(height: 40), // add vertical spacing here
                GestureDetector(
                  onTap: () {
                    // Handle container 1 click
                    if (num1 == 3 || num2 > 2) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GCompar()),
                      );
                    } else {
                      print("klndslkasndalndsklndalksnd");
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Color.fromARGB(255, 122, 14, 205),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset:
                              const Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    height: num1 == 3 || num2 > 2 ? 200 : 100,
                    width: num1 == 3 || num2 > 2 ? null : 100,
                    child: num1 == 3 || num2 > 2
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Lottie.asset(
                              'assets/lotties/apple3.json',
                              // height: 100,
                              width: 300,
                              fit: BoxFit.fill,
                            ),
                            //  Image.network(
                            //   'https://t4.ftcdn.net/jpg/01/26/70/79/360_F_126707959_wvPkULtxG3MEYUL9fav9o4ZzLTVDtlUg.jpg',
                            //   fit: BoxFit.cover,
                            // ),
                          )
                        : Icon(
                            Icons.star_border,
                            size: 50,
                          ),
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Student()),
                      );
                    },
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all(Size(150, 50)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.teal),
                    ),
                    child: Icon(Icons.settings_backup_restore_rounded))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
