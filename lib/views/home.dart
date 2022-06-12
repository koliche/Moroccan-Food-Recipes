// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:recipes_app/models/data.dart';
import 'package:recipes_app/models/shared.dart';
import 'package:recipes_app/views/details.dart';
import 'package:recipes_app/views/widgets/Categories.dart';
import 'package:recipes_app/views/widgets/creatorsWidget.dart';
import 'package:recipes_app/views/widgets/recipe_card.dart';
import 'package:recipes_app/views/widgets/searchWidget.dart';

import '../models/buildRecipes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          // search bar ::::::
          Container(
            margin: const EdgeInsets.only(top: 20, left: 20),
            padding: const EdgeInsets.only(right: 150),
            child: const Text(
              "What do you want to cook today ?",
              style: TextStyle(
                fontSize: 25,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(top: 5, bottom: 10, left: 30, right: 20),
            child: const SearchWidget(),
          ),
          // Recipes Category :::::
          Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              Row(
                children: const [
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
                  children: const [
                    Categories(
                        text: "Breakfast",
                        images: "assets/images/breakfast.png"),
                    Categories(
                        text: "Lunch", images: "assets/images/lunch.png"),
                    Categories(
                        text: "Dinner", images: "assets/images/dinner.png"),
                  ],
                ),
              ),
            ],
          ),
          // Popular Recipes ::::::
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              Row(
                children: const [
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
              const SizedBox(
                height: 19,
              ),
              SizedBox(
                height: 350,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: buildRecipes(),
                ),
              ),
            ],
          ),
          // Recipes :
          Column(children: [
            const SizedBox(
              height: 16,
            ),
            Row(
              children: const [
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
            const SizedBox(
              height: 19,
            ),
            Column(
              children: const [
                RecipeCard(
                  image: "assets/images/tagine.webp",
                  name: "Beef Tagine",
                  subname: "Moroccan Beef Stew",
                  cooktime: "70min",
                  rating: "5.0",
                ),
                RecipeCard(
                  image: "assets/images/soup.jpeg",
                  name: "Soup",
                  subname: "Moroccan Harira Recipe",
                  cooktime: "40min",
                  rating: "4.3",
                ),
                RecipeCard(
                  image: "assets/images/briwat.png",
                  name: "Briwat",
                  subname: "Almond Briouat Recipe",
                  cooktime: "100min",
                  rating: "4.0",
                ),
                RecipeCard(
                  image: "assets/images/chebakiaa.jpeg",
                  name: "Moroccan Chebakia",
                  subname: " Sesame and Honey Cookies",
                  cooktime: "290min",
                  rating: "4.6",
                ),
              ],
            ),
          ])
        ],
      )),
    ));
  }

  List<Widget> buildRecipes() {
    List<Widget> list = [];
    for (var i = 0; i < getRecipes().length; i++) {
      list.add(buildRecipe(getRecipes()[i], i));
    }
    return list;
  }

  Widget buildRecipe(Recipe recipe, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Detail(recipe: recipe)),
        );
      },
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          //boxShadow: [kBoxShadow],
        ),
        margin: EdgeInsets.only(
            right: 16, left: index == 0 ? 16 : 0, bottom: 16, top: 8),
        padding: const EdgeInsets.all(16),
        width: 220,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Hero(
                tag: recipe.image,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(recipe.image),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            buildRecipeTitle(recipe.title),
            buildTextSubTitleVariation2(recipe.description),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildRating(recipe.calories.toString()),
                const Icon(
                  Icons.favorite_border,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
