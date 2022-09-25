import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthServices {
  login({
    required String email,
    required String password,
  }) async {
    try {
      http.Response response = await http.post(
        Uri.parse('http://192.168.1.107:3001/api/auth/login'),
        headers: <String, String>{
          "Content-Type": "application/json",
        },
        body: json.encode(<String, String>{
          "email": email,
          "password": password,
        }),
      );

      return json.decode(response.body);
    } catch (e) {
      return json.decode(e.toString());
    }
  }

  signup({
    required String email,
    required String password,
    required String image,
  }) async {
    try {
      http.Response response = await http.post(
        Uri.parse('http://192.168.1.107:3001/api/auth/signup'),
        headers: <String, String>{
          "Content-Type": "application/json",
        },
        body: json.encode(<String, String>{
          "email": email,
          "password": password,
          "image": image,
        }),
      );

      return json.decode(response.body);
    } catch (e) {
      return json.decode(e.toString());
    }
  }

  profile() async {
    try {
      http.Response response = await http.get(
        Uri.parse('http://192.168.1.107:3001/api/profile'),
        headers: <String, String>{
          "Content-Type": "application/json",
        },
      );

      return json.decode(response.body);
    } catch (e) {
      return json.decode(e.toString());
    }
  }
}
