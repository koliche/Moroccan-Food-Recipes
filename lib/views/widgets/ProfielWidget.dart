// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipes_app/views/login.dart';
import 'package:recipes_app/views/myBottomNavBar.dart';

class ProfielWidget extends StatefulWidget {
  const ProfielWidget({Key? key}) : super(key: key);

  @override
  State<ProfielWidget> createState() => _ProfielWidgetState();
}

class _ProfielWidgetState extends State<ProfielWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 80, left: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "ProfielWidget",
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              child: Text("Log Out"),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                print("sign Out");
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
            ),
          ],
        ));
  }
}
