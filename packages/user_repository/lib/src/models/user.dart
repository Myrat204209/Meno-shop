import 'package:data_provider/data_provider.dart';

/// {@template user}
/// User model represents the current user
/// {@endtemplate}
class User extends AuthUser {
  /// {@macro user}
  const User({
    required super.id,
    String? phone,
    String? name,
    String? surname,
  }) : super(phoneNumber: phone);

  /// Converts [AuthUser] to [User].
  factory User.fromAuthUser({
    required AuthUser authUser,
  }) =>
      User(
        id: authUser.id,
        name: authUser.name,
        surname: authUser.surname,
        phone: authUser.phoneNumber,
      );

  /// Whether the current user is anonymous.
  @override
  bool get isAnonymous => this == anonymous;

  /// Anonymous user which represents an unauthenticated user.
  static const User anonymous = User(id: '');
}
