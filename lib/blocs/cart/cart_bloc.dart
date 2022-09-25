import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:simple_shop_app/models/cart_model.dart';
import 'package:simple_shop_app/models/product_model.dart';

import 'package:simple_shop_app/services/cart_services.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartLoading()) {
    on<CartStarted>(_onStarted);
    on<CartItemAdded>(_onItemAdded);
    on<CartItemRemoved>(_onItemRemoved);
  }

  Future<void> _onStarted(CartStarted event, Emitter<CartState> emit) async {
    emit(CartLoading());

    try {
      final cartProducts = await CartServices().loadCartItems();

      emit(CartLoaded(cart: [...cartProducts]));
    } catch (e) {
      emit(CartError(error: e.toString()));
    }
  }

  void _onItemAdded(CartItemAdded event, Emitter<CartState> emit) async {
    final state = this.state;

    if (state is CartLoaded) {
      try {
        final cartApi = await CartServices()
            .addItemToCart(id: event.product.id, count: event.count);

        emit(CartLoaded(cart: [...state.cart, cartApi]));
      } catch (e) {
        emit(CartError(error: e.toString()));
      }
    }
  }

  void _onItemRemoved(CartItemRemoved event, Emitter<CartState> emit) async {
    final state = this.state;

    if (state is CartLoaded) {
      try {
        await CartServices().removeItemFromCart(id: event.cart.id);

        emit(CartLoaded(cart: [...state.cart]..remove(event.cart)));
      } catch (e) {
        emit(CartError(error: e.toString()));
      }
    }
  }
}
