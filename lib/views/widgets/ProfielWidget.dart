import 'dart:io';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
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
                  image: AssetImage('assets/images/profiel.png'),
                ),
              ),
            ),
          ),
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
    ));
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
