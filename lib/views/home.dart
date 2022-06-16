// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:recipes_app/models/data.dart';
import 'package:recipes_app/models/shared.dart';
import 'package:recipes_app/views/Detail.dart';
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
              SizedBox(
                height: 70,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
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
          // Recipes ::::::::::::::::::::::::::::::::::
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
            Column(children: [
              SizedBox(
                height: 138,
                child: ListView(
                  padding: EdgeInsets.only(left: 10),
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: Recipescard(),
                ),
              )
            ]),
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

  // for popular recipe
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

  // for all recipes
  List<Widget> Recipescard() {
    List<Widget> list = [];
    for (var i = 0; i < getRecipes().length; i++) {
      list.add(RecipeCard(getRecipe()[i], i));
    }
    return list;
  }

  Widget RecipeCard(Recipes recipes, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return Details(recipes: recipes);
          }),
        );
      },
      child: Container(
          margin: EdgeInsets.only(right: 20),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: Colors.white,
          ),
          child: Stack(
            children: [
              SizedBox(
                height: 130,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(
                      height: 130,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            // Recipes Images :::::::::::::::
                            SizedBox(
                              height: 120,
                              width: 110,
                              child: Image.asset(
                                recipes.image,
                                height: 30,
                                width: 30,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            // Recipes name ::::::::::::
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0, left: 8),
                                              child: Text(
                                                recipes.name,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                    fontSize: 16),
                                              ),
                                            ),
                                            // Recipes subname ::::::::::::
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Text(
                                                recipes.subname,
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.grey,
                                                    fontSize: 16),
                                              ),
                                            ),
                                            // Favorite Icon To add recipes to the favorite liste ::::::
                                            const Padding(
                                                padding: EdgeInsets.only(
                                                    left: 9.0, top: 33),
                                                child: Icon(
                                                  Icons.favorite_border,
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                  right: 15,
                  bottom: 20,
                  child: Column(
                    children: [
                      // Recipes CookTime ::::::
                      Container(
                        margin: const EdgeInsets.only(bottom: 50),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.schedule,
                              color: Colors.grey,
                              size: 18,
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Text(
                              recipes.cooktime,
                            )
                          ],
                        ),
                      ),
                      // Recipes Rating :::::::
                      Container(
                        height: 25,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(6)),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.star,
                                size: 15,
                                color: Colors.black,
                              ),
                              Text(
                                recipes.rating,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ))
            ],
          )),
    );
  }
}
