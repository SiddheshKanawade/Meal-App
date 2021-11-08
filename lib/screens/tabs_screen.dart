import 'package:flutter/material.dart';
import '../screens/categories_screen.dart';
import '../screens/favourites_screen.dart';
import '../widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  // const TabsScreen({ Key? key }) : super(key: key);

  //we need to select the tab manually, so we need to have list of widgets
  

  


  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  
  final List<Map<String, Object>> selectedScreen = [
    // we can even add action buttons in the appbar using this map
    // we defined object since the second element of the map is not constant, in first we have string, in next a widget
    {'title' : 'Categories', 'page' : CategoriesScreen(),},
    {'title' : 'Your Favourites', 'page' : FavouritesScreen(), }
  ];

  int selectedScreenIndex = 0;

  void _selectpage(int index){
    //index is passed automatically by flutter
    //we know what was selected by executing this function and need to know what was displayed
    setState(() {
      selectedScreenIndex = index;
    },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedScreen[selectedScreenIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: selectedScreen[selectedScreenIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectpage,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: selectedScreenIndex, //tells which is the selecteditem
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Favourites'),
          )
        ],
      ),
    );
  }
}
