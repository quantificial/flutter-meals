import 'package:flutter/material.dart';
import 'package:meals_app/category_item.dart';

import 'dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals'),
        //titleTextStyle: Theme.of(context).textTheme.titleMedium,
      ),
      body: GridView(
        padding: const EdgeInsets.all(25),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        children: [
          ...DUMMY_CATEGORIES
              .map((c) => CategoryItem(
                    title: c.title,
                    color: c.color,
                    id: c.id,
                  ))
              .toList()
        ],
      ),
    );
  }
}
