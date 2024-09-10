import 'package:flutter/material.dart';
import 'package:news_app_c10_mon/core/config/pages_route_name.dart';
import 'package:news_app_c10_mon/core/widgets/custom_background_widget.dart';
import 'package:news_app_c10_mon/main.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
          () => navigatorKey.currentState!
          .pushReplacementNamed(PagesRouteName.homeView),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomBackgroundWidget(
      child: Image.asset("assets/images/logo.png"),
    );
  }
}