import 'package:kpie_assessment/base_view_model.dart';
import 'package:kpie_assessment/core/constants/navigator_routes.dart';
import 'package:kpie_assessment/core/services/auth.dart';
import 'package:kpie_assessment/core/services/navigation.dart';

class ProfileViewModel extends BaseViewModel {
  final userInfo = Auth.instance.currentUser?.userInfo;
  final _authService = Auth.instance;
  final _navigationService = Navigation.instance;
  
  logOut() {
    _authService.logOut();
    _navigationService.navigateToNewRoute(NavigatorRoutes.loginView);
  }
}