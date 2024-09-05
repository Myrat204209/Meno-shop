// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_provider/data_provider.dart' show JsonType;

import 'package:json_annotation/json_annotation.dart';

part 'photo_item.g.dart';

@JsonSerializable(explicitToJson: true)
class PhotoItem {
  final String? uuid;
  final String? path;
  PhotoItem(
    this.uuid,
    this.path,
  );

  factory PhotoItem.fromJson(JsonType json) => _$PhotoItemFromJson(json);
  JsonType toJson() => _$PhotoItemToJson(this);
}
