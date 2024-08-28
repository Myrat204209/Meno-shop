// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_provider/data_provider.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_request_body.g.dart';

@JsonSerializable(explicitToJson: true)
class UserRequestBody {

  final String name;
  final String surname;
  final String address;
  UserRequestBody(
    this.name,
    this.surname,
    this.address,
  );

  factory UserRequestBody.fromJson(JsonType json) => _$UserRequestBodyFromJson(json);
  JsonType toJson() => _$UserRequestBodyToJson(this);
}
