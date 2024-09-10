import 'package:flutter/material.dart';
import 'package:news_app_c10_mon/core/config/constants.dart';
import 'package:news_app_c10_mon/models/source_model.dart';

class TabItem extends StatelessWidget {
  final SourceModel sourceModel;
  bool isSelected;

  TabItem({
    super.key,
    required this.sourceModel,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      decoration: BoxDecoration(
        color: isSelected ? Constants.theme.primaryColor : Colors.transparent,
        borderRadius: BorderRadius.circular(25.0),
        border: Border.all(
          color: Constants.theme.primaryColor,
          width: 2,
        ),
      ),
      child: Text(
        sourceModel.name,
        style: Constants.theme.textTheme.bodyMedium?.copyWith(
          color: isSelected ? Colors.white : Constants.theme.primaryColor,
        ),
      ),
    );
  }
}