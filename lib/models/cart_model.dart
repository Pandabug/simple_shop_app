import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:simple_shop_app/models/product_model.dart';

class CartModel extends Equatable {
  const CartModel({
    required this.id,
    required this.user,
    required this.product,
    required this.count,
    required this.startDate,
  });

  final String id;
  final String user;
  final ProductModel product;
  final String count;
  final String startDate;

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "user": user,
      "product": product,
      "count": count,
      "startDate": startDate,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['_id'] ?? '',
      user: map['userId'] ?? '',
      product: ProductModel.fromMap(map['productId']),
      count: map['count'] ?? '',
      startDate: map['startDate'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());
  factory CartModel.fromJson(String source) =>
      CartModel.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        id,
        user,
        product,
        count,
        startDate,
      ];
}
