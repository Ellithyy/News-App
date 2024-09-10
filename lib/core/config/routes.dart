import 'package:flutter/material.dart';
import 'package:news_app_c10_mon/core/config/pages_route_name.dart';
import 'package:news_app_c10_mon/pages/home/pages/article_details_view.dart';
import 'package:news_app_c10_mon/pages/home/pages/home_view.dart';
import 'package:news_app_c10_mon/pages/settings/pages/settings_view.dart';
import 'package:news_app_c10_mon/pages/splash/pages/splash_view.dart';

class Routes {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PagesRouteName.initial:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );

      case PagesRouteName.homeView:
        return MaterialPageRoute(
          builder: (context) => const HomeView(),
          settings: settings,
        );

      case PagesRouteName.settingsView:
        return MaterialPageRoute(
          builder: (context) => const SettingsView(),
          settings: settings,
        );

      case PagesRouteName.articleDetailsView:
        return MaterialPageRoute(
          builder: (context) => const ArticleDetailsView(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const SplashView(),
          settings: settings,
        );
    }
  }
}