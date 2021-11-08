import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/meal_item.dart';
import '../data/DummyCategories.dart';
import '../modules/meal.dart';

class CatergoryMealsScreen extends StatefulWidget {
  // const CatergoryMealsScreen({ Key? key }) : super(key: key);
  // we expect the following information, so we need to take it in
  // final String catergoryId;
  // final String catergoryTitle;

  // adding code for pop method

  // CatergoryMealsScreen(this.catergoryId, this.catergoryTitle); //dont need this when we are using routes method
  static const routeName = '/category-meals';

  @override
  State<CatergoryMealsScreen> createState() => _CatergoryMealsScreenState();
}

class _CatergoryMealsScreenState extends State<CatergoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  bool _loadedinitdata = false;

  @override
  void initState() {
    // context is not allowed in initstate, since init is triggered before build of widget
    // final routeArgs = ModalRoute.of(context).settings.arguments as Map<String,
    //     String>; //extract route arguments //cant declare this above since it required context and its not present above
    // categoryTitle = routeArgs['title'];
    // final categoryId = routeArgs[
    //     'id']; // will output only those meals which will meet this category

    // //category meals will be a list, why dont we initiate it with list?
    // displayedMeals = DUMMY_MEALS.where((meal) {
    //   return meal.categories.contains(categoryId);
    // }).toList();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // this runs a bit late, we call the setState() from below code and hence we render all the meals, hence use a boolean to avoid this
    if (_loadedinitdata == false) {
      final routeArgs = ModalRoute.of(context).settings.arguments as Map<String,
          String>; //extract route arguments //cant declare this above since it required context and its not present above
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs[
          'id']; // will output only those meals which will meet this category

      //category meals will be a list, why dont we initiate it with list?
      displayedMeals = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedinitdata = true;
    }
    super.didChangeDependencies();
  }

  void removeMeal(String mealId) {
    displayedMeals.removeWhere((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          //here we should have a single column widget, build a meal widget in new file and just pass its reference over here
          return MealItem(
            duration: displayedMeals[index].duration,
            imageUrl: displayedMeals[index].imageUrl,
            title: displayedMeals[index].title,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
            id: displayedMeals[index].id,
            removeItem: removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
