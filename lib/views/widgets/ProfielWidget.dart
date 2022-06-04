import 'package:flutter/material.dart';

class ProfielWidget extends StatefulWidget {
  ProfielWidget({Key? key}) : super(key: key);

  @override
  State<ProfielWidget> createState() => _ProfielWidgetState();
}

class _ProfielWidgetState extends State<ProfielWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        "ProfielWidget",
        style: TextStyle(
          fontSize: 25,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      )),
    );
  }
}
