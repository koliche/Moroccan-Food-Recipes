import 'package:flutter/material.dart';
import 'package:recipes_app/models/data.dart';
import 'package:recipes_app/models/shared.dart';
import 'package:recipes_app/views/widgets/Categories.dart';
import 'package:recipes_app/views/widgets/recipe_card.dart';
import 'package:recipes_app/views/widgets/searchWidget.dart';

import '../models/buildRecipes.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.greenAccent,
            currentIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            items: <BottomNavigationBarItem>[
              new BottomNavigationBarItem(
                  label: "Home", icon: new Icon(Icons.home)),
              new BottomNavigationBarItem(
                  label: "Categories", icon: new Icon(Icons.category)),
              new BottomNavigationBarItem(
                  label: "Favorite", icon: new Icon(Icons.favorite)),
              new BottomNavigationBarItem(
                  label: "Profile", icon: new Icon(Icons.person)),
            ]),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
            children: <Widget>[
              Container(
                color: Colors.grey,
                padding: const EdgeInsets.symmetric(
                    vertical: 26.0, horizontal: 35.0),
                child: SearchWidget(),
              ),
              // Recipes Category :
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 18,
                        ),
                        Text(
                          "Category ",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 13.0),
                      child: Row(
                        children: [
                          Categories(
                              text: "Pizza", images: "assets/images/pizza.png"),
                          Categories(
                              text: "Ramin", images: "assets/images/pizza.png"),
                          Categories(
                              text: "Dinner",
                              images: "assets/images/pizza.png"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Popular Recipes :
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 18,
                        ),
                        Text(
                          "Popular Recipes ",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 19,
                    ),
                    Container(
                      height: 350,
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: buildRecipes(),
                      ),
                    ),
                  ],
                ),
              ),
              // Recipes :
              Container(
                child: Column(children: [
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 18,
                      ),
                      Text(
                        "Recipes ",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 19,
                  ),
                  Container(
                      child: Column(
                    children: [
                      const RecipeCard(
                        image: "assets/images/splash1.png",
                        name: "Tagine",
                        subname: "koliche",
                      ),
                      const RecipeCard(
                        image: "assets/images/splash1.png",
                        name: "Tagine",
                        subname: "koliche",
                      ),
                      const RecipeCard(
                        image: "assets/images/splash1.png",
                        name: "Tagine",
                        subname: "koliche",
                      ),
                    ],
                  )),
                ]),
              )
            ],
          )),
        ));
  }
}
