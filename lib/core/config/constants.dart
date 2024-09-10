import 'package:flutter/material.dart';
import 'package:news_app_c10_mon/main.dart';


class Constants {

  static var theme = Theme.of(navigatorKey.currentState!.context);
  static var mediaQuery = MediaQuery.of(navigatorKey.currentState!.context);

  static const String apiKey = "df68019e7b334833a902ead8b9c1994a";
  static const String baseURL = "newsapi.org";

}