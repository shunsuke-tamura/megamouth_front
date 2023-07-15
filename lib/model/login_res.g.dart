// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_LoginRes _$$_LoginResFromJson(Map<String, dynamic> json) => _$_LoginRes(
      jwt: json['jwt'] as String,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_LoginResToJson(_$_LoginRes instance) =>
    <String, dynamic>{
      'jwt': instance.jwt,
      'user': instance.user,
    };
