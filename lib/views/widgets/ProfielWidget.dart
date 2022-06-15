// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipes_app/views/login.dart';
import 'package:recipes_app/views/myBottomNavBar.dart';
import 'package:recipes_app/views/widgets/profielInfo.dart';

class ProfielWidget extends StatefulWidget {
  const ProfielWidget({Key? key}) : super(key: key);

  @override
  State<ProfielWidget> createState() => _ProfielWidgetState();
}

class _ProfielWidgetState extends State<ProfielWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Info(
            image: "assets/images/pic.png",
            name: "Jhon Doe",
            email: "Jhondoe01@gmail.com",
          ),
          SizedBox(height: 40), //20
          ProfileMenuItem(
            iconSrc: "assets/images/info.svg",
            title: "Saved Recipes",
          ),
          ProfileMenuItem(
            iconSrc: "assets/images/info.svg",
            title: "Super Plan",
          ),
          ProfileMenuItem(
            iconSrc: "assets/images/info.svg",
            title: "Change Language",
          ),
          ProfileMenuItem(
            iconSrc: "assets/images/info.svg",
            title: "Help",
          ),
        ],
      ),
    );
  }
}
