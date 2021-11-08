// this will decide how our single item from category list should look
// the category item has to show title and color so class must take title and class
// this should be a widget hence define stateless or stateful and not just the class, anything that renders is a widget

import 'package:flutter/material.dart';
import '../screens/category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  // const CategoryItem({ Key? key }) : super(key: key);
  final String title;
  final Color color;
  final String id; 

  CategoryItem(this.color, this.title, this.id);

  void changeScreen(BuildContext ctx){
    Navigator.of(ctx).pushNamed(CatergoryMealsScreen.routeName, arguments: 
    {'id' : id, 'title' : title},
    ); //instead of push use pushNamed // the arguments passed will be accessible in other files // pass a map of arguments, arguments can be map, numbers, strings, ...
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() => changeScreen(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15), //should match border radius of container
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text(title, style: Theme.of(context).textTheme.headline6,),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
