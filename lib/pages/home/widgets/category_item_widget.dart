import 'package:flutter/material.dart';
import 'package:news_app_c10_mon/core/config/constants.dart';
import 'package:news_app_c10_mon/models/category_model.dart';

class CategoryItemWidget extends StatelessWidget {
  final int index;
  final CategoryModel categoryModel;
  final Function onCategoryClick;

  const CategoryItemWidget({
    super.key,
    required this.index,
    required this.categoryModel,
    required this.onCategoryClick,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {

        // callBack function
        onCategoryClick(categoryModel);
      },
      child: Container(
        decoration: BoxDecoration(
          color: categoryModel.backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(25.0),
            topRight: const Radius.circular(25.0),
            bottomRight: index % 2 == 0
                ? const Radius.circular(0.0)
                : const Radius.circular(25.0),
            bottomLeft: index % 2 == 0
                ? const Radius.circular(25.0)
                : const Radius.circular(0.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              categoryModel.image,
              fit: BoxFit.cover,
            ),
            Text(
              categoryModel.title,
              style: Constants.theme.textTheme.bodyMedium,
            )
          ],
        ),
      ),
    );
  }
}