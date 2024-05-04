// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'authentication_user.g.dart';

/// {@template authentication_user}
/// User model
///
/// [AuthenticationUser.anonymous] represents an unauthenticated user.
/// {@endtemplate}
@JsonSerializable(explicitToJson: true)
class AuthenticationUser extends Equatable {
  /// {@macro authentication_user}

  const AuthenticationUser({
    required this.id,
    this.name,
    this.surname,
    this.phoneNumber,
  });

  /// The current user's id.
  @JsonKey(name: 'id')
  final String id;

  /// current user's name.
  @JsonKey(name: 'name')
  final String? name;

  /// current user's surname.
  @JsonKey(name: 'surname')
  final String? surname;

  /// current user's phone.
  @JsonKey(name: 'phoneNumber')
  final String? phoneNumber;

  /// Whether the current user is anonymous.
  bool get isAnonymous => this == anonymous;

  /// Anonymous user which represents an unauthenticated user.
  static const anonymous = AuthenticationUser(id: '');

  /// Creates an instance of `AuthenticationUser` from a JSON map.
  factory AuthenticationUser.fromJson(Map<String, dynamic> json) =>
      _$AuthenticationUserFromJson(json);

  /// Converts the `Authentication` object to a JSON map.
  Map<String, dynamic> toJson() => _$AuthenticationUserToJson(this);
  @override
  List<Object?> get props => [
        id,
        name,
        surname,
        phoneNumber,
      ];
}
