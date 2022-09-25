import 'package:flutter/material.dart';
import 'package:simple_shop_app/screens/home/widgets/header_category.dart';

import 'package:simple_shop_app/screens/home/widgets/header_page_view.dart';
import 'package:simple_shop_app/screens/home/widgets/products_list.dart';
import 'package:simple_shop_app/screens/home/widgets/see_more_field.dart';
import 'package:simple_shop_app/widgets/app_bar_cart_icon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 8),
          child: AppBartCartIcon(),
        ),
        title: const Text(
          'Home Screen',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 28,
            ),
          ),
        ],
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: const Color(0xffF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              HeaderPageView(),
              SeeMoreField(title: 'Categories'),
              SizedBox(height: 8),
              HeaderCategory(),
              SizedBox(height: 16),
              SeeMoreField(title: 'Popular Products'),
              SizedBox(height: 8),
              ProductsList(),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
