// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_res.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LoginRes _$LoginResFromJson(Map<String, dynamic> json) {
  return _LoginRes.fromJson(json);
}

/// @nodoc
mixin _$LoginRes {
  @JsonKey(name: 'jwt')
  String get jwt => throw _privateConstructorUsedError;
  @JsonKey(name: 'user')
  Map<String, String> get user => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  List<String> get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginResCopyWith<LoginRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginResCopyWith<$Res> {
  factory $LoginResCopyWith(LoginRes value, $Res Function(LoginRes) then) =
      _$LoginResCopyWithImpl<$Res, LoginRes>;
  @useResult
  $Res call(
      {@JsonKey(name: 'jwt') String jwt,
      @JsonKey(name: 'user') Map<String, String> user,
      @JsonKey(name: 'image_url') List<String> imageUrl});
}

/// @nodoc
class _$LoginResCopyWithImpl<$Res, $Val extends LoginRes>
    implements $LoginResCopyWith<$Res> {
  _$LoginResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jwt = null,
    Object? user = null,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      jwt: null == jwt
          ? _value.jwt
          : jwt // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginResCopyWith<$Res> implements $LoginResCopyWith<$Res> {
  factory _$$_LoginResCopyWith(
          _$_LoginRes value, $Res Function(_$_LoginRes) then) =
      __$$_LoginResCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'jwt') String jwt,
      @JsonKey(name: 'user') Map<String, String> user,
      @JsonKey(name: 'image_url') List<String> imageUrl});
}

/// @nodoc
class __$$_LoginResCopyWithImpl<$Res>
    extends _$LoginResCopyWithImpl<$Res, _$_LoginRes>
    implements _$$_LoginResCopyWith<$Res> {
  __$$_LoginResCopyWithImpl(
      _$_LoginRes _value, $Res Function(_$_LoginRes) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jwt = null,
    Object? user = null,
    Object? imageUrl = null,
  }) {
    return _then(_$_LoginRes(
      jwt: null == jwt
          ? _value.jwt
          : jwt // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value._user
          : user // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      imageUrl: null == imageUrl
          ? _value._imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LoginRes implements _LoginRes {
  const _$_LoginRes(
      {@JsonKey(name: 'jwt') required this.jwt,
      @JsonKey(name: 'user') required final Map<String, String> user,
      @JsonKey(name: 'image_url') required final List<String> imageUrl})
      : _user = user,
        _imageUrl = imageUrl;

  factory _$_LoginRes.fromJson(Map<String, dynamic> json) =>
      _$$_LoginResFromJson(json);

  @override
  @JsonKey(name: 'jwt')
  final String jwt;
  final Map<String, String> _user;
  @override
  @JsonKey(name: 'user')
  Map<String, String> get user {
    if (_user is EqualUnmodifiableMapView) return _user;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_user);
  }

  final List<String> _imageUrl;
  @override
  @JsonKey(name: 'image_url')
  List<String> get imageUrl {
    if (_imageUrl is EqualUnmodifiableListView) return _imageUrl;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageUrl);
  }

  @override
  String toString() {
    return 'LoginRes(jwt: $jwt, user: $user, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginRes &&
            (identical(other.jwt, jwt) || other.jwt == jwt) &&
            const DeepCollectionEquality().equals(other._user, _user) &&
            const DeepCollectionEquality().equals(other._imageUrl, _imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      jwt,
      const DeepCollectionEquality().hash(_user),
      const DeepCollectionEquality().hash(_imageUrl));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginResCopyWith<_$_LoginRes> get copyWith =>
      __$$_LoginResCopyWithImpl<_$_LoginRes>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LoginResToJson(
      this,
    );
  }
}

abstract class _LoginRes implements LoginRes {
  const factory _LoginRes(
          {@JsonKey(name: 'jwt') required final String jwt,
          @JsonKey(name: 'user') required final Map<String, String> user,
          @JsonKey(name: 'image_url') required final List<String> imageUrl}) =
      _$_LoginRes;

  factory _LoginRes.fromJson(Map<String, dynamic> json) = _$_LoginRes.fromJson;

  @override
  @JsonKey(name: 'jwt')
  String get jwt;
  @override
  @JsonKey(name: 'user')
  Map<String, String> get user;
  @override
  @JsonKey(name: 'image_url')
  List<String> get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$_LoginResCopyWith<_$_LoginRes> get copyWith =>
      throw _privateConstructorUsedError;
}
