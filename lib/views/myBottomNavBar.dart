import 'package:flutter/material.dart';
import 'package:recipes_app/views/home.dart';
import 'package:recipes_app/views/widgets/ProfielWidget.dart';
import 'package:recipes_app/views/widgets/creatorsWidget.dart';
import 'package:recipes_app/views/widgets/favoritWidget.dart';

class MyBottomNavBar extends StatefulWidget {
  MyBottomNavBar({Key? key}) : super(key: key);

  @override
  State<MyBottomNavBar> createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int selectedIndex = 0;
  List<Widget> myWidgets = [
    HomePage(),
    CreatorWidget(),
    FavoritWidget(),
    ProfielWidget()
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
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
                label: "Home", icon: new Icon(Icons.home)),
            new BottomNavigationBarItem(
                label: "Creator", icon: new Icon(Icons.category)),
            new BottomNavigationBarItem(
                label: "Favorite", icon: new Icon(Icons.favorite)),
            new BottomNavigationBarItem(
                label: "Profile", icon: new Icon(Icons.person)),
          ],
          currentIndex: selectedIndex,
          onTap: (int index) {
            updateUI(index);
          }),
    );
  }
}
