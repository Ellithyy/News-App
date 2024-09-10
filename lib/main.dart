import 'package:flutter/material.dart';
import 'package:news_app_c10_mon/core/config/application_theme_manager.dart';
import 'package:news_app_c10_mon/core/config/pages_route_name.dart';
import 'package:news_app_c10_mon/core/config/routes.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Application',
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ApplicationThemeManager.applicationThemeData,
      initialRoute: PagesRouteName.initial,
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}