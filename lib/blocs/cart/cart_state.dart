part of 'cart_bloc.dart';

@immutable
abstract class CartState extends Equatable {
  const CartState();
}

class CartLoading extends CartState {
  @override
  List<Object> get props => [];
}

class CartLoaded extends CartState {
  const CartLoaded({required this.cart});

  final List<CartModel> cart;

  @override
  List<Object> get props => [cart];
}

class CartError extends CartState {
  const CartError({required this.error});

  final String error;

  @override
  List<Object> get props => [error];
}
