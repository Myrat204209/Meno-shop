// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_provider/data_provider.dart';
import 'package:json_annotation/json_annotation.dart';

part 'banner_item.g.dart';

@JsonSerializable(explicitToJson: true)
class BannerItem {
  final String? uuid;
  final String? label;
  final String? title;
  final String? subtitle;
  final String? path;
  final String? bannerType;
  final bool? isActive;
  final String? expiresAt;
  final PhotoItem? photo;
  const BannerItem({
    this.uuid,
    this.label,
    this.title,
    this.subtitle,
    this.path,
    this.bannerType,
    this.isActive,
    this.expiresAt,
    this.photo,
  });
  factory BannerItem.fromJson(JsonType json) => _$BannerItemFromJson(json);
  JsonType toJson() => _$BannerItemToJson(this);
}
