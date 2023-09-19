import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_learn/authentication/bloc/authentication_bloc.dart';
import 'package:bloc_learn/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    const x = 'Page';
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.loginX(x)),
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
          child: Text(l10n.nav),
        ),
      ),
    );
  }
}
