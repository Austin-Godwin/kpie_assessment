import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:kpie_assessment/base_view_model.dart';
import 'package:kpie_assessment/core/constants/navigator_routes.dart';
import 'package:kpie_assessment/core/models/errors.dart';
import 'package:kpie_assessment/core/models/failure.dart';
import 'package:kpie_assessment/core/services/auth.dart';
import 'package:kpie_assessment/core/services/navigation.dart';
import 'package:kpie_assessment/utils/Enum/view_state.dart';
import 'package:kpie_assessment/utils/app_flushbar.dart';

class LoginViewModel extends BaseViewModel {
  final _authService = Auth.instance;
  final _navigationService = Navigation.instance;
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();

  validate() {
    if (form.currentState!.validate()) {
      _onLogin();
    } else {
      return;
    }
  }

  _onLogin() async {
    try {
      setBusy(ViewState.busy);
      await _authService.login(
        userName: userName.text,
        password: password.text,
      );
      setBusy(ViewState.idle);
      navToProfile();
      log('${userName.text}, ${password.text}');
    } on AppException catch (e) {
      AppFlushBar.showError(
        message: e.message,
      );
    } on SocketException catch (e) {
       AppFlushBar.showError(
        message: e.message,
      );
    }
    finally {
      setBusy(ViewState.idle);
    }
  }

  navToSignUp() {
    _navigationService.navigateTo(NavigatorRoutes.registerView);
  }

  navToProfile() {
    _navigationService.navigateToReplace(NavigatorRoutes.profileView);
  }

  @override
  void dispose() {
    super.dispose();
    userName.dispose();
    password.dispose();
  }
}
