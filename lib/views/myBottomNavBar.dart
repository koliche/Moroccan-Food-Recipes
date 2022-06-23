// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:recipes_app/views/FavoriteScreen.dart';
import 'package:recipes_app/views/Profiel.dart';
import 'package:recipes_app/views/home.dart';
import 'package:recipes_app/views/login.dart';
import 'package:recipes_app/views/widgets/ProfielWidget.dart';
import 'package:recipes_app/views/widgets/creatorsWidget.dart';
import 'package:recipes_app/views/widgets/favoritWidget.dart';

class MyBottomNavBar extends StatefulWidget {
  const MyBottomNavBar({Key? key}) : super(key: key);

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int selectedIndex = 0;
  List<Widget> myWidgets = [
    const HomePage(),
    const CreatorWidget(),
    FavoriteScreen(),
    ProfielScreen(),
  ];
  void updateUI(int newVal) {
    setState(() {
      selectedIndex = newVal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: myWidgets[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.greenAccent,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                // ignore: unnecessary_const
                label: "Home",
                icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: "Creator", icon: Icon(Icons.category)),
            BottomNavigationBarItem(
                label: "Favorite", icon: Icon(Icons.favorite)),
            BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.person)),
          ],
          currentIndex: selectedIndex,
          onTap: (int index) {
            updateUI(index);
          }),
    );
  }
}
