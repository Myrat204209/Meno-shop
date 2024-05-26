import 'package:data_provider/data_provider.dart' show JsonType;
import 'package:json_annotation/json_annotation.dart';
part 'profile.g.dart';

@JsonSerializable(explicitToJson: true)
class Profile {
  final String? id;
  final String? name;
  final String? surname;
  final String? username;
  final String? phone;
  final String? image;

  Profile({
    this.id,
    this.name,
    this.surname,
    this.username,
    this.phone,
    this.image,
  });
  JsonType toJson() => _$ProfileToJson(this);
  factory Profile.fromJson(JsonType json) => _$ProfileFromJson(json);
}
