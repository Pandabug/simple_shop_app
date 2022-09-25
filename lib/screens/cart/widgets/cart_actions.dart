import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_shop_app/blocs/cart/cart_bloc.dart';

class CartActions extends StatelessWidget {
  const CartActions({
    Key? key,
  }) : super(key: key);

  fullPrice(List cart) {
    double totPrice = 0;

    for (var x in cart) {
      totPrice += (double.parse(x.product.price) * int.parse(x.count));
    }

    return totPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(24),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 2,
            blurRadius: 4,
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Total:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Learn more...',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              BlocBuilder<CartBloc, CartState>(
                bloc: BlocProvider.of<CartBloc>(context),
                builder: (context, state) {
                  if (state is CartLoaded) {
                    return Text(
                      '\$${fullPrice(state.cart).toString()}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
          const SizedBox(height: 16),
          InkWell(
            onTap: () {},
            child: Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Order',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(
                    Icons.arrow_forward_outlined,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
