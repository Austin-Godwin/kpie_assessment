import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kpie_assessment/core/constants/constants.dart';
import 'package:kpie_assessment/core/models/user_info.dart';

class Auth {
  static final Auth _instance = Auth();
  static Auth get instance => _instance;

  Future<UserInfo> signUp({
    required String fullName,
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('${Constants.apiUrl}/register'),
      body: jsonEncode(
        <String, String>{
          'fullName' : fullName,
          'email' : email,
          'password' : password,
        },
      ),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final token = data['token'];

      return token;
    } else {
      throw Exception('Failed to sign up user');
    }
  }

  
}
