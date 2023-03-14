import 'package:flutter/material.dart';
import 'package:project/AdminHome.dart';
import 'package:project/Data.dart';
import 'package:project/signUp.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_options.dart';

// ...



// void main() => runApp(MyApp());
void main() async {
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Run the app
  runApp(MyApp());
}

/// this is your APP Main screen configuration
class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

/// this is a template to start building a UI
/// to start adding any UI you want change what comes after the [ body: ] tag below
class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.network(
              'https://t4.ftcdn.net/jpg/01/26/70/79/360_F_126707959_wvPkULtxG3MEYUL9fav9o4ZzLTVDtlUg.jpg',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 350),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    hintText: 'بريدك الاكتروني',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(0, 49, 2, 38),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  controller: emailController,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'أدخل كلمة المرور',
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0x00000000),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  controller: passwordController,
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () async {
                    final String email = emailController.text;
                    final String password = passwordController.text;

                    final usersRef = FirebaseFirestore.instance.collection('users');
                    // check if email already exists in database
                    final querySnapshot = await usersRef.where('email', isEqualTo: email).get();

                    if (querySnapshot.docs.isNotEmpty) {
                      // email already exists, get the type of user
                      final userPass = querySnapshot.docs.first.get('password');
                      if(userPass == password){
                        final userType = querySnapshot.docs.first.get('type');
                        User.email = email;
                        print('User type: $userType');
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  Admin()),
                        );
                      }
                      else{//incorrect password
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Error'),
                              content: const Text('Incorrect password'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                      // proceed with login or show appropriate message
                    } else {
                      // email does not exist, show appropriate message
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Error'),
                            content: const Text('email does not exist'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('OK'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  SignUp()),
                                  );
                                },
                                child: const Text('Create new account'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.black, // Set the desired background color here
                      ),
                      minimumSize: MaterialStateProperty.all<Size>(const Size(100, 50)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.cyan),
                    ),
                  ),
                ),
                  child:
                    const Text('دخول',style: TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'casual',
                        letterSpacing: 5),),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  SignUp()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.black, // Set the desired background color here
                    ),
                    minimumSize: MaterialStateProperty.all<Size>(const Size(100, 50)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.cyan),
                      ),
                    ),
                  ),
                  child:
                  const Text('انشاء حساب',style: TextStyle(
                      fontSize: 20,
                      color: Colors.green,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'casual',
                      letterSpacing: 5),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
//
//   Widget myWidget() {
//     return Container(
//       padding: EdgeInsets.all(20),
//       child: Builder(
//         builder: (BuildContext context) {
//           /*******************--[focus here 🧐]--*******************/
//           return Column(
//             children: [
//               firstChild(context),
//             ],
//           );
//         },
//       ),
//       // ToSignUp()
//       // MyFirstQuiz_text()
//       // SecondQuiz_icon()
//       // Quiz3_buttons()
//       /*******************--[focus here 🧐]--*******************/
//     );
//   }
//
//   ElevatedButton firstChild(context) {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         primary: Colors.blue,
//         elevation: 10, //shadow don't work at chrome
//         padding: const EdgeInsets.only(left: 50, right: 50), //all or all
//         shape: const StadiumBorder(), //CircleBorder()
//       ),
//       onPressed: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => const SignUp()),
//         );
//       },
//       child: const Text(
//         'press me',
//         style: TextStyle(
//             // backgroundColor: Colors.yellowAccent,
//             color: Colors.green,
//             fontFamily: "casule"),
//       ), //Text('press me'),Icon(Icons.add)
//     );
//   }
//
//   ElevatedButton Quiz3_buttons() {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         primary: Colors.blue,
//         elevation: 10, //shadow don't work at chrome
//         padding: const EdgeInsets.only(left: 50, right: 50), //all or all
//         shape: const StadiumBorder(), //CircleBorder()
//       ),
//       onPressed: () {
//         print('pressed');
//       },
//       child: const Text(
//         'press me',
//         style: TextStyle(
//             // backgroundColor: Colors.yellowAccent,
//             color: Colors.green,
//             fontFamily: "casule"),
//       ), //Text('press me'),Icon(Icons.add)
//     );
//   }
//
//   Icon SecondQuiz_icon() {
//     return const Icon(
//       Icons.whatshot_rounded,
//       size: 300,
//       color: Colors.red,
//       textDirection: TextDirection.rtl,
//     );
//   }
//
//   Text MyFirstQuiz_text() {
//     return const Text(
//       'Your first quiz',
//       style: TextStyle(
//           backgroundColor: Colors.yellow,
//           fontSize: 50,
//           color: Colors.green,
//           fontStyle: FontStyle.italic,
//           fontFamily: 'casual',
//           letterSpacing: 5),
//     );
//   }
}
