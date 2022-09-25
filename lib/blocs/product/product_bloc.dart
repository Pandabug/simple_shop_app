import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import 'package:simple_shop_app/models/product_model.dart';

import 'package:simple_shop_app/services/product_services.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<LoadProductEvent>(_onLoadProductEvent);
    on<AddProductEvent>(_onAddProductEvent);
    on<DeleteProductEvent>(_onDeleteProductEvent);
  }

  void _onLoadProductEvent(
      LoadProductEvent event, Emitter<ProductState> emit) async {
    emit(LoadingProductState());

    try {
      final products = await ProductServices().findAll();

      emit(SuccessProductState(products: products));
    } catch (e) {
      emit(FailureProductState(error: e.toString()));
    }
  }

  void _onAddProductEvent(
      AddProductEvent event, Emitter<ProductState> emit) async {
    try {
      final response = await ProductServices().create(
        name: event.name,
        description: event.description,
        price: event.price,
        image: event.image,
      );

      if (response['message'] == 'Product succesfully created!') {
        emit(SuccessAddProductState());
      } else {
        emit(FailureProductState(error: response['message']));
      }
    } catch (e) {
      emit(FailureProductState(error: e.toString()));
    }
  }

  void _onDeleteProductEvent(
      DeleteProductEvent event, Emitter<ProductState> emit) async {
    try {
      await ProductServices().delete(id: event.id);

      emit(FailureProductState(error: 'Product successfully deleted!'));
    } catch (e) {
      emit(FailureProductState(error: e.toString()));
    }
  }
}
