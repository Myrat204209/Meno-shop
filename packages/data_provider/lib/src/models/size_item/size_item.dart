import 'package:data_provider/data_provider.dart';
import 'package:json_annotation/json_annotation.dart';

part 'size_item.g.dart';

@JsonSerializable(explicitToJson: true)
class SizeItem {
  final bool? L;
  final bool? M;
  final bool? S;
  final bool? XL;
  
  const SizeItem({
    this.L,
    this.M,
    this.S,
    this.XL,
  });

  factory SizeItem.fromJson(JsonType json) => _$SizeItemFromJson(json);

  JsonType toJson() => _$SizeItemToJson(this);
}
