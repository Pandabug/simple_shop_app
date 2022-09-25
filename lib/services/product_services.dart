import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:simple_shop_app/models/product_model.dart';
import 'package:simple_shop_app/services/secure_storage_service.dart';

class ProductServices {
  Future<List<ProductModel>> findAll() async {
    List<ProductModel> products = [];

    http.Response response = await http.get(
      Uri.parse('http://192.168.1.107:3001/api/products'),
      headers: <String, String>{
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode == 200) {
      List body = jsonDecode(response.body);
      products = body.map((e) => ProductModel.fromMap(e)).toList();
    }

    return products;
  }

  create({
    required String name,
    required String description,
    required String price,
    required String image,
  }) async {
    try {
      var token = await SecureStorageService().readToken();

      http.Response response = await http.post(
        Uri.parse('http://192.168.1.107:3001/api/product/create'),
        headers: <String, String>{
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        },
        body: json.encode(<String, String>{
          "name": name,
          "description": description,
          "price": price,
          "image": image,
        }),
      );

      return json.decode(response.body);
    } catch (e) {
      return json.decode(e.toString());
    }
  }

  delete({
    required String id,
  }) async {
    try {
      var token = await SecureStorageService().readToken();

      http.Response response = await http.get(
        Uri.parse('http://192.168.1.107:3001/api/product/delete/$id'),
        headers: <String, String>{
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        },
      );

      return json.decode(response.body);
    } catch (e) {
      return json.decode(e.toString());
    }
  }
}
