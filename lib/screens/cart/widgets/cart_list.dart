import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:simple_shop_app/blocs/cart/cart_bloc.dart';

import 'package:simple_shop_app/screens/cart/widgets/product_cart_item.dart';
import 'package:simple_shop_app/screens/product%20details/product_details.dart';

class CartList extends StatelessWidget {
  const CartList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      bloc: BlocProvider.of<CartBloc>(context),
      builder: (context, state) {
        if (state is CartLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CartLoaded) {
          if (state.cart.isNotEmpty) {
            return ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              separatorBuilder: (context, index) => const SizedBox(
                height: 8,
              ),
              itemCount: state.cart.length,
              itemBuilder: (context, index) {
                final cartProduct = state.cart[index];

                return PorductCartItem(
                  cart: cartProduct,
                  onPressed: () {
                    BlocProvider.of<CartBloc>(context).add(
                      CartItemRemoved(cart: cartProduct),
                    );
                  },
                  nav: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PorductDetailsScreen(
                          product: cartProduct.product,
                          showCart: false,
                        ),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return const Center(
              child: Text('Your cart is empty'),
            );
          }
        } else {
          return const Center(
            child: Text('Somthing wrong!'),
          );
        }
      },
    );
  }
}
