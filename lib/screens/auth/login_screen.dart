import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:simple_shop_app/blocs/auth/auth_bloc.dart';
import 'package:simple_shop_app/blocs/cart/cart_bloc.dart';
import 'package:simple_shop_app/blocs/user/user_bloc.dart';

import 'package:simple_shop_app/utils/modal_loading.dart';
import 'package:simple_shop_app/utils/snack_bar.dart';

import 'package:simple_shop_app/screens/home_bottom_bar/home_bottom_bar.dart';

import 'package:simple_shop_app/widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      bloc: BlocProvider.of<AuthBloc>(context),
      listener: (context, state) {
        if (state is LoadingAuthState) {
          modalLoading(context, 'Checking...');
        } else if (state is LogOutState) {
          Navigator.pop(context);
        } else if (state is SuccessLoginState) {
          BlocProvider.of<UserBloc>(context).add(GetUserEvent());
          BlocProvider.of<CartBloc>(context).add(CartStarted());
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeBottomBar(),
            ),
          );
        } else if (state is FailureAuthState) {
          snackBar(context, state.error);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const SizedBox(height: 32),
                  const Center(
                    child: Text(
                      'Login',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 128),
                  Form(
                    key: _loginFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: _emailController,
                          hintText: 'Email',
                        ),
                        const SizedBox(height: 8),
                        Stack(
                          children: [
                            CustomTextField(
                              controller: _passwordController,
                              hintText: 'Password',
                              obscureText: _obscureText,
                            ),
                            Positioned(
                              right: 0,
                              top: 7,
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                                icon: Icon(
                                  _obscureText
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            if (_loginFormKey.currentState!.validate()) {
                              context.read<AuthBloc>().add(
                                    LoginEvent(
                                      _emailController.text.trim(),
                                      _passwordController.text.trim(),
                                    ),
                                  );
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.orangeAccent,
                            ),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Center(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
