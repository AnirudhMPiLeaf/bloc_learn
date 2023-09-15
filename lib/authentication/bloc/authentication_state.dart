part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.user = User.empty,
  });

  const AuthenticationState.unknown() : this._();
  const AuthenticationState.authenticated(User user)
      : this._(status: AuthenticationStatus.authenticated, user: user);
  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  final AuthenticationStatus status;
  final User user;
  @override
  List<Object> get props => [status, user];

  static AuthenticationState? fromJson(Map<String, dynamic> json) {
    var authenticationStatus = AuthenticationStatus.unknown;
    if (json['status'] != null) {
      if (json['status'].toString() == '1') {
        authenticationStatus = AuthenticationStatus.authenticated;
        return const AuthenticationState.authenticated(User(id: '1'));
      } else {
        authenticationStatus = AuthenticationStatus.unauthenticated;
        return const AuthenticationState.unauthenticated();
      }
    }
    return const AuthenticationState._();
  }

  static Map<String, dynamic>? toJson(AuthenticationState state) {
    return {
      'status': state.status == AuthenticationStatus.authenticated ? '1' : '0',
    };
  }
}
