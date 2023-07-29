import 'package:flutter/material.dart';
import 'package:project/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/preTest.dart';

import 'AdminHome.dart';
import 'Data.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController nameController = TextEditingController();
  // String? userType;

  final ValueNotifier<String> userType = ValueNotifier<String>('student');

  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+com$');
  final passwordRegex = RegExp(r'^(?=.*?[!@#\$&*~]).{8,}$');

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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const SizedBox(height: 350),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      hintText: 'أدخل اسمك',
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
                    controller: nameController,
                  ),
                  const SizedBox(height: 10),
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
                          color: Color(0x00000000),
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
                  const SizedBox(height: 10),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
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
                    controller: confirmPasswordController,
                  ),
                  const SizedBox(height: 10),
                  ValueListenableBuilder(
                    valueListenable: userType,
                    builder:
                        (BuildContext context, String? value, Widget? child) {
                      return Row(
                        children: [
                          Radio<String>(
                            value: 'admin',
                            groupValue: value,
                            onChanged: (value) {
                              userType.value = value!;
                            },
                          ),
                          Text('Admin'),
                          Radio<String>(
                            value: 'student',
                            groupValue: value,
                            onChanged: (value) {
                              userType.value = value!;
                            },
                          ),
                          Text('Student'),
                        ],
                      );
                    },
                  ),
                  const SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: () async {
                      final String email = emailController.text;
                      final String password = passwordController.text;
                      final String confirmPassword =
                          confirmPasswordController.text;
                      final String name = nameController.text;
                      // get a reference to the users collection
                      final usersRef =
                          FirebaseFirestore.instance.collection('users');
                      // check if email already exists in database
                      final querySnapshot =
                          await usersRef.where('email', isEqualTo: email).get();

                      print("dflkgnlkdnglknglk" + userType.value);

                      if (email.isEmpty ||
                          password.isEmpty ||
                          confirmPassword.isEmpty ||
                          name.isEmpty) {
                        // Display error message
                        final dialogContext = context;
                        showDialog(
                          context: dialogContext,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Error'),
                              content: const Text('Please fill all fields'),
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
                      } else if (querySnapshot.docs.isNotEmpty) {
                        //check if email is used
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Error'),
                              content: const Text('email is already used'),
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
                      } else if (name.length < 3) {
                        //name format
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Error'),
                              content:
                                  const Text('The password does not match'),
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
                      } else if (!emailRegex.hasMatch(email)) {
                        //email format
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Error'),
                              content: const Text('incorrect email'),
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
                      } else if (!passwordRegex.hasMatch(password)) {
                        //password match
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Error'),
                              content: const Text(
                                  'password must be at least 8 and have special character'),
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
                      } else if (password != confirmPassword) {
                        //password format
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Error'),
                              content:
                                  const Text('The password does not match'),
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
                      } else {
                        // All fields are filled, add data to database
                        FirebaseFirestore.instance.collection('users').add({
                          'fullname': name,
                          'email': email,
                          'password': password,
                          'type': userType.value,
                        });

                        // FirebaseFirestore.instance
                        //     .collection('StudentProgres')
                        //     .add({
                        //   'email': email,
                        //   'Level': 1,
                        //   'InLevel': 1,
                        // });

                        print(email + password + confirmPassword + name);

                        if (userType.value == "admin") {
                          User.email = email;
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Admin()),
                          );
                        } else {
                          User.email = email;
                          User.level = 1;
                          User.Inlevel = 1;
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Pre()),
                          );
                        }
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.black, // Set the desired background color here
                      ),
                      minimumSize:
                          MaterialStateProperty.all<Size>(const Size(100, 50)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.cyan),
                        ),
                      ),
                    ),
                    child: const Text(
                      'انشاء حساب',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 240, 241, 240),
                          fontStyle: FontStyle.italic,
                          fontFamily: 'casual',
                          letterSpacing: 5),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp()),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 117, 224,
                            164), // Set the desired background color here
                      ),
                      minimumSize:
                          MaterialStateProperty.all<Size>(const Size(100, 50)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.cyan),
                        ),
                      ),
                    ),
                    child: const Text(
                      'تسجبل دخول',
                      style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontStyle: FontStyle.italic,
                          fontFamily: 'casual',
                          letterSpacing: 5),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
