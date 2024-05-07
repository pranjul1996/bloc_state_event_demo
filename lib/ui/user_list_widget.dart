import 'package:bloc_demo/UserBloc/user_bloc.dart';
import 'package:bloc_demo/ui/user_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoadingState) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is UserLoadedState) {
          return Scaffold(
            body: ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  final user = state.users[index];
                  return UserItem(
                      firstName: user.firstName ?? "",
                      lastName: user.lastName ?? "",
                      imgUrl: user.avatar ?? "",
                      email: user.email ?? "");
                }),
          );
        } else if (state is UserErrorState) {
          return Scaffold(
            body: Center(
              child: Text(
                state.error,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          );
        }else return Text("Data will be shown here!");
      },
    );
  }
}
