class UserInfo {
  final int userId;
  final String fullName;
  final String email;

  UserInfo({
    required this.userId,
    required this.fullName,
    required this.email,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      userId: json['userId'],
      fullName: json['fullName'],
      email: json['email'],
    );
  }

  Map<String, dynamic> userInfoToJson() {
    return {
      'userId' : userId,
      'fullName' : fullName,
      'email' : email,
    };
  }
}
