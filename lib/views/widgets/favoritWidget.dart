import 'package:flutter/material.dart';

class FavoritWidget extends StatefulWidget {
  FavoritWidget({Key? key}) : super(key: key);

  @override
  State<FavoritWidget> createState() => _FavoritWidgetState();
}

class _FavoritWidgetState extends State<FavoritWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("FavoritWidget "),
    );
  }
}
