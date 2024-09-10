import 'package:flutter/material.dart';
import 'package:news_app_c10_mon/core/config/constants.dart';
import 'package:news_app_c10_mon/core/widgets/custom_background_widget.dart';
import 'package:news_app_c10_mon/models/category_model.dart';
import 'package:news_app_c10_mon/models/source_model.dart';
import 'package:news_app_c10_mon/network/api_manager.dart';
import 'package:news_app_c10_mon/pages/home/widgets/news_list_view.dart';
import 'package:news_app_c10_mon/pages/home/widgets/tab_item.dart';

class CategoryView extends StatefulWidget {
  final CategoryModel categoryModel;

  const CategoryView({
    super.key,
    required this.categoryModel,
  });

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      child: FutureBuilder(
        future: ApiManager.fetchDataSource(widget.categoryModel.id),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Something went wrong",
                style: Constants.theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.black,
                ),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          List<SourceModel> sourcesList = snapshot.data ?? [];

          return NewsListView(sourcesList: sourcesList);
        },
      ),
    );
  }
}