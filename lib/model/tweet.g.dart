// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tweet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Tweet _$$_TweetFromJson(Map<String, dynamic> json) => _$_Tweet(
      author: json['author'] as String,
      content: json['content'] as String,
      createdAt: json['createdAt'] as String,
      id: json['id'] as int,
      reaction: (json['reaction'] as List<dynamic>)
          .map((e) => Reaction.fromJson(e as Map<String, dynamic>))
          .toList(),
      reply: json['reply'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$$_TweetToJson(_$_Tweet instance) => <String, dynamic>{
      'author': instance.author,
      'content': instance.content,
      'createdAt': instance.createdAt,
      'id': instance.id,
      'reaction': instance.reaction,
      'reply': instance.reply,
      'updatedAt': instance.updatedAt,
    };
