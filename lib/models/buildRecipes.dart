import 'package:flutter/material.dart';
import 'package:recipes_app/models/data.dart';
import 'package:recipes_app/models/shared.dart';

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
      /*Navigator.push(
          context,
          //MaterialPageRoute(builder: (context) => Detail(recipe: recipe)),
        );*/
    },
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        //boxShadow: [kBoxShadow],
      ),
      margin: EdgeInsets.only(
          right: 16, left: index == 0 ? 16 : 0, bottom: 16, top: 8),
      padding: EdgeInsets.all(16),
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
          SizedBox(
            height: 8,
          ),
          buildRecipeTitle(recipe.title),
          buildTextSubTitleVariation2(recipe.description),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildRating(recipe.calories.toString()),
              Icon(
                Icons.favorite_border,
              )
            ],
          ),
        ],
      ),
    ),
  );
}
