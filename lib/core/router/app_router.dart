import 'package:flutter/material.dart';
import 'package:kpie_assessment/core/constants/navigator_routes.dart';
import 'package:kpie_assessment/views/authentication/login/login.dart';
import 'package:kpie_assessment/views/authentication/sign_up/sign_up.dart';
import 'package:kpie_assessment/views/onboarding/onboarding.dart';
import 'package:kpie_assessment/views/profile/profile.dart';

class AppRouter {
  static PageRoute _getPageRoute({
    required RouteSettings settings,
    required Widget viewToShow,
    //ignore: unused_element
    Object? arguments,
  }) {
    return MaterialPageRoute(
      builder: (context) => viewToShow,
      settings: settings,
    );
  }

  static Route<dynamic> onGenerateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case NavigatorRoutes.loginView:
        return _getPageRoute(settings: routeSettings, viewToShow: const Login());

      case NavigatorRoutes.onboardingView:
        return _getPageRoute(settings: routeSettings, viewToShow: const Onboarding());

      case NavigatorRoutes.registerView:
        return _getPageRoute(settings: routeSettings, viewToShow: const SignUP());

      case NavigatorRoutes.profileView:
        return _getPageRoute(settings: routeSettings, viewToShow: const Profile());
      default:
        return _getPageRoute(settings: routeSettings, viewToShow: const Center());
    }
  }
}
