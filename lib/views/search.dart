// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipes_app/constants.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: null,
        backgroundColor: kPrimaryColor,
        foregroundColor: Colors.white,
        title: Text("search bar"),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(left: 10, top: 20, right: 18.0),
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
                // ignore: prefer_const_constructors
                child: TextField(
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
      ),
    );
  }
}
