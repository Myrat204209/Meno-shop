import 'package:data_provider/data_provider.dart';
import 'package:json_annotation/json_annotation.dart';

part 'creator_item.g.dart';

@JsonSerializable(explicitToJson: true)
class CreatorItem {
  final String? name;
  final String? uuid;
  final String? surname;
  final String? username;
  const CreatorItem(
    this.name,
    this.uuid,
    this.surname,
    this.username,
  );

  factory CreatorItem.fromJson(JsonType json) =>
      _$CreatorItemFromJson(json);

  JsonType toJson() => _$CreatorItemToJson(this);
}
