// ignore_for_file: file_names

import 'package:flutter/material.dart';

class FavoritWidget extends StatefulWidget {
  const FavoritWidget({Key? key}) : super(key: key);

  @override
  State<FavoritWidget> createState() => _FavoritWidgetState();
}

class _FavoritWidgetState extends State<FavoritWidget> {
  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      "FavoritWidget ",
      style: TextStyle(
        fontSize: 25,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ));
  }
}
