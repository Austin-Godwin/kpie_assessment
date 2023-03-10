import 'package:kpie_assessment/core/models/user_info.dart';

class UserData {
  final int userId;
  final UserInfo userInfo;
  final String accessToken;

  UserData({
required this.userId,
    required this.userInfo,
    required this.accessToken,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
userId: json['user_id'],
      userInfo: UserInfo.fromJson(json['user_info']),
      accessToken: json['access_token'],
    );
  }

  Map<String, dynamic> userDataToJson() {
    return {
      'user_id' : userId,
      'user_info' : userInfo.userInfoToJson(),
      'access_token' : accessToken,
    };
  }
}





