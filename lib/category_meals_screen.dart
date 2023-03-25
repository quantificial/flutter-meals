import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  // const CategoryMealsScreen(
  //     {super.key, required this.categoryId, required this.categoryTitle});

  // final String categoryId;
  // final String categoryTitle;

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final categoryId = routeArgs['id'];
    final categoryTitle = "${routeArgs['title']}";

    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle!)),
      body: Center(
        child: Text('Recips for the category'),
      ),
    );
  }
}
