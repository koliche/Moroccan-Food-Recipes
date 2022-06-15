class Recipe {
  String title;
  String description;
  String image;
  double ratings;
  int calories;
  int carbo;
  int protein;

  Recipe(this.title, this.description, this.image, this.ratings, this.calories,
      this.carbo, this.protein);
}

class Recipes {
  String image;
  String name;
  String subname;
  String cooktime;
  String rating;
  int calories;
  int carbo;
  int protein;
  Recipes(this.image, this.name, this.subname, this.cooktime, this.rating, this.calories,
      this.carbo, this.protein);
}

List<Recipe> getRecipes() {
  return <Recipe>[
    Recipe("Chicken Pastilla", "So irresistibly delicious",
        "assets/images/pastilla.png", 5.0, 250, 35, 6),
    Recipe("couscous", "True Moroccan classic with a meaty, chilli sauce",
        "assets/images/couscous.png", 4.7, 222, 45, 10),
    Recipe("Soup", "Lamb, soup bones, lemon, tomato paste, brown lentils",
        "assets/images/soup.jpeg", 4.3, 22, 30, 8),
    Recipe("Tagine", "White Onion, Fennel, and watercress Salad",
        "assets/images/splash1.png", 4.1, 34, 35, 12),
    Recipe("Filet Mignon", "Bacon-Wrapped Filet Mignon",
        "assets/images/steak_bacon.png", 3.5, 33, 55, 20),
  ];
}
List<Recipes> getRecipe() {
  return <Recipes>[
    Recipes("assets/images/tagine.webp", "Beef Tagine",
        "Moroccan Beef Stew", "70min","5.0",250, 35, 6),
    Recipes("assets/images/soup.jpeg", "Soup",
        "Moroccan Harira Recipe",  "40min", "4.3",250, 35, 6),
    Recipes("assets/images/soup.jpeg", "Soup",
        "Moroccan Harira Recipe","40min","4.3",250, 35, 6),
    Recipes("assets/images/briwat.png", "Briwat",
        "Almond Briouat Recipe", "100min", "4.0",250, 35, 6),
    Recipes("assets/images/chebakiaa.jpeg", "Moroccan Chebakia",
        " Sesame and Honey Cookies", "290min","4.6",250, 35, 6),
  ];
}

               
                