import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_flushbar/flutter_flushbar.dart';
import 'package:kpie_assessment/core/services/navigation.dart';
import 'package:kpie_assessment/utils/color.dart';

class AppFlushBar {
  static final Navigation _navigation = Navigation.instance;

  static void showError({
  String? title,
    required String message,
    int duration = 3,
  }) {
    Flushbar(
      forwardAnimationCurve: Curves.decelerate,
      reverseAnimationCurve: Curves.easeOut,
      title: title ?? "An Error Occurred",
      borderRadius: BorderRadius.circular(10.0),
      margin: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 30),
      flushbarPosition: FlushbarPosition.TOP,
      duration: Duration(seconds: duration),
      isDismissible: true,
      backgroundColor: AppColors.kWarning,
      message: message,
    ).show(_navigation.navigatorKey.currentState!.context);
  }

  static void showSuccess({required String title, required message, int duration = 3,}) {
    Flushbar(
      forwardAnimationCurve: Curves.decelerate,
      reverseAnimationCurve: Curves.easeOut,
      title: title ?? "Success!!!!",
      flushbarPosition: FlushbarPosition.TOP,
      duration: Duration(seconds: duration),
      isDismissible: true,
      backgroundColor: AppColors.kActive,
      message: message,
    ).show(_navigation.navigatorKey.currentState!.context);
  }
}
