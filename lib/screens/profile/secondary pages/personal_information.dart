import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_shop_app/blocs/user/user_bloc.dart';

class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Information'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<UserBloc, UserState>(
            bloc: BlocProvider.of<UserBloc>(context),
            builder: (context, state) {
              if (state is LoadingUserState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.user != null) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(state.user!.id),
                    Text(state.user!.email),
                    Text(state.user!.image),
                  ],
                );
              } else if (state is FailureUserState) {
                return Text(state.error);
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
