// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_provider/data_provider.dart'
    show JsonType, PhotoCat, PhotoSub, PhotoProducts;
import 'package:json_annotation/json_annotation.dart';

part 'photo_item.g.dart';

@JsonSerializable(explicitToJson: true)
class PhotoItem {
  final String? uuid;
  final String? filename;
  final String? mimetype;
  final String? path;
  @JsonKey(name: "PhotoCat", includeIfNull: false)
  final PhotoCat? photoCat;
  @JsonKey(name: "PhotoSub", includeIfNull: false)
  final PhotoSub? photoSub;
  @JsonKey(name: "PhotoProducts", includeIfNull: false)
  final PhotoProducts? photoProducts;
  PhotoItem(
    this.uuid,
    this.filename,
    this.mimetype,
    this.path,
    this.photoCat,
    this.photoSub,
    this.photoProducts,
  );

  factory PhotoItem.fromJson(JsonType json) => _$PhotoItemFromJson(json);
  JsonType toJson() => _$PhotoItemToJson(this);
}
