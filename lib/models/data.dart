class Recipe {
  String title;
  String description;
  String image;
  double calories;
  int carbo;
  int protein;

  Recipe(this.title, this.description, this.image, this.calories, this.carbo,
      this.protein);
}

List<Recipe> getRecipes() {
  return <Recipe>[
    Recipe("Chicken Pastilla", "So irresistibly delicious",
        "assets/images/pastilla.png", 5.0, 35, 6),
    Recipe("couscous", "True Moroccan classic with a meaty, chilli sauce",
        "assets/images/couscous.png", 4.7, 45, 10),
    Recipe("Soup", "Lamb, soup bones, lemon, tomato paste, brown lentils",
        "assets/images/soup.jpeg", 4.3, 30, 8),
    Recipe("Tagine", "White Onion, Fennel, and watercress Salad",
        "assets/images/splash1.png", 4.1, 35, 12),
    Recipe("Filet Mignon", "Bacon-Wrapped Filet Mignon",
        "assets/images/steak_bacon.png", 3.5, 55, 20),
  ];
}
