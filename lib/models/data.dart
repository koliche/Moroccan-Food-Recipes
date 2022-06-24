class Recipes {
  String image;
  String name;
  String subname;
  String cooktime;
  String rating;
  int calories;
  int carbo;
  int protein;
  Recipes(this.image, this.name, this.subname, this.cooktime, this.rating,
      this.calories, this.carbo, this.protein);
}

List<Recipes> getRecipe() {
  return <Recipes>[
    Recipes("assets/images/tagine.webp", "Beef Tagine", "Moroccan Beef Stew",
        "70min", "5.0", 250, 35, 6),
    Recipes("assets/images/soup.jpeg", "Soup", "Moroccan Harira Recipe",
        "40min", "4.3", 250, 35, 6),
    Recipes("assets/images/pastilla.png", "Chicken Pastilla",
        "So irresistibly delicious", "40min", "4.3", 250, 35, 6),
    Recipes("assets/images/briwat.png", "Briwat", "Almond Briouat Recipe",
        "100min", "4.0", 250, 35, 6),
    Recipes("assets/images/chebakiaa.jpeg", "Moroccan Chebakia",
        " Sesame and Honey Cookies", "290min", "4.6", 250, 35, 6),
    Recipes("assets/images/couscous.png", "couscous", "True Moroccan classic",
        "156min", "4.6", 145, 34, 4),
    Recipes("assets/images/fish.png", "chemoula fish",
        "so errilisably delicious", "123min", "4.7", 175, 56, 6),
  ];
}
