import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:simple_shop_app/blocs/cart/cart_bloc.dart';

import 'package:simple_shop_app/models/product_model.dart';

class AddToCartBtn extends StatelessWidget {
  const AddToCartBtn({
    Key? key,
    required this.count,
    required this.product,
  }) : super(key: key);

  final ProductModel product;
  final int count;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      bloc: BlocProvider.of<CartBloc>(context),
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  BlocProvider.of<CartBloc>(context).add(
                    CartItemAdded(
                      product: product,
                      count: count.toString(),
                    ),
                  );
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      width: 1,
                      color: Colors.orange,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Add To Card',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
