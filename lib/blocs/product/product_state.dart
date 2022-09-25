part of 'product_bloc.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class LoadingProductState extends ProductState {}

class SuccessProductState extends ProductState {
  SuccessProductState({required this.products});

  final List<ProductModel> products;
}

class SuccessAddProductState extends ProductState {}

class FailureProductState extends ProductState {
  FailureProductState({required this.error});

  final String error;
}
