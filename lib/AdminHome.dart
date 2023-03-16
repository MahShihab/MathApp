import 'package:flutter/material.dart';
import 'package:project/Data.dart';
import 'package:project/StudentInfi.dart';
import 'package:project/main.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';

class Admin extends StatelessWidget {
  Admin({Key? key}) : super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _textController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      appBar: AppBar(
        leading: const Icon(Icons.account_circle),
        backgroundColor: Colors.teal,
        elevation: 4,
        title: FutureBuilder<String>(
          future: getFullNameFromEmail(User.email),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!);
            } else if (snapshot.hasError) {
              return Text("Error");
            } else {
              return const Text("Loading...");
            }
          },
        ),
      ),
      body: FutureBuilder<List<String>>(
      future: getStudentEmailsForAdmin(User.email),
      builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: double.infinity,
                color: Colors.grey[200],
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {
                        User.StudentEmailInfo = snapshot.data![index];
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  StudentInfo()),
                        );
                      },
                      title: Text(snapshot.data![index]),
                      trailing: Icon(Icons.arrow_forward_ios_rounded),
                    ),
                    Divider(),
                  ],
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Error"),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ),
    floatingActionButton: FloatingActionButton(
  onPressed: () {
    showSearchDialog(context);
  },
  child: Icon(Icons.add),
  backgroundColor: Colors.teal,
),

    floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
  );
  }

  showSearchDialog(BuildContext context) {
  String email = "";

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Search for user"),
        content: TextField(
          onChanged: (value) {
            email = value;
          },
          decoration: InputDecoration(
            labelText: "Email",
            hintText: "Enter email address",
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () async {
              // search for user in Firestore
              final usersRef = FirebaseFirestore.instance.collection('users');
                    // check if email already exists in database
              final querySnapshot = await usersRef.where('email', isEqualTo: email).get();

              final StudentsList = FirebaseFirestore.instance.collection('StudentsList');
                    // check if email already exists in database
              final AdminStudent = await usersRef.where('AdminEmail', isEqualTo: User.email).get();


              if (querySnapshot.docs.isNotEmpty) {
                // check if user is a student
                final userType = querySnapshot.docs.first.get('type');
                // String userType = userDoc.get("type");
                if (userType == "student") {
                  // user is a student

                  if(AdminStudent.docs.isEmpty){

                    Navigator.pop(context);
                    //Add to database
                    FirebaseFirestore.instance.collection('StudentsList').add({
                        'AdminEmail': User.email,
                        'StudentEmail': email,
                      });

                      

                    // ignore: use_build_context_synchronously
                  showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Added Succesfully'),
                            // content: const Text('Student is already added'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  // Navigator.of(context).pop();
                                  Navigator.push(
                                  context,
                                    MaterialPageRoute(builder: (context) =>  Admin()),
                                  );
                                },
                                child: const Text('OK'),
                              ),
                            ],
                          );
                        },
                      );  

                  }
                  else{
                    Navigator.pop(context);

                  // ignore: use_build_context_synchronously
                  showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Error'),
                            content: const Text('Student is already added'),
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



                  




                } else {
                  // user is not a student
                  Navigator.pop(context);

                  // ignore: use_build_context_synchronously
                  showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Error'),
                            content: const Text('Its not a student'),
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
              } else {
                // user not found in Firestore
                // ignore: use_build_context_synchronously
                Navigator.pop(context);

                // ignore: use_build_context_synchronously
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
                            ],
                          );
                        },
                      );
              }
            },
            child: const Text("Add student"),
          ),
        ],
      );
    },
  );
}


  Future<String> getFullNameFromEmail(String email) async {
    var querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      var fullname = querySnapshot.docs.first.get('fullname');
      return fullname as String;
    } else {
      return 'Loading...';
    }
  }


  Future<List<String>> getStudentEmailsForAdmin(String adminEmail) async {
    List<String> studentEmails = [];

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('StudentsList')
        .where('AdminEmail', isEqualTo: adminEmail)
        .get();

    querySnapshot.docs.forEach((doc) {
      String studentEmail = doc.get('StudentEmail');
      studentEmails.add(studentEmail);
    });
    print(adminEmail);
    print( studentEmails);

    return studentEmails;
  }
}
