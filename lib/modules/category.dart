// this will have a class of catergory, it will have following properties

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;

// we use const here since we should not be able to change the data of the category once declared
  const Category({
    @required this.id,
    this.title,
    this.color = Colors.black
  });
}