// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:data_provider/data_provider.dart';
import 'package:json_annotation/json_annotation.dart';

part 'language_model.g.dart';

@JsonSerializable(explicitToJson: true)
class LanguageModel {
  final String? ru;
  final String? tm;
  LanguageModel(
    this.ru,
    this.tm,
  );

  factory LanguageModel.fromJson(JsonType json) =>
      _$LanguageModelFromJson(json);
  JsonType toJson() => _$LanguageModelToJson(this);
}
