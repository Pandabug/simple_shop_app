import 'package:flutter/material.dart';

import 'package:simple_shop_app/models/product_model.dart';

import 'package:simple_shop_app/widgets/app_bar_cart_icon.dart';
import 'package:simple_shop_app/screens/product%20details/widgets/product_actions.dart';
import 'package:simple_shop_app/screens/product%20details/widgets/product_image.dart';

class PorductDetailsScreen extends StatelessWidget {
  const PorductDetailsScreen({
    super.key,
    required this.product,
    this.showCart = true,
  });

  final ProductModel product;
  final bool showCart;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              right: 16,
            ),
            child: showCart ? const AppBartCartIcon() : const SizedBox(),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Color.fromARGB(255, 236, 236, 236),
                  Color.fromARGB(255, 236, 236, 236),
                ],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductImage(product: product),
                const SizedBox(height: 16),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Description',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Text(product.description),
                ),
                const SizedBox(height: 16),
                ProductActions(product: product),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
