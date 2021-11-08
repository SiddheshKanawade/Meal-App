import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

class FilterScreen extends StatelessWidget {
  static const routeName = '/filter';
  // const FilterScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Filter'),),
      drawer: MainDrawer(),
      body: Center(child: Text('Filters'),),
    );
  }
}