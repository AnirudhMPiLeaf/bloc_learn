import 'package:equatable/equatable.dart';

/// User model
class User extends Equatable {
  /// User model constructor
  const User({
    required this.id,
  });

  /// user id
  final String id;

  @override
  List<Object?> get props => [id];

  /// empty initialization
  static const empty = User(id: '-');
}
