// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:data_provider/data_provider.dart' show JsonType;

part 'auth_user.g.dart';

@JsonSerializable(explicitToJson: true)
class AuthUser extends Equatable {
  /// {@macro Auth_user}

  const AuthUser({
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

  @JsonKey(name: 'surname')
  final String? surname;

  @JsonKey(name: 'phoneNumber')
  final String? phoneNumber;

  bool get isAnonymous => this == anonymous;

  static const anonymous = AuthUser(id: '');

  JsonType toJson() => _$AuthUserToJson(this);
  factory AuthUser.fromJson(JsonType json) => _$AuthUserFromJson(json);

  @override
  List<Object?> get props => [
        id,
        name,
        surname,
        phoneNumber,
      ];
}
