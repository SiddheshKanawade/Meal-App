import 'package:flutter/material.dart';
import '../data/DummyCategories.dart';

class MealDetailScreen extends StatelessWidget {
  // const MealDetailScrenn({ Key? key }) : super(key: key);
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere(
      (meal) => meal.id == mealId,
    ); //we need only one meal hence, will take only first true meal. and dont check the rest

    Widget BuildSectionTitle(BuildContext context, String text) {
      //we have to show title many times, hence use selecttitle method
      return Container(
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline6,
        ),
      );
    }

    Widget BuildContainer(Widget child) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width * 0.7,
        child: child,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10),
              height: MediaQuery.of(context).size.height * 0.35,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            BuildSectionTitle(context, 'Ingredients'),
            BuildContainer(
              ListView.builder(
                  itemBuilder: (ctx, index) => Card(
                        color: Theme.of(context).accentColor,
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              selectedMeal.ingredients[index],
                            ),
                          ),
                        ),
                      ),
                  itemCount: selectedMeal.ingredients.length),
            ),
            BuildSectionTitle(context, 'Steps'),
            BuildContainer(
              ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index + 1}'),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    Divider(), //draws the light line
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        
        onPressed: () {
          Navigator.of(context).pop(mealId);
        },
        
      ),
    );
  }
}
