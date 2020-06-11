import 'package:flutter/material.dart';
import 'package:meal_app/category_item.dart';
import 'package:meal_app/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeals'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(5),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          //Sliver => for scrolable gride
          maxCrossAxisExtent:
              200, //max number of pixels the child can have , so we will set numbers of childern in the same row as soon as we can but every child should have max width = 200
          childAspectRatio:
              3 / 3, //The reatio between the hieght and width  for one child
          crossAxisSpacing: 10, //the spacing between childern in width
          mainAxisSpacing: 10, //the spacing between childern in hieght
        ),
        children: DUMMY_CATEGORIES
            .map((catData) => CategoryItem(catData.title, catData.color))
            .toList(),
      ),
    );
  }
}
