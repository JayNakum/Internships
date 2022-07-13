/// [Categories] is an enum that contains various [Store] categories

enum Categories {
  other,
  groceries,
  fruitsAndVegetables,
  food,
  drinks,
  bakery;

  /// [toString] returns the string representation of the enum
  @override
  String toString() {
    switch (this) {
      case Categories.other:
        return 'Other';
      case Categories.groceries:
        return 'Groceries';
      case Categories.fruitsAndVegetables:
        return 'Fruits & Vegetables';
      case Categories.food:
        return 'Food';
      case Categories.drinks:
        return 'Drinks';
      case Categories.bakery:
        return 'Bakery';
      default:
        return toString();
    }
  }
}
