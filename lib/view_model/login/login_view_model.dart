import 'dart:convert';
import 'package:flutter_challenge/view_model/constants/constants.dart';
import 'package:http/http.dart' as http;
import '../../model/user_model.dart';

class HttpLogin {
  static Future<UserModel> login(String username, String password) async {
    try {
      var url = Uri.https(baseUrl, '/auth/login');
      var headers = {'Content-Type': 'application/json'};
      var body = jsonEncode({
        'username': username,
        'password': password
      });

      var response = await http.post(
        url,
        headers: headers,
        body: body,
      );


      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return UserModel.fromJson(data);
      } else {
        throw Exception("Failed to fetch login");
      }
    } catch (error) {
      throw Exception("Failed to login, error message: $error");
    }
  }
}