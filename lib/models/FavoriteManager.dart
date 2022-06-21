import 'package:flutter/material.dart';
import 'package:recipes_app/models/data.dart';

class FavoriteManager {
  //List<Recipes> mainDataList = getRecipe();
  static Icon hart = Icons.favorite as Icon;
  static List<Recipes> favoriteDataList = [];
  static int? indexOfRecipes;
  static bool? isFav;
  List<Recipes> getFavList() {
    return favoriteDataList;
  }

  void addToFavList(Recipes recipes) {
    favoriteDataList.add(recipes);
  }

  void removeFromFavList(Recipes recipes) {
    favoriteDataList.remove(recipes);
  }
}
