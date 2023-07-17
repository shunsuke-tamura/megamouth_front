// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tweet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Tweet _$$_TweetFromJson(Map<String, dynamic> json) => _$_Tweet(
      author: json['author'] as String,
      content: json['content'] as String,
      id: json['ID'] as int,
    );

Map<String, dynamic> _$$_TweetToJson(_$_Tweet instance) => <String, dynamic>{
      'author': instance.author,
      'content': instance.content,
      'ID': instance.id,
    };
