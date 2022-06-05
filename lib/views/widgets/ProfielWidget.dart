// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ProfielWidget extends StatefulWidget {
  const ProfielWidget({Key? key}) : super(key: key);

  @override
  State<ProfielWidget> createState() => _ProfielWidgetState();
}

class _ProfielWidgetState extends State<ProfielWidget> {
  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      "ProfielWidget",
      style: TextStyle(
        fontSize: 25,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ));
  }
}
