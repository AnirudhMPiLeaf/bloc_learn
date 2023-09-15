// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $noInternetPageRouter,
      $onboardingPageRouter,
      $loginPageRouter,
      $homePageRouter,
    ];

RouteBase get $noInternetPageRouter => GoRouteData.$route(
      path: '/noInternet',
      factory: $NoInternetPageRouterExtension._fromState,
    );

extension $NoInternetPageRouterExtension on NoInternetPageRouter {
  static NoInternetPageRouter _fromState(GoRouterState state) =>
      NoInternetPageRouter();

  String get location => GoRouteData.$location(
        '/noInternet',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $onboardingPageRouter => GoRouteData.$route(
      path: '/onboarding',
      factory: $OnboardingPageRouterExtension._fromState,
    );

extension $OnboardingPageRouterExtension on OnboardingPageRouter {
  static OnboardingPageRouter _fromState(GoRouterState state) =>
      OnboardingPageRouter();

  String get location => GoRouteData.$location(
        '/onboarding',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $loginPageRouter => GoRouteData.$route(
      path: '/login',
      factory: $LoginPageRouterExtension._fromState,
    );

extension $LoginPageRouterExtension on LoginPageRouter {
  static LoginPageRouter _fromState(GoRouterState state) => LoginPageRouter();

  String get location => GoRouteData.$location(
        '/login',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $homePageRouter => GoRouteData.$route(
      path: '/home',
      factory: $HomePageRouterExtension._fromState,
    );

extension $HomePageRouterExtension on HomePageRouter {
  static HomePageRouter _fromState(GoRouterState state) => HomePageRouter(
        text: state.uri.queryParameters['text'] ?? '',
      );

  String get location => GoRouteData.$location(
        '/home',
        queryParams: {
          if (text != '') 'text': text,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
