// ignore_for_file: file_names, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(right: 18.0),
      child: Row(
        children: <Widget>[
          // search TextField
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: const TextField(
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.search,
                    size: 25.0,
                    color: Colors.greenAccent,
                  ),
                  border: InputBorder.none,
                  hintText: "search by recipes name ...",
                ),
              ),
            ),
          ),
          //icon Filter setting ::::::::::
          Container(
            width: 50.0,
            height: 50.0,
            margin: const EdgeInsets.only(left: 12.0),
            decoration: BoxDecoration(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: const Icon(
              FontAwesomeIcons.slidersH,
              color: Colors.white,
              size: 20.0,
            ),
          )
        ],
      ),
    );
  }
}
