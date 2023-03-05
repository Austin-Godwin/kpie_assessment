class UserInfo {
  final String fullName;
  final String email;
  final String password;

  UserInfo({
    required this.fullName,
    required this.email,
    required this.password,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      fullName: json['fullName'],
      email: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fullName' : fullName,
      'email' : email,
      'password' : password,
    };
  }
}
