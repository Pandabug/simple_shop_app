import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:simple_shop_app/blocs/auth/auth_bloc.dart';
import 'package:simple_shop_app/blocs/cart/cart_bloc.dart';
import 'package:simple_shop_app/blocs/user/user_bloc.dart';
import 'package:simple_shop_app/blocs/product/product_bloc.dart';

import 'package:simple_shop_app/screens/auth/auth_screen.dart';
import 'package:simple_shop_app/screens/home_bottom_bar/home_bottom_bar.dart';

void main() {
  // Bloc.observer = SimpleBlocObserver();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()..add(CheckLoginEvent())),
        BlocProvider(create: (context) => UserBloc()),
        BlocProvider(create: (context) => ProductBloc()),
        BlocProvider(create: (context) => CartBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo Demo',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          appBarTheme: const AppBarTheme(
            color: Colors.orange,
            foregroundColor: Colors.white,
          ),
        ),
        home: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is SuccessLoginState) {
              BlocProvider.of<UserBloc>(context).add(GetUserEvent());
              BlocProvider.of<CartBloc>(context).add(CartStarted());
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeBottomBar(),
                ),
              );
            } else if (state is LogOutState) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const AuthScreen(),
                ),
              );
            }
          },
          child: const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}
