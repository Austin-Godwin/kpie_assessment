import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:kpie_assessment/core/constants/constants.dart';
import 'package:kpie_assessment/core/models/failure.dart';
import 'package:kpie_assessment/core/models/user_data.dart';

import '../models/api_exception.dart';

class Auth {
  Auth._();
  static final Auth _instance = Auth._();
  static Auth get instance => _instance;

  UserData? _currentUser;
  UserData? get currentUser => _currentUser;

  Future<void> signUp({
    required String userName,
    required String email,
    required String password,
  }) async {
    final Map<String, dynamic> result;
    final signUpData = {
      "username": userName,
      "email": email,
      "password": password,
    };
    // try {
    //   final http.Response response = await http.post(
    //     Uri.parse('${Constants.apiUrl}/register'),
    //     body: jsonEncode(signUpData),
    //     headers: {
    //       "Content-Type" : "multipart/form-data; charset=utf-8",
    //     }
    //   );
    //   log('Body Test : ${signUpData.toString()}');
    //   final responseData = jsonDecode(response.body);
    //   log('Auth Service: ${responseData.toString()}');
    //   if (response.statusCode == 200) {
    //     final data = responseData["data"];
    //
    //     log(responseData["data"]["user"]);
    //
    //     final userData = UserData.fromJson(data);
    //
    //     _currentUser = userData;
    //
    //     result = {
    //       "status": responseData["success_type"],
    //       "message": responseData["message"],
    //       "data": userData
    //     };
    //   } else {
    //     result = {
    //       "status": false,
    //       "message": "Registration failed",
    //       "data": responseData,
    //     };
    //   }
    // } on Error {
    //   rethrow;
    // }
    //
    // return result;

    // var request = http.MultipartRequest('POST', Uri.parse('${Constants.apiUrl}/register'));
    // request.fields[signUpData];
    // var response = await request.send();
    //
    // String responseData = await response.stream.transform(utf8.decoder).join();
    // log(responseData);
    try {
      // For multipart request
      var request = http.MultipartRequest(
          'POST', Uri.parse('${Constants.apiUrl}/register'));

      //for adding the files(in this case, our parameter)
      request.fields.addAll(signUpData);

      //for completing the request
      http.StreamedResponse response = await request.send();
      log('Response: ${response.stream.toString()}');



      // log('Auth Service: ${responseData.toString()}');

      if (response.statusCode == 200) {
        //for getting and decoding the response into json format
        final res = await http.Response.fromStream(response);
        final responseData = jsonDecode(res.body);
        // log(await response.stream.bytesToString());

        final data = responseData['data'];
        log(responseData["data"]["user"]);

        final userData = UserData.fromJson(data);

        _currentUser = userData;
      }
    } on Failure catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>> login({
    required String user,
    required String password,
  }) async {
    final Map<String, dynamic> result;

    final http.Response response = await http.post(
      Uri.parse('${Constants.apiUrl}/login'),
      body: json.encode(
        <String, String>{
          'email': user,
          'password': password,
        },
      ),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final data = responseData['data'];

      final userData = UserData.fromJson(data);

      result = {
        'status': true,
        'message': 'Successful',
        'data': userData,
      };
      return result;
    } else {
      result = {
        'status': false,
        'message': json.decode(response.body)['message'],
      };
    }
    return result;
  }
}
