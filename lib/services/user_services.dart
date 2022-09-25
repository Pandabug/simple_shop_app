import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:simple_shop_app/models/user_model.dart';

import 'package:simple_shop_app/services/secure_storage_service.dart';

class UserServices {
  Future<UserModel> getUserById() async {
    final token = await SecureStorageService().readToken();

    http.Response response = await http.get(
      Uri.parse('http://192.168.1.107:3001/api/profile'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    return UserModel.fromMap(json.decode(response.body));
  }
}
