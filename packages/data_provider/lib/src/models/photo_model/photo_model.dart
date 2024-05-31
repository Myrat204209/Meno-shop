// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'photo_model.g.dart';

@JsonSerializable(explicitToJson: true)
class Photo {
  final String? uuid;
  final String? filename;
  final String? mimetype;
  final String? path;

  Photo(
    this.uuid,
    this.filename,
    this.mimetype,
    this.path,
  );

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);
  Map<String, dynamic> toJson() => _$PhotoToJson(this);
}
/*  {
        "uuid": "em2zel960lwrrd4h6",
        "filename": "1716983029475-298735258.png",
        "mimetype": "image/png",
        "path": "uploads\\products\\1716983029475-298735258.png",
        "createdAt": "2024-05-29T11:43:49.483Z",
        "updatedAt": "2024-05-29T11:43:49.483Z",
        "PhotoProducts": {
          "id": 1,
          "productsId": "cb95eda2-4ace-4d42-87ef-cf65fa1219a1",
          "uuid": "em2zel960lwrrd4h6"
        }
      }
 */