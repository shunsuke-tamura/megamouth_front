import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:megamouth_front/model/reaction.dart';

part 'tweet.freezed.dart';
part 'tweet.g.dart';

@freezed
abstract class Tweet with _$Tweet {
  const factory Tweet({
    @JsonKey(name: 'author') required String author,
    @JsonKey(name: 'content') required String content,
    // @JsonKey(name: 'createdAt') required String createdAt,
    @JsonKey(name: 'ID') required int id,
    // @JsonKey(name: 'reaction') required List<Reaction> reaction,
    // @JsonKey(name: 'reply') required String reply,
    // @JsonKey(name: 'updatedAt') required String updatedAt,
  }) = _Tweet;

  factory Tweet.fromJson(Map<String, dynamic> json) => _$TweetFromJson(json);
}
