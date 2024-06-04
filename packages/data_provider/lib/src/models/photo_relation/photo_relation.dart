import 'package:data_provider/data_provider.dart' show JsonType;
import 'package:json_annotation/json_annotation.dart';

part 'photo_relation.g.dart';

@JsonSerializable(explicitToJson: true)
class PhotoCat {
  const PhotoCat({
    this.id,
    this.uuid,
    this.categoriesId,
  });
  final int? id;
  final String? uuid;
  final String? categoriesId;
  JsonType toJson() => _$PhotoCatToJson(this);
  factory PhotoCat.fromJson(JsonType json) => _$PhotoCatFromJson(json);
}

@JsonSerializable(explicitToJson: true)
class PhotoSub {
  const PhotoSub({
    this.id,
    this.uuid,
    this.subcategoriesId,
  });
  final int? id;
  final String? uuid;
  final String? subcategoriesId;
  JsonType toJson() => _$PhotoSubToJson(this);
  factory PhotoSub.fromJson(JsonType json) => _$PhotoSubFromJson(json);
}

@JsonSerializable(explicitToJson: true)
class PhotoProducts {
  const PhotoProducts({
    this.id,
    this.uuid,
    this.productsId,
  });
  final int? id;
  final String? uuid;
  final String? productsId;
  factory PhotoProducts.fromJson(JsonType json) =>
      _$PhotoProductsFromJson(json);

  JsonType toJson() => _$PhotoProductsToJson(this);
}
