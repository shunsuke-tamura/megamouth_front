import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:megamouth_front/model/user.dart';

part 'reaction.freezed.dart';
part 'reaction.g.dart';

@freezed
abstract class Reaction with _$Reaction {
  const factory Reaction({
    @JsonKey(name: 'reaction_id') required int reactionId,
    @JsonKey(name: 'user') required User user,
  }) = _Reaction;

  factory Reaction.fromJson(Map<String, dynamic> json) =>
      _$ReactionFromJson(json);
}
