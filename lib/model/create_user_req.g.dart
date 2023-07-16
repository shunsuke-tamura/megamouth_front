// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreateUserReq _$$_CreateUserReqFromJson(Map<String, dynamic> json) =>
    _$_CreateUserReq(
      id: json['id'] as String,
      name: json['name'] as String?,
      imageUrl:
          (json['image_url'] as List<dynamic>).map((e) => e as String).toList(),
      password: json['password'] as String,
    );

Map<String, dynamic> _$$_CreateUserReqToJson(_$_CreateUserReq instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image_url': instance.imageUrl,
      'password': instance.password,
    };
