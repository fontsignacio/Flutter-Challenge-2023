import '../../model/user_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginViewModel {
  final String apiUrl = 'https://dummyjson.com/auth/login';

  Future<UserModel?> login(String username, String password) async {
    final response = await http.post(Uri.parse(apiUrl),
        body: {'username': username, 'password': password});

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return UserModel(
        username: jsonResponse['username'],
        password: jsonResponse['password'],
      );
    } else if (response.statusCode == 401) {
      throw Exception('Invalid username or password');
    } else {
      throw Exception('Failed to login');
    }
  }
}