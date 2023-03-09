import 'package:flutter/material.dart';
import 'package:kpie_assessment/core/models/user_info.dart';

class UserData {
  final UserInfo userInfo;
  final String accessToken;

  UserData({

    required this.userInfo,
    required this.accessToken,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(

      userInfo: UserInfo.fromJson(json['userInfo']),
      accessToken: json['accessToken'],
    );
  }

  Map<String, dynamic> userDataToJson() {
    return {
      'userInfo' : userInfo.userInfoToJson(),
      'accessToken' : accessToken,
    };
  }
}
