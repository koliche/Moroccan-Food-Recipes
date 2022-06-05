// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';

class Upside extends StatelessWidget {
  String imgUri;
  Upside({Key? key, required this.imgUri}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 600,
          height: 500,
          color: Colors.greenAccent,
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Image.asset(
              imgUri,
              alignment: Alignment.topCenter,
              scale: 8,
            ),
          ),
        ),
        // iconBottom (context) ::::::
        Positioned(
          left: 0,
          top: 175,
          child: Image.asset(
            "assets/images/loginpart1.png",
            scale: 3,
          ),
        ),
        Positioned(
          right: 0,
          top: 60,
          child: Image.asset(
            "assets/images/loginpart2.png",
            scale: 3,
          ),
        ),
      ],
    );
  }
}
