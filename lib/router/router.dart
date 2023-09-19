import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_learn/app/cubit/connectivity_cubit.dart';
import 'package:bloc_learn/authentication/bloc/authentication_bloc.dart';
import 'package:bloc_learn/helpers/no_internet.dart';
import 'package:bloc_learn/helpers/unfocus.dart';
import 'package:bloc_learn/home/home.dart';
import 'package:bloc_learn/login/login.dart';
import 'package:bloc_learn/onboarding/cubit/onboarding_cubit.dart';
import 'package:bloc_learn/onboarding/onboarding.dart';
import 'package:bloc_learn/router/app_services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

part 'router.g.dart';

class AppRoute {
  AppRoute(this.appService);
  late final AppService appService;

  late final GoRouter router = GoRouter(
    refreshListenable: appService,
    redirect: (BuildContext context, GoRouterState state) async {
      final authBloc = context.read<AuthenticationBloc>();
      final onboardingCubit = context.read<OnboardingCubit>();
      final connectivityCubit = context.read<ConnectivityCubit>();

      final networkConnected =
          connectivityCubit.state.networkStatus == NetworkConnection.connected;
      final loggedIn =
          authBloc.state.status == AuthenticationStatus.authenticated;
      final isOnboardingShown = onboardingCubit.state.isOnboardingShown;

      /// check just the matchedLocation in case there are query parameters
      final goingToLogin = state.matchedLocation == LoginPageRouter().location;

      /// check internet or redirect to no internet page
      if (!networkConnected) {
        return NoInternetPageRouter().location;
      }

      /// the user is not logged in and not headed to /login, they need to login
      if (!loggedIn && !goingToLogin) {
        if (isOnboardingShown) {
          return LoginPageRouter().location;
        } else {
          return OnboardingPageRouter().location;
        }
      }

      /// the user is logged in and headed to /login, no need to login again
      if (loggedIn) {
        return HomePageRouter().location;
      }

      /// no need to redirect at all
      return null;
    },
    routes: $appRoutes,
    initialLocation: OnboardingPageRouter().location,
    debugLogDiagnostics: kDebugMode,
    observers: [],
  );
}

@TypedGoRoute<NoInternetPageRouter>(path: '/no-internet')
class NoInternetPageRouter extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Unfocus(child: NoInternetPage());
  }
}

@TypedGoRoute<OnboardingPageRouter>(path: '/onboarding')
class OnboardingPageRouter extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Unfocus(child: OnboardingPage());
  }
}

@TypedGoRoute<LoginPageRouter>(path: '/login')
class LoginPageRouter extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Unfocus(child: LoginPage());
  }
}

@TypedGoRoute<HomePageRouter>(path: '/home')
class HomePageRouter extends GoRouteData {
  HomePageRouter({this.text = ''});

  final String text;
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const Unfocus(
      child: HomePage(
          // trip: Trip.fromJson(json.decode(trip)),
          ),
    );
  }
}
