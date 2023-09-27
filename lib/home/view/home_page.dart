import 'package:bloc_learn/app/cubit/theme_cubit.dart';
import 'package:bloc_learn/authentication/bloc/authentication_bloc.dart';
import 'package:bloc_learn/helpers/assets.dart';
import 'package:bloc_learn/helpers/colors.dart';
import 'package:bloc_learn/helpers/loading.dart';
import 'package:bloc_learn/helpers/snackbar.dart';
import 'package:bloc_learn/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                LoadingHelper.showLoading();
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
                SnackBarHelper.showSnackbar(
                  Text(
                    context.read<ThemeCubit>().state.isDark ? 'dark' : 'light',
                  ),
                  backgroundColor: context.read<ThemeCubit>().state.isDark
                      ? AppColors.baseColorLight
                      : AppColors.baseColorDark,
                );
                HomePageRouter().go(context);
              },
              child: BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, state) {
                  return Text(
                    'theme ${state.isDark}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  );
                },
              ),
            ),
            BlocBuilder<ThemeCubit, ThemeState>(
              builder: (context, state) {
                return state.isDark
                    ? Image.asset(Assets.assetsPlane)
                    : const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
