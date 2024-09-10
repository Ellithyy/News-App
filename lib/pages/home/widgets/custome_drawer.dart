import 'package:flutter/material.dart';
import 'package:news_app_c10_mon/core/config/constants.dart';

class CustomDrawer extends StatelessWidget {
  Function onDrawerClicked;

  CustomDrawer({
    super.key,
    required this.onDrawerClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Constants.mediaQuery.size.width * 0.8,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: Constants.mediaQuery.size.width * 0.8,
            color: Constants.theme.primaryColor,
            height: 170,
            child: Text(
              "News App!",
              style: Constants.theme.textTheme.titleLarge,
            ),
          ),
          const SizedBox(height: 25),
          InkWell(
            onTap: () {
              onDrawerClicked();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.list,
                    size: 40,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    "Categories",
                    style: Constants.theme.textTheme.titleLarge
                        ?.copyWith(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.settings,
                    size: 40,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    "Settings",
                    style: Constants.theme.textTheme.titleLarge
                        ?.copyWith(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}