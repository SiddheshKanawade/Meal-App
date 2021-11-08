import 'package:flutter/material.dart';
import './screens/filter_screen.dart';
import './screens/tabs_screen.dart';
import './screens/error_screen.dart';
import './screens/category_meals_screen.dart';
import './screens/meal_detail_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DailyMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: CategoriesScreen(), //home marks the entry point of app
      initialRoute: '/', //default is '/
      routes: {
        '/': (ctx) => TabsScreen(), //home page
        CatergoryMealsScreen.routeName: (ctx) => CatergoryMealsScreen(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FilterScreen.routeName: (ctx) => FilterScreen()
      },

      //this method will be called when any unknown path is called, replace it with some error page
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => ErrorScreen(),
        );
      },
    );
  }
}

// dont need this since we are having a different homepage
// class MyHomePage extends StatefulWidget {
//     @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('DailyMeals'),
//       ),
//       body: Center(
//         child: Text('Navigation Time!'),
//       ),
//     );
//   }
// }
