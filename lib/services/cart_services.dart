import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:simple_shop_app/models/cart_model.dart';
import 'package:simple_shop_app/services/secure_storage_service.dart';

class CartServices {
  Future<List<CartModel>> loadCartItems() async {
    final token = await SecureStorageService().readToken();
    List<CartModel> cartProducts = [];

    http.Response response = await http.get(
      Uri.parse('http://192.168.1.107:3001/api/cart'),
      headers: <String, String>{
        "Content-Type": "application/json",
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode == 200) {
      List body = json.decode(response.body);
      cartProducts = body.map((e) => CartModel.fromMap(e)).toList();
    }

    return cartProducts;
  }

  addItemToCart({required String id, required String count}) async {
    try {
      var token = await SecureStorageService().readToken();

      http.Response response = await http.post(
        Uri.parse('http://192.168.1.107:3001/api/cart/create/$id'),
        headers: <String, String>{
          "Content-Type": "application/json",
          'Authorization': 'Bearer $token',
        },
        body: json.encode(<String, String>{
          "count": count,
        }),
      );

      return CartModel.fromMap(json.decode(response.body)['cart']);
    } catch (e) {
      return json.decode(e.toString());
    }
  }

  removeItemFromCart({required id}) async {
    try {
      var token = await SecureStorageService().readToken();

      http.Response response = await http.get(
        Uri.parse('http://192.168.1.107:3001/api/cart/delete/$id'),
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
