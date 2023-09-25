import 'package:bloc_learn/app/cubit/theme_cubit.dart';
import 'package:bloc_learn/authentication/bloc/authentication_bloc.dart';
import 'package:bloc_learn/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('home'),
      ),
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                EasyLoading.show(
                  maskType: EasyLoadingMaskType.clear,
                  status: 'Err0r',
                  indicator: const CircularProgressIndicator.adaptive(),
                  dismissOnTap: true,
                );
                context
                    .read<AuthenticationBloc>()
                    .add(AuthenticationLogoutRequested());
                HomePageRouter().go(context);
              },
              child: const Text('nav'),
            ),
            TextButton(
              onPressed: () {
                context.read<ThemeCubit>().toggleDarkMode();
                HomePageRouter().go(context);
              },
              child: BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, state) {
                  return Text('theme ${state.isDark}');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
