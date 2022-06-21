// ignore_for_file: prefer_const_constructors, deprecated_member_use, duplicate_ignore

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipes_app/constants.dart';
import 'package:recipes_app/models/data.dart';
import 'package:recipes_app/views/Detail.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

final controller = TextEditingController();
// The problem is here ::::::::::::
List<Recipes> recipes = getRecipe();

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
      body: Column(
        children: [
          Container(
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
                      controller: controller,
                      cursorColor: Colors.grey,
                      onChanged: searchRecipes,
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

          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(left: 10),
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemCount: recipes.length,
              itemBuilder: (BuildContext context, int index) {
                final reci = recipes[index];
                return ListTile(
                  leading: Image.asset(
                    reci.image,
                    fit: BoxFit.cover,
                    width: 50,
                    height: 50,
                  ),
                  title: Text(reci.name),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return Details(
                          recipes: reci,
                        );
                      }),
                    );
                  },
                );
              },
            ), // ListView.builder
          ), // Expanded
        ],
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
            return Details(
              recipes: recipes,
            );
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
            ],
          )),
    );
  }

  void searchRecipes(String query) {
    final suggestions = getRecipe().where((reci) {
      final recipeTitle = reci.name.toLowerCase();
      final input = query.toLowerCase();
      return recipeTitle.contains(input);
    }).toList();
    setState(() => recipes = suggestions);
  }
}
