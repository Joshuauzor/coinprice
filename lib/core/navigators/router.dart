import 'package:flutter/material.dart';
import 'package:todo/core/navigators/routes.dart';
import 'package:todo/features/home/presentation/pages/pages.dart';
import 'package:todo/features/splash/splash.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.splashView:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const SplashView(),
      );

    case Routes.homeView:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const HomeView(),
      );

    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}

// private function to get route
// private function to get route
PageRoute _getPageRoute({var routeName, var viewToShow}) {
  return MaterialPageRoute(
    settings: RouteSettings(
      name: routeName,
    ),
    builder: (_) => viewToShow,
  );
}
