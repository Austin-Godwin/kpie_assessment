import 'package:flutter/material.dart';

class Navigation {
  Navigation._();
  static final Navigation _instance = Navigation._();
  static Navigation get instance => _instance;

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(
    String routeName, {
    Object? argument,
  }) async {
    return await navigatorKey.currentState!.pushNamed(
      routeName,
      arguments: argument,
    );
  }

  Future<dynamic> navigateToReplace(
    String routeName, {
    Object? argument,
  }) async {
    return await navigatorKey.currentState!.pushReplacementNamed(
      routeName,
      arguments: argument,
    );
  }

  Future<dynamic> navigateToNewRoute(
    String newRouteName, {
    Object? argument,
  }) async {
    return await navigatorKey.currentState!.pushNamedAndRemoveUntil(
      newRouteName,
      (route) => false,
      arguments: argument,
    );
  }

  Future<dynamic> navigateAndRemoveUntil({
    required String newRouteName,
    required String routeToLeave,
    Object? argument,
  }) async {
    return await navigatorKey.currentState!.pushNamedAndRemoveUntil(
      newRouteName,
      (route) {
        return route.settings.name == routeToLeave;
      },
      arguments: argument,
    );
  }

  // Future<dynamic> logOut(
  //   String routeName, {
  //   Object? argument,
  // }) async {
  //   return await navigatorKey.currentState!.pushReplacementNamed(
  //     routeName,
  //     arguments: argument,
  //   );
  // }
  goBack<T extends Object?>([T? result]) {
    Navigator.of(navigatorKey.currentState!.context).pop(result);
  }
}
