import 'package:flutter/material.dart';
import '../screens/meal_detail_screen.dart';
import '/modules/meal.dart';

class MealItem extends StatelessWidget {
  // const MealItem({ Key? key }) : super(key: key);
  final String title;
  final String id;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeItem;

  MealItem(
      {@required this.duration,
      @required this.id,
      @required this.imageUrl,
      @required this.title,
      @required this.affordability,
      @required this.removeItem,
      @required this.complexity});

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      MealDetailScreen.routeName,
      arguments: id,
    )
        .then((result) {
      if (result != null) {
        removeItem(result); //then is called when we render the page from navigator and pass the argument in .pop()
      }
    });
  }

  String get complexityText {
    //we can also use the switch statement, on place of if/else, its somewhat like case in verilog, break statement is necessary
    if (complexity == Complexity.Simple) {
      return 'Simple';
    }
    if (complexity == Complexity.Hard) {
      return 'Hard';
    }
    if (complexity == Complexity.Challenging) {
      return 'Challenging';
    }
  }

  String get affordabilityText {
    //we can also use the switch statement, on place of if/else, its somewhat like case in verilog, break statement is necessary
    if (affordability == Affordability.Affordable) {
      return 'Affordable';
    }
    if (affordability == Affordability.Luxurious) {
      return 'Luxurious';
    }
    if (affordability == Affordability.Pricey) {
      return 'Pricey';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(imageUrl,
                      height: MediaQuery.of(context).size.height * 0.35,
                      width: double.infinity,
                      fit: BoxFit
                          .cover), // we want circular radius only in top left and right
                ),
                Positioned(
                  right: 10,
                  bottom: 20,
                  child: Container(
                    width: MediaQuery.of(context).size.width *
                        0.75, //work on width of this container, some text are too small and some are too big, try adding if else
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    color: Colors.black54,
                    child: Text(
                      title,
                      style:
                          TextStyle(fontSize: 25, color: Colors.pink.shade50),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                      textAlign: TextAlign.right,
                    ),
                  ),
                )
              ],
            ), //allow to overlap widgets, image and text on it
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  //duration
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text('$duration min'),
                    ],
                  ),
                  // complexity
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                          complexityText), //no need to pass function with parenthesis//complexity is not of String datatype, so cant pass complexity directly, hence need to assign a getter
                    ],
                  ),

                  //affordability
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                          affordabilityText), //no need to pass function with parenthesis//complexity is not of String datatype, so cant pass complexity directly, hence need to assign a getter
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
