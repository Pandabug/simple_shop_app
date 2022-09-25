import 'package:flutter/material.dart';

import 'package:simple_shop_app/models/cart_model.dart';

class PorductCartItem extends StatelessWidget {
  const PorductCartItem({
    Key? key,
    required this.onPressed,
    required this.cart,
    required this.nav,
  }) : super(key: key);

  final VoidCallback onPressed;
  final VoidCallback nav;
  final CartModel cart;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: nav,
      child: ListTile(
        tileColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        leading: SizedBox(
          width: 80,
          child: Image.network(
            loadingBuilder: (context, child, loadingProgress) =>
                (loadingProgress == null)
                    ? child
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
            errorBuilder: (BuildContext context, Object exception,
                StackTrace? stackTrace) {
              return Image.network(
                  'https://www.junglescout.com/wp-content/uploads/2021/01/product-photo-water-bottle-hero.png');
            },
            cart.product.image,
            fit: BoxFit.fill,
          ),
        ),
        title: Text(
          cart.product.name,
          maxLines: 1,
          style: const TextStyle(
            overflow: TextOverflow.ellipsis,
          ),
        ),
        subtitle: Text(
          cart.product.description,
          maxLines: 1,
          style: const TextStyle(
            overflow: TextOverflow.ellipsis,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              cart.count,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
            const SizedBox(width: 8),
            IconButton(
              onPressed: onPressed,
              icon: const Icon(
                Icons.delete_outline,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
