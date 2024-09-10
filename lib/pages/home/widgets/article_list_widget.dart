import 'package:flutter/material.dart';
import 'package:news_app_c10_mon/core/config/constants.dart';
import 'package:news_app_c10_mon/models/article_model.dart';
import 'package:news_app_c10_mon/network/api_manager.dart';
import 'package:news_app_c10_mon/pages/home/widgets/article_item_widget.dart';

class ArticleListWidget extends StatelessWidget {
  final String sourceId;

  const ArticleListWidget({
    super.key,
    required this.sourceId,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.fetchDataArticles(sourceId),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              "Error fetching articles",
              style: Constants.theme.textTheme.bodyLarge?.copyWith(
                color: Colors.black,
              ),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(
              color: Constants.theme.primaryColor,
            ),
          );
        }

        List<ArticleModel> articlesList = snapshot.data ?? [];

        return Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) =>
                ArticleItemWidget(articleModel: articlesList[index]),
            itemCount: articlesList.length,
          ),
        );
      },
    );
  }
}