import 'package:animation/bloc/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_bloc.dart';
import '../bloc/user_event.dart';
import '../model/user_model.dart';
import 'list_state.dart';

class UserPostScreen extends StatelessWidget {
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  UserPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserBloc(UserRepository()),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(title: Text("Create User")),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(labelText: "Name"),
                  ),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(labelText: "Email"),
                  ),
                  SizedBox(height: 20),
                  BlocConsumer<UserBloc, UserState>(
                    listener: (context, state) {
                      if (state is UserSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("User Created Successfully")),
                        );
                      } else if (state is UserError) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(state.message)));
                      }
                    },
                    builder: (context, state) {
                      if (state is UserLoading) {
                        return CircularProgressIndicator();
                      }
                      return ElevatedButton(
                        onPressed: () {
                          final user = User(
                            name: nameController.text,
                            email: emailController.text,
                          );
                          context.read<UserBloc>().add(SubmitUsers(user));
                        },
                        child: Text("Submit"),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
