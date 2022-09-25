import 'dart:convert';

class UserModel {
  const UserModel({
    required this.id,
    required this.email,
    required this.image,
  });

  final String id;
  final String email;
  final String image;

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "email": email,
      "image": image,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['_id'] ?? '',
      email: map['email'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());
  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
