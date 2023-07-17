// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Reaction _$$_ReactionFromJson(Map<String, dynamic> json) => _$_Reaction(
      reactionId: json['reaction_id'] as int,
      user: User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_ReactionToJson(_$_Reaction instance) =>
    <String, dynamic>{
      'reaction_id': instance.reactionId,
      'user': instance.user,
    };
