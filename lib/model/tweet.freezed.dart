// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tweet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Tweet _$TweetFromJson(Map<String, dynamic> json) {
  return _Tweet.fromJson(json);
}

/// @nodoc
mixin _$Tweet {
  @JsonKey(name: 'author')
  String get author => throw _privateConstructorUsedError;
  @JsonKey(name: 'content')
  String get content =>
      throw _privateConstructorUsedError; // @JsonKey(name: 'createdAt') required String createdAt,
  @JsonKey(name: 'ID')
  int get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TweetCopyWith<Tweet> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TweetCopyWith<$Res> {
  factory $TweetCopyWith(Tweet value, $Res Function(Tweet) then) =
      _$TweetCopyWithImpl<$Res, Tweet>;
  @useResult
  $Res call(
      {@JsonKey(name: 'author') String author,
      @JsonKey(name: 'content') String content,
      @JsonKey(name: 'ID') int id});
}

/// @nodoc
class _$TweetCopyWithImpl<$Res, $Val extends Tweet>
    implements $TweetCopyWith<$Res> {
  _$TweetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? author = null,
    Object? content = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TweetCopyWith<$Res> implements $TweetCopyWith<$Res> {
  factory _$$_TweetCopyWith(_$_Tweet value, $Res Function(_$_Tweet) then) =
      __$$_TweetCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'author') String author,
      @JsonKey(name: 'content') String content,
      @JsonKey(name: 'ID') int id});
}

/// @nodoc
class __$$_TweetCopyWithImpl<$Res> extends _$TweetCopyWithImpl<$Res, _$_Tweet>
    implements _$$_TweetCopyWith<$Res> {
  __$$_TweetCopyWithImpl(_$_Tweet _value, $Res Function(_$_Tweet) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? author = null,
    Object? content = null,
    Object? id = null,
  }) {
    return _then(_$_Tweet(
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Tweet implements _Tweet {
  const _$_Tweet(
      {@JsonKey(name: 'author') required this.author,
      @JsonKey(name: 'content') required this.content,
      @JsonKey(name: 'ID') required this.id});

  factory _$_Tweet.fromJson(Map<String, dynamic> json) =>
      _$$_TweetFromJson(json);

  @override
  @JsonKey(name: 'author')
  final String author;
  @override
  @JsonKey(name: 'content')
  final String content;
// @JsonKey(name: 'createdAt') required String createdAt,
  @override
  @JsonKey(name: 'ID')
  final int id;

  @override
  String toString() {
    return 'Tweet(author: $author, content: $content, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Tweet &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, author, content, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TweetCopyWith<_$_Tweet> get copyWith =>
      __$$_TweetCopyWithImpl<_$_Tweet>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TweetToJson(
      this,
    );
  }
}

abstract class _Tweet implements Tweet {
  const factory _Tweet(
      {@JsonKey(name: 'author') required final String author,
      @JsonKey(name: 'content') required final String content,
      @JsonKey(name: 'ID') required final int id}) = _$_Tweet;

  factory _Tweet.fromJson(Map<String, dynamic> json) = _$_Tweet.fromJson;

  @override
  @JsonKey(name: 'author')
  String get author;
  @override
  @JsonKey(name: 'content')
  String get content;
  @override // @JsonKey(name: 'createdAt') required String createdAt,
  @JsonKey(name: 'ID')
  int get id;
  @override
  @JsonKey(ignore: true)
  _$$_TweetCopyWith<_$_Tweet> get copyWith =>
      throw _privateConstructorUsedError;
}
