// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationUser _$AuthenticationUserFromJson(Map<String, dynamic> json) =>
    AuthenticationUser(
      id: json['id'] as String,
      name: json['name'] as String?,
      surname: json['surname'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$AuthenticationUserToJson(AuthenticationUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'surname': instance.surname,
      'phoneNumber': instance.phoneNumber,
    };
