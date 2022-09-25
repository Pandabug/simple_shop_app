import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:simple_shop_app/blocs/auth/auth_bloc.dart';

import 'package:simple_shop_app/screens/auth/auth_screen.dart';
import 'package:simple_shop_app/screens/profile/widgets/profile_settings.dart';
import 'package:simple_shop_app/screens/profile/widgets/profile_user_data.dart';

import 'package:simple_shop_app/utils/snack_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LogOutState) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const AuthScreen(),
            ),
          );
        } else if (state is FailureAuthState) {
          snackBar(context, state.error);
        }
      },
      child: Scaffold(
        backgroundColor: const Color(0xffF5F5F5),
        body: SafeArea(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 16),
            children: const [
              ProfileUserData(),
              ProfileSettings(),
            ],
          ),
        ),
      ),
    );
  }
}
