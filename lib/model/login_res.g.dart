// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoginRes _$$_LoginResFromJson(Map<String, dynamic> json) => _$_LoginRes(
      jwt: json['jwt'] as String,
      user: Map<String, String>.from(json['user'] as Map),
      imageUrl:
          (json['image_url'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$_LoginResToJson(_$_LoginRes instance) =>
    <String, dynamic>{
      'jwt': instance.jwt,
      'user': instance.user,
      'image_url': instance.imageUrl,
    };
