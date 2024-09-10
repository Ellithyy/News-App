import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app_c10_mon/core/widgets/custom_background_widget.dart';
import 'package:news_app_c10_mon/models/article_model.dart';
import 'package:news_app_c10_mon/pages/home/widgets/custome_drawer.dart';

import '../../../core/config/constants.dart';

class ArticleDetailsView extends StatelessWidget {
  const ArticleDetailsView({super.key});

  @override
  Widget build(BuildContext context) {

    var args = ModalRoute.of(context)!.settings.arguments as ArticleModel;

    return CustomBackgroundWidget(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            SizedBox(width: 50,),
            Icon(Icons.arrow_back),
            Spacer(),
          ],
          // title: Text(
          //   "News Detail"
          // ),
        ),
        drawer: CustomDrawer(onDrawerClicked: () {}),
        body: Column(
          children: [
            Container(
              width: Constants.mediaQuery.size.width,
              height: 90,

            ),
            Container(
              height: 230,
              width: Constants.mediaQuery.size.width,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: CachedNetworkImage(
                imageUrl: args.urlToImage,
                imageBuilder: (context, imageProvider) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                    ),
                  );
                },
                placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(
                  Icons.error,
                  color: Colors.grey,
                  size: 45,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}