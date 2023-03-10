class UserInfo {
  
  final String userName;
  final String email;
  final String profilePics;

  UserInfo({
    
    required this.userName,
    required this.email,
    required this.profilePics
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      
      userName: json['username'],
      email: json['email'],
      profilePics: json['avater']
    );
  }

  Map<String, dynamic> userInfoToJson() {
    return {
      
      'username' : userName,
      'email' : email,
      'avatar' : profilePics,
    };
  }
}
