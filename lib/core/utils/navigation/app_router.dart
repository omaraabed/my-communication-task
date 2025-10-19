import 'package:flutter/material.dart';
import 'package:task/core/utils/navigation/router_path.dart';
import 'package:task/feature/home/presentation/view/home_view.dart';

import '../../../feature/splash/splash_view.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments as dynamic;
    switch (settings.name) {
      case RouterPath.splash:
        return _bottomToTopTransition(
          SplashView(),
          routeName: RouterPath.splash,
        );
      case RouterPath.home:
        return _bottomToTopTransition(HomeView(), routeName: RouterPath.home);
    }
    return null;
  }

  Route _bottomToTopTransition(Widget page, {required String routeName}) {
    return PageRouteBuilder(
      settings: RouteSettings(name: routeName),
      transitionDuration: const Duration(milliseconds: 500),
      reverseTransitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      // transitionsBuilder: (context, animation, secondaryAnimation, child) {
      //   const begin = Offset(0.0, 1.2);
      //   const end = Offset.zero;
      //   const curve = Curves.easeIn;
      //   var tween =
      //       Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      //   var offsetAnimation = animation.drive(tween);
      //   return SlideTransition(
      //     position: offsetAnimation,
      //     child: child,
      //   );
      // },
    );
  }
}
