import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kpie_assessment/base_view_model.dart';
import 'package:kpie_assessment/core/constants/navigator_routes.dart';
import 'package:kpie_assessment/core/models/failure.dart';
import 'package:kpie_assessment/core/services/auth.dart';
import 'package:kpie_assessment/core/services/navigation.dart';
import 'package:kpie_assessment/utils/Enum/view_state.dart';
import 'package:kpie_assessment/utils/app_flushbar.dart';

class SignUpViewModel extends BaseViewModel {
  final _authService = Auth.instance;
  final _navigationService = Navigation.instance;
  bool isChecked = false;
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  //to toggle checkbox
  changeIsChecked(bool? value) {
    isChecked = value ?? isChecked;
    setBusy(ViewState.idle);
  }

  validate() {
    if (form.currentState!.validate()) {
      if (isChecked) {
        signUp();
      } else {
        isChecked
            ? null
            : AppFlushBar.showError(
                title: "Incomplete registration",
                message:
                    "You have to accept the terms and conditions before you can proceed!",
              );
        return null;
      }
    }
  }

  signUp() async {
    try {
      setBusy(ViewState.busy);
      await _authService.signUp(
        userName: fullName.text,
        email: email.text,
        password: password.text,
      );
      setBusy(ViewState.idle);
      navToProfile();
      log('${fullName.text}, ${email.text}, ${password.text}');
    } on Failure catch (e) {
      AppFlushBar.showError(
        title: e.title,
        message: e.message,
      );
      // log('View Model: ${e.message}');
    }
  }

  navToProfile() {
    _navigationService.navigateToNewRoute(NavigatorRoutes.profileView);
}

  @override
  void dispose() {
    super.dispose();
    fullName.dispose();
    email.dispose();
    password.dispose();
  }
}
