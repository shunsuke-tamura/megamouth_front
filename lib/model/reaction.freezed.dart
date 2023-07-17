// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Reaction _$ReactionFromJson(Map<String, dynamic> json) {
  return _Reaction.fromJson(json);
}

/// @nodoc
mixin _$Reaction {
  @JsonKey(name: 'reaction_id')
  int get reactionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  User get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReactionCopyWith<Reaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReactionCopyWith<$Res> {
  factory $ReactionCopyWith(Reaction value, $Res Function(Reaction) then) =
      _$ReactionCopyWithImpl<$Res, Reaction>;
  @useResult
  $Res call(
      {@JsonKey(name: 'reaction_id') int reactionId,
      @JsonKey(name: 'user') User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$ReactionCopyWithImpl<$Res, $Val extends Reaction>
    implements $ReactionCopyWith<$Res> {
  _$ReactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reactionId = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      reactionId: null == reactionId
          ? _value.reactionId
          : reactionId // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ReactionCopyWith<$Res> implements $ReactionCopyWith<$Res> {
  factory _$$_ReactionCopyWith(
          _$_Reaction value, $Res Function(_$_Reaction) then) =
      __$$_ReactionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'reaction_id') int reactionId,
      @JsonKey(name: 'user') User user});

  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_ReactionCopyWithImpl<$Res>
    extends _$ReactionCopyWithImpl<$Res, _$_Reaction>
    implements _$$_ReactionCopyWith<$Res> {
  __$$_ReactionCopyWithImpl(
      _$_Reaction _value, $Res Function(_$_Reaction) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reactionId = null,
    Object? user = null,
  }) {
    return _then(_$_Reaction(
      reactionId: null == reactionId
          ? _value.reactionId
          : reactionId // ignore: cast_nullable_to_non_nullable
              as int,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Reaction implements _Reaction {
  const _$_Reaction(
      {@JsonKey(name: 'reaction_id') required this.reactionId,
      @JsonKey(name: 'user') required this.user});

  factory _$_Reaction.fromJson(Map<String, dynamic> json) =>
      _$$_ReactionFromJson(json);

  @override
  @JsonKey(name: 'reaction_id')
  final int reactionId;
  @override
  @JsonKey(name: 'user')
  final User user;

  @override
  String toString() {
    return 'Reaction(reactionId: $reactionId, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Reaction &&
            (identical(other.reactionId, reactionId) ||
                other.reactionId == reactionId) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, reactionId, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReactionCopyWith<_$_Reaction> get copyWith =>
      __$$_ReactionCopyWithImpl<_$_Reaction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReactionToJson(
      this,
    );
  }
}

abstract class _Reaction implements Reaction {
  const factory _Reaction(
      {@JsonKey(name: 'reaction_id') required final int reactionId,
      @JsonKey(name: 'user') required final User user}) = _$_Reaction;

  factory _Reaction.fromJson(Map<String, dynamic> json) = _$_Reaction.fromJson;

  @override
  @JsonKey(name: 'reaction_id')
  int get reactionId;
  @override
  @JsonKey(name: 'user')
  User get user;
  @override
  @JsonKey(ignore: true)
  _$$_ReactionCopyWith<_$_Reaction> get copyWith =>
      throw _privateConstructorUsedError;
}
