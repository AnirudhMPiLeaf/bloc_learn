import 'dart:async';

/// Authentication Status
enum AuthenticationStatus {
  /// unknown status
  unknown,

  /// authentication success
  authenticated,

  /// unauthenticated
  unauthenticated,
}

/// {@template authentication_repository}
/// Authentication Repository
/// {@endtemplate}
class AuthenticationRepository {
  /// {@macro authentication_repository}
  AuthenticationRepository();

  final _controller = StreamController<AuthenticationStatus>();

  /// get authentication status
  Stream<AuthenticationStatus> get status async* {
    // await Future<void>.delayed(const Duration(seconds: 1));
    // yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  /// login user
  Future<void> login({
    required String username,
    required String password,
  }) async {
    await Future.delayed(
      const Duration(milliseconds: 300),
      () => _controller.add(AuthenticationStatus.authenticated),
    );
  }

  /// logout user
  void logout() {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  /// dispose controller on closing the repository
  void dispose() => _controller.close();
}
