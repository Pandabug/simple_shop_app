import 'dart:convert';
import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  const ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });

  final String id;
  final String name;
  final String description;
  final String price;
  final String image;

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "price": price,
      "image": image,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      price: map['price'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());
  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        price,
        image,
      ];
}
