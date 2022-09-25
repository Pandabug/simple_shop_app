import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:simple_shop_app/blocs/user/user_bloc.dart';

class ProfileUserData extends StatelessWidget {
  const ProfileUserData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      bloc: BlocProvider.of<UserBloc>(context),
      builder: (context, state) {
        if (state is LoadingUserState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.user != null) {
          return Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(360),
                      border: Border.all(
                        width: 1,
                        color: Colors.grey,
                      ),
                      color: Colors.orangeAccent,
                      image: state.user!.image != ''
                          ? DecorationImage(
                              image: NetworkImage(state.user!.image),
                              fit: BoxFit.cover,
                              onError: (exception, stackTrace) =>
                                  const AssetImage('assets/no_image_error.jpg'),
                            )
                          : null,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(state.user!.email),
                    const SizedBox(height: 8),
                    Text(state.user!.id),
                  ],
                ),
              ],
            ),
          );
        } else if (state is FailureUserState) {
          return Text(state.error);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
