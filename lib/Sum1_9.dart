import 'dart:async';
import 'package:flutter/material.dart';
import 'package:project/ActivityComparison.dart';
import 'package:project/AdminHome.dart';
import 'package:project/StudentHome.dart';
import 'package:project/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'ActivitySum1_9.dart';
import 'Data.dart';
import 'ExplainComparison1_9.dart';
import 'ExplainSum1_9.dart';
import 'GameCompar.dart';
import 'GameSaum1_9.dart';

class Sum1_9 extends StatelessWidget {
  const Sum1_9({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int num1 = 3;

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
                    if (num1 < 1) {
                      print("klndslkasndalndsklndalksnd");
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ESum1_9()),
                      );
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
                    height: num1 < 1 ? 100 : 200,
                    width: num1 < 1 ? 100 : null,
                    child: num1 < 1
                        ? Icon(
                            Icons.star_border,
                            size: 50,
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image.network(
                              'https://t4.ftcdn.net/jpg/01/26/70/79/360_F_126707959_wvPkULtxG3MEYUL9fav9o4ZzLTVDtlUg.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 40), // add vertical spacing here
                GestureDetector(
                  onTap: () {
                    // Handle container 1 click
                    if (num1 < 2) {
                      print("klndslkasndalndsklndalksnd");
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ASum1_9()),
                      );
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
                    height: num1 < 2 ? 100 : 200,
                    width: num1 < 2 ? 100 : null,
                    child: num1 < 2
                        ? Icon(
                            Icons.star_border,
                            size: 50,
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image.network(
                              'https://t4.ftcdn.net/jpg/01/26/70/79/360_F_126707959_wvPkULtxG3MEYUL9fav9o4ZzLTVDtlUg.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                ),
                const SizedBox(height: 40), // add vertical spacing here
                GestureDetector(
                  onTap: () {
                    // Handle container 1 click
                    if (num1 < 3) {
                      print("klndslkasndalndsklndalksnd");
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GSum1_9()),
                      );
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
                    height: num1 < 3 ? 100 : 200,
                    width: num1 < 3 ? 100 : null,
                    child: num1 < 3
                        ? Icon(
                            Icons.star_border,
                            size: 50,
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image.network(
                              'https://t4.ftcdn.net/jpg/01/26/70/79/360_F_126707959_wvPkULtxG3MEYUL9fav9o4ZzLTVDtlUg.jpg',
                              fit: BoxFit.cover,
                            ),
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
