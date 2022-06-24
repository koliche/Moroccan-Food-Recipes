import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:recipes_app/constants.dart';
import 'package:recipes_app/models/userModel.dart';
import 'package:recipes_app/views/widgets/ProfileMenuItem.dart';

class ProfielWidget extends StatefulWidget {
  const ProfielWidget({Key? key}) : super(key: key);

  @override
  _ProfielWidgetState createState() => _ProfielWidgetState();
}

class _ProfielWidgetState extends State<ProfielWidget> {
  CollectionReference usersInfo =
      FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
        future: usersInfo.doc(FirebaseAuth.instance.currentUser!.uid).get(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Scaffold(
                body: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 14,
                  ),
                  Container(
                    width: 150,
                    height: 150,
                    padding: EdgeInsets.all(8),
                    decoration: avatarDecoration,
                    child: Container(
                      decoration: avatarDecoration,
                      padding: EdgeInsets.all(3),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(data['profileImage']),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 14,
                          ),
                          Text(
                            data['fullName'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ]),
                  ),
                  Container(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                            data['email'],
                            style: TextStyle(fontWeight: FontWeight.w300),
                          ),
                        ]),
                  ),
                  SizedBox(height: 40), //20
                  ProfileMenuItem(
                    icon: Icons.info,
                    text: "info",
                  ), //20
                  ProfileMenuItem(
                    icon: Icons.lock,
                    text: "privacy",
                  ), //20
                  ProfileMenuItem(
                    icon: Icons.access_time_outlined,
                    text: "about",
                  ), //20
                  ProfileMenuItem(
                    icon: Icons.help_center,
                    text: "help",
                  ),
                ],
              ),
            ));
          }
          return Text("data not found !");
        }));
  }

  String getHumanReadableDate(int dt) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(dt);

    return DateFormat('dd MMM yyyy').format(dateTime);
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    DatabaseReference? _ref;
    properties.add(DiagnosticsProperty<DatabaseReference>('_ref', _ref));
  }
}
