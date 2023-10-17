import 'package:flutter/material.dart';
import 'package:mynewsapp/models/category_model.dart';

import 'category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({
    super.key,
  });

  final List<CategoryModel> categories = const [
    CategoryModel(image: 'assets/business.png', categoryName: 'business'),
    CategoryModel(image: 'assets/Tech.png', categoryName: 'technology'),
    CategoryModel(image: 'assets/Sport.png', categoryName: 'sports'),
    CategoryModel(image: 'assets/health.png', categoryName: 'health'),
    CategoryModel(image: 'assets/Science.png', categoryName: 'science'),
    CategoryModel(
        image: 'assets/entertainment.png', categoryName: 'entertainment'),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CategoryCard(
              category: categories[index],
            );
          }),
    );
  }
}
