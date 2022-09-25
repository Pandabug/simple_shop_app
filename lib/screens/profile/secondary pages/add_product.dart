import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:simple_shop_app/blocs/product/product_bloc.dart';

import 'package:simple_shop_app/utils/modal_loading.dart';
import 'package:simple_shop_app/utils/snack_bar.dart';

import 'package:simple_shop_app/widgets/custom_textfield.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _newProductFormKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final productBloc = BlocProvider.of<ProductBloc>(context);

    return BlocListener<ProductBloc, ProductState>(
      listener: (context, state) {
        if (state is LoadingProductState) {
          modalLoading(context, 'Checking...');
        } else if (state is SuccessAddProductState) {
          snackBar(context, 'Product successfully added');
        } else if (state is FailureProductState) {
          snackBar(context, state.error);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Product'),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Form(
                key: _newProductFormKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: _nameController,
                      hintText: 'Name',
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
                      controller: _descriptionController,
                      hintText: 'Description',
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
                      controller: _priceController,
                      hintText: 'Price',
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
                      controller: _imageController,
                      hintText: 'Image (jpg, jpeg, png, webp)',
                    ),
                    const SizedBox(height: 32),
                    GestureDetector(
                      onTap: () {
                        if (_newProductFormKey.currentState!.validate()) {
                          productBloc.add(
                            AddProductEvent(
                                _nameController.text,
                                _descriptionController.text,
                                _priceController.text,
                                _imageController.text),
                          );

                          setState(() {
                            _nameController.clear();
                            _descriptionController.clear();
                            _priceController.clear();
                            _imageController.clear();
                          });
                        }
                      },
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.orange,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: Center(
                            child: Text(
                              'Add Product',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
