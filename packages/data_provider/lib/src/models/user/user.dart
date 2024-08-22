// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_provider/data_provider.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(
  explicitToJson: true,
)
class User {
  User(
    this.userId,
    this.name,
    this.phoneNumber,
    this.address,
  );
  const User.anonymous({
    this.userId = '',
    this.name = '',
    this.phoneNumber = '',
    this.address = const [],
  });
  final String? userId;
  final String? name;
  final String? phoneNumber;
  final List<String>? address;

  factory User.fromJson(JsonType json) => _$UserFromJson(json);
  JsonType toJson() => _$UserToJson(this);
}
