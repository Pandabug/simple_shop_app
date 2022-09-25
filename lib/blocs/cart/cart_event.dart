part of 'cart_bloc.dart';

@immutable
abstract class CartEvent extends Equatable {
  const CartEvent();
}

class CartStarted extends CartEvent {
  @override
  List<Object> get props => [];
}

class CartItemAdded extends CartEvent {
  const CartItemAdded({
    required this.product,
    required this.count,
  });

  final ProductModel product;
  final String count;

  @override
  List<Object> get props => [product, count];
}

class CartItemRemoved extends CartEvent {
  const CartItemRemoved({required this.cart});

  final CartModel cart;

  @override
  List<Object> get props => [cart];
}
