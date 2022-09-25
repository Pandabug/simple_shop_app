part of 'product_bloc.dart';

abstract class ProductEvent {}

class LoadProductEvent extends ProductEvent {}

class AddProductEvent extends ProductEvent {
  final String name;
  final String description;
  final String price;
  final String image;

  AddProductEvent(
    this.name,
    this.description,
    this.price,
    this.image,
  );
}

class DeleteProductEvent extends ProductEvent {
  final String id;

  DeleteProductEvent(this.id);
}
