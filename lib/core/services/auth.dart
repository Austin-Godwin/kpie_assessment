import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:kpie_assessment/core/constants/constants.dart';
import 'package:kpie_assessment/core/models/errors.dart';
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
    // final Map<String, dynamic> result;
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
    try {
      // For multipart request
      var request = http.MultipartRequest(
          'POST', Uri.parse('${Constants.apiUrl}/register'));

      //for adding the files(in this case, our signUpData valriable)
      request.fields.addAll(signUpData);

      //for completing the request
      http.StreamedResponse response = await request.send();
      // log('Response: ${response.stream.bytesToString()}');

      //for getting and decoding the response into json format
        final res = await http.Response.fromStream(response);
        
       final responseData = jsonDecode(res.body);
        // log('${response.stream.bytesToString()}');

      if (response.statusCode == 200) {
 
        final data = responseData['data'];
        log("Response Data: ${responseData["data"]["user_info"]}");

        final userData = UserData.fromJson(data);

        _currentUser = userData;

        log('Current User: ${_currentUser!.userInfo.email}, ${_currentUser!.userInfo.userName}, ${_currentUser!.accessToken}, ${_currentUser!.userId}');
      } else {
        
        log('''Error: 
        ${responseData["message"]},
        ${responseData["code"]},
        ${responseData["errors"]} 
        ''');
        throw AppException(message: responseData["message"]);
      }
    } on AppException {
      rethrow;
    } on SocketException{
      rethrow;
    } 
    catch (e) {
      throw AppException(message: e.toString());
    }
  }

  Future<void> login({
    required String userName,
    required String password,
  }) async {
    final Map<String, dynamic> result;
    final loginData = {
      "username": userName,
      "email": _currentUser?.userInfo.email ?? '',
      "password": password,
    };
    //
    // final http.Response response = await http.post(
    //   Uri.parse('${Constants.apiUrl}/login'),
    //   body: json.encode(
    //     <String, String>{
    //       'email': user,
    //       'password': password,
    //     },
    //   ),
    // );
    //
    // if (response.statusCode == 200) {
    //   final Map<String, dynamic> responseData = json.decode(response.body);
    //   final data = responseData['data'];
    //
    //   final userData = UserData.fromJson(data);
    //
    //   result = {
    //     'status': true,
    //     'message': 'Successful',
    //     'data': userData,
    //   };
    //   return result;
    // } else {
    //   result = {
    //     'status': false,
    //     'message': json.decode(response.body)['message'],
    //   };
    // }
    // return result;
    try {
      // For multipart request
      log('$_currentUser');
      log(_currentUser?.userInfo.email ?? 'this is null',);
      var request =
          http.MultipartRequest('POST', Uri.parse('${Constants.apiUrl}/login'));

      // For adding the files(in this case, our loginData variable)
      request.fields.addAll(loginData);

      //for completing the request
      http.StreamedResponse response = await request.send();

       //for getting and decoding the response into json format
      final res = await http.Response.fromStream(response);
      final responseData = jsonDecode(res.body);
      
      if (response.statusCode == 200) {
      
        final data = responseData['data'];

        _currentUser = UserData.fromJson(data);

        log("Current User Email: ${_currentUser!.userInfo.email}");

        // _currentUser = userData;
      }
      else {
        log('''Error: 
        ${responseData["message"]},
        ${responseData["code"]},
        ${responseData["errors"]} 
        ''');
        throw AppException(message: responseData["message"]);
      }
    } on AppException {
      rethrow;
    } on SocketException {
      rethrow;
    }
    catch (e) {
      throw AppException(message: e.toString());
    }
  }

  logOut() {
    _currentUser = null;
  }
}
