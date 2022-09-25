import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:simple_shop_app/blocs/product/product_bloc.dart';
import 'package:simple_shop_app/models/product_model.dart';
import 'package:simple_shop_app/screens/product%20details/product_details.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      bloc: BlocProvider.of<ProductBloc>(context)..add(LoadProductEvent()),
      builder: (context, state) {
        if (state is LoadingProductState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SuccessProductState) {
          List<ProductModel> productList = state.products;

          if (productList.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: productList.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PorductDetailsScreen(product: productList[index]),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: productList[index].image != ''
                              ? Hero(
                                  tag: productList[index].id.toString(),
                                  child: Image.network(
                                    productList[index].image,
                                    height: 120,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : Container(
                                  height: 120,
                                  color: Colors.grey,
                                  alignment: Alignment.center,
                                  child: const Text(
                                    'Whoops!',
                                    style: TextStyle(fontSize: 30),
                                  ),
                                ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          productList[index].name,
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 17,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          '\$ ${productList[index].price}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            const Center(
              child: Text('There are no products'),
            );
          }
        } else if (state is FailureProductState) {
          return Text(state.error);
        }
        return const SizedBox();
      },
    );
  }
}
