import 'package:data_provider/data_provider.dart';

/// {@template user}
/// User model represents the current user
/// {@endtemplate}
class User extends AuthenticationUser {
  /// {@macro user}
  const User({
    required super.id,
    String? phone,
    String? name,
    String? surname,
  }) : super(phoneNumber: phone);

  /// Converts [AuthenticationUser] to [User].
  factory User.fromAuthenticationUser({
    required AuthenticationUser authenticationUser,
  }) =>
      User(
        id: authenticationUser.id,
        name: authenticationUser.name,
        surname: authenticationUser.surname,
        phone: authenticationUser.phoneNumber,
      );

  /// Whether the current user is anonymous.
  @override
  bool get isAnonymous => this == anonymous;

  /// Anonymous user which represents an unauthenticated user.
  static const User anonymous = User(id: '');
}
