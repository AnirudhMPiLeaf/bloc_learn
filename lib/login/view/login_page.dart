import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_learn/authentication/bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('login'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            context.read<AuthenticationBloc>().add(
                  const AuthenticationStatusChanged(
                    status: AuthenticationStatus.authenticated,
                  ),
                );
            // HomePageRouter().go(context);
          },
          child: const Text('nav'),
        ),
      ),
    );
  }
}
