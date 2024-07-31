import 'package:data_provider/data_provider.dart' show JsonType;
import 'package:json_annotation/json_annotation.dart';
part 'profile.g.dart';

@JsonSerializable(explicitToJson: true)
class Profile {
  final String? id;
  final String? name;
  final String? phone;

  Profile({
    this.id,
    this.name,
    this.phone,
  });
  JsonType toJson() => _$ProfileToJson(this);
  factory Profile.fromJson(JsonType json) => _$ProfileFromJson(json);
}
