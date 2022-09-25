import 'package:flutter/material.dart';

import 'package:simple_shop_app/screens/cart/widgets/cart_actions.dart';
import 'package:simple_shop_app/screens/cart/widgets/cart_list.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
      ),
      backgroundColor: const Color.fromARGB(255, 233, 232, 232),
      body: SafeArea(
        child: Column(
          children: const [
            Expanded(
              child: CartList(),
            ),
            CartActions(),
          ],
        ),
      ),
    );
  }
}
