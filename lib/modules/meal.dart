//defining properties of a specific meal

import 'package:flutter/foundation.dart';
enum Complexity{
  Simple, Challenging, Hard
}

enum Affordability{
  Affordable, Pricey, Luxurious
}

class Meal{
  final String id;
  final List<String> categories; //in which categories this meal comes
  final String title; 
  final String imageUrl; // image parsed from server, not stored on local machine
  final List<String> ingredients; 
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  // now these are for filter
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;

  const Meal({@required this.id, @required this.affordability, @required this.title, @required this.categories, @required this.complexity, @required this.duration, @required this.imageUrl, @required this.ingredients, @required this.isGlutenFree, @required this.isLactoseFree, @required this.isVegan, @required this.isVegetarian, @required this.steps});

}