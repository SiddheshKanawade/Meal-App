// we need to use scafold widget since we are using this widget as screen and it will have its own appbar and stuff

import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/CategoryItem.dart';

import '../data/DummyCategories.dart'; //unlock DUMMY_CATEGORIES list

class CategoriesScreen extends StatelessWidget {
  // const CategoriesScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GridView(
        // children: <Widget>[
        //   ...DUMMY_CATEGORIES.map((CatData) => CategoryItem(CatData.title, CatData.color)).toList(), // here we have considered mapping a list under a list, but this can be done either way
        // ],
        children: DUMMY_CATEGORIES
            .map((CatData) => CategoryItem(CatData.color, CatData.title, CatData.id))
            .toList(), // children expects the list of widgets, so no need to assign widget[], if we are mapping a single list item
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          //these are scrollable areas on screen
          //takes care of layout
          // max width is defined and it will show as many items as possible in given width of the screen
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2, //height / width ratio
          crossAxisSpacing: 20,
          mainAxisSpacing: 20, //distance between different grid elements
        ),
        padding: const EdgeInsets.all(25),
      
    );
  }
}
