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
        // Bottom Navigation Bar ::::::
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
                  label: "Creator", icon: new Icon(Icons.category)),
              new BottomNavigationBarItem(
                  label: "Favorite", icon: new Icon(Icons.favorite)),
              new BottomNavigationBarItem(
                  label: "Profile", icon: new Icon(Icons.person)),
            ]),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Column(
            children: <Widget>[
              // search bar ::::::
              Container(
                margin: EdgeInsets.only(top: 20, left: 20),
                padding: EdgeInsets.only(right: 150),
                child: Text(
                  "What do you want to cook today ?",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                    top: 5, bottom: 10, left: 30, right: 20),
                child: SearchWidget(),
              ),
              // Recipes Category :::::
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
                      padding: const EdgeInsets.only(top: 13.0, left: 13),
                      child: Row(
                        children: [
                          Categories(
                              text: "Breakfast",
                              images: "assets/images/breakfast.png"),
                          Categories(
                              text: "Lunch", images: "assets/images/lunch.png"),
                          Categories(
                              text: "Dinner",
                              images: "assets/images/dinner.png"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Popular Recipes ::::::
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
                        image: "assets/images/tagine.webp",
                        name: "Beef Tagine",
                        subname: "Moroccan Beef Stew",
                        cooktime: "70min",
                        rating: "5.0",
                      ),
                      const RecipeCard(
                        image: "assets/images/soup.jpeg",
                        name: "Soup",
                        subname: "Moroccan Harira Recipe",
                        cooktime: "40min",
                        rating: "4.3",
                      ),
                      const RecipeCard(
                        image: "assets/images/briwat.png",
                        name: "Briwat",
                        subname: "Almond Briouat Recipe",
                        cooktime: "100min",
                        rating: "4.0",
                      ),
                      const RecipeCard(
                        image: "assets/images/chebakiaa.jpeg",
                        name: "Moroccan Chebakia",
                        subname: " Sesame and Honey Cookies",
                        cooktime: "290min",
                        rating: "4.6",
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
