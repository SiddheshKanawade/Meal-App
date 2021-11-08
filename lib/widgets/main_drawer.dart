import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/filter_screen.dart';

class MainDrawer extends StatelessWidget {

  Widget buildListTile(String title, IconData icon, Function tabHandler){
    return ListTile(
            leading: Icon(
              icon,
              size: 26,
            ),
            title: Text(
              title,
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              tabHandler();
            },
          );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            // to create heading
            height: MediaQuery.of(context).size.height * 0.25,
            color: Theme.of(context).accentColor,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment
                .centerLeft, //alignment decides the alignment of the container, center left means vertically center, horizontally left
            child: Text(
              'Cooking Up',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30, // we can set the color even by box decoration, but if we just want to set color then color is a good opt
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          buildListTile('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FilterScreen.routeName);
          })
        ],
      ),
    );
  }
}
