import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_learn/app/cubit/connectivity_cubit.dart';
import 'package:bloc_learn/app/cubit/theme_cubit.dart';
import 'package:bloc_learn/authentication/bloc/authentication_bloc.dart';
import 'package:bloc_learn/helpers/theme.dart';
import 'package:bloc_learn/l10n/l10n.dart';
import 'package:bloc_learn/login/bloc/login_bloc.dart';
import 'package:bloc_learn/onboarding/cubit/onboarding_cubit.dart';
import 'package:bloc_learn/router/app_services.dart';
import 'package:bloc_learn/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:go_router/go_router.dart';
import 'package:user_repository/user_repository.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthenticationRepository(),
        ),
        RepositoryProvider(
          create: (context) => UserRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
            create: (context) => AuthenticationBloc(
              authenticationRepository:
                  RepositoryProvider.of<AuthenticationRepository>(context),
              userRepository: RepositoryProvider.of<UserRepository>(context),
            ),
            lazy: false,
          ),
          BlocProvider<ConnectivityCubit>(
            create: (context) => ConnectivityCubit(),
            lazy: false,
          ),
          BlocProvider<ThemeCubit>(
            create: (context) => ThemeCubit(),
            lazy: false,
          ),
          BlocProvider<LoginBloc>(
            create: (context) => LoginBloc(
              authenticationRepository:
                  RepositoryProvider.of<AuthenticationRepository>(context),
            ),
          ),
          BlocProvider<OnboardingCubit>(
            create: (context) => OnboardingCubit(
              authenticationRepository:
                  RepositoryProvider.of<AuthenticationRepository>(context),
            ),
            lazy: false,
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({
    super.key,
  });

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  late final GoRouter router;
  @override
  void initState() {
    router = AppRoute(
      AppService(
        context.read<AuthenticationBloc>(),
        context.read<ConnectivityCubit>(),
      ),
    ).router;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (themeContext, themeState) {
        return MaterialApp.router(
          theme: CustomThemeData.light,
          darkTheme: CustomThemeData.dark,
          themeMode: themeState.isDark ? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
          routeInformationProvider: router.routeInformationProvider,
          builder: (context, child) {
            child = EasyLoading.init()(context, child);
            EasyLoading.instance
              ..displayDuration = const Duration(milliseconds: 2000)
              ..indicatorType = EasyLoadingIndicatorType.fadingCircle
              ..loadingStyle = EasyLoadingStyle.custom
              ..boxShadow = []
              // ..indicatorSize = 100.0
              // ..radius = 10.0
              // ..progressColor = Colors.yellow
              ..backgroundColor = Colors.transparent
              ..indicatorColor = Colors.transparent
              ..textColor = Colors.black
              // ..maskColor = Colors.blue.withOpacity(0.5)
              ..userInteractions = true
              ..dismissOnTap = false;
            return child;
          },
        );
      },
    );
  }
}
