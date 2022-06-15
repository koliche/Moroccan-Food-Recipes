// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipes_app/constants.dart';

class Upside extends StatelessWidget {
  Upside({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 600,
          height: 400,
          color: kPrimaryColor,
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Image.asset(
              "assets/images/login.png",
              alignment: Alignment.topCenter,
              scale: 8,
            ),
          ),
        ),
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

class UnderPart extends StatelessWidget {
  const UnderPart(
      {Key? key,
      required this.title,
      required this.navigatorText,
      required this.onTap})
      : super(key: key);
  final String title;
  final String navigatorText;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 13,
              color: Colors.black,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 20,
        ),
        InkWell(
          onTap: () {
            onTap();
          },
          child: Text(
            navigatorText,
            style: const TextStyle(
                color: kPrimaryAccetsColor,
                fontSize: 13,
                fontWeight: FontWeight.bold,
                fontFamily: 'Opensans'),
          ),
        )
      ],
    );
  }
}
