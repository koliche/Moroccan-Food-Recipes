import 'package:flutter/material.dart';

class CreatorWidget extends StatelessWidget {
  const CreatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        "CreatorWidget",
        style: TextStyle(
          fontSize: 25,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      )),
    );
  }
}
