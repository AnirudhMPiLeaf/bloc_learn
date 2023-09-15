import 'package:user_repository/src/models/user.dart';
import 'package:uuid/uuid.dart';

/// {@template user_repository}
/// User Repository
/// {@endtemplate}
class UserRepository {
  /// {@macro user_repository}
  UserRepository();

  /// user object
  User? _user;

  /// get user
  Future<User?> getUser() async {
    if (_user != null) return _user;
    return Future.delayed(
      const Duration(milliseconds: 300),
      () => _user = User(
        id: const Uuid().v4(),
      ),
    );
  }
}
