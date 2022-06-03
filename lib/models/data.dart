class Recipe {
  String title;
  String description;
  String image;
  int calories;
  int carbo;
  int protein;

  Recipe(this.title, this.description, this.image, this.calories, this.carbo,
      this.protein);
}

List<Recipe> getRecipes() {
  return <Recipe>[
    Recipe("Chicken Pastilla", "So irresistibly delicious",
        "assets/images/pastilla.png", 250, 35, 6),
    Recipe("couscous", "True Italian classic with a meaty, chilli sauce",
        "assets/images/couscous.png", 200, 45, 10),
    Recipe("Soup", "Crispy Garlic Roasted Potatoes", "assets/images/soup.jpeg",
        150, 30, 8),
    Recipe("Tagine", "White Onion, Fennel, and watercress Salad",
        "assets/images/splash1.png", 190, 35, 12),
    Recipe("Filet Mignon", "Bacon-Wrapped Filet Mignon",
        "assets/images/steak_bacon.png", 250, 55, 20),
  ];
}
