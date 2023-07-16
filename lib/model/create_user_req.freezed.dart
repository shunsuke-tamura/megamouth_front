// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_user_req.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CreateUserReq _$CreateUserReqFromJson(Map<String, dynamic> json) {
  return _CreateUserReq.fromJson(json);
}

/// @nodoc
mixin _$CreateUserReq {
  @JsonKey(name: 'id')
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  List<String> get imageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'password')
  String get password => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreateUserReqCopyWith<CreateUserReq> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateUserReqCopyWith<$Res> {
  factory $CreateUserReqCopyWith(
          CreateUserReq value, $Res Function(CreateUserReq) then) =
      _$CreateUserReqCopyWithImpl<$Res, CreateUserReq>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'image_url') List<String> imageUrl,
      @JsonKey(name: 'password') String password});
}

/// @nodoc
class _$CreateUserReqCopyWithImpl<$Res, $Val extends CreateUserReq>
    implements $CreateUserReqCopyWith<$Res> {
  _$CreateUserReqCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? imageUrl = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as List<String>,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateUserReqCopyWith<$Res>
    implements $CreateUserReqCopyWith<$Res> {
  factory _$$_CreateUserReqCopyWith(
          _$_CreateUserReq value, $Res Function(_$_CreateUserReq) then) =
      __$$_CreateUserReqCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String id,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'image_url') List<String> imageUrl,
      @JsonKey(name: 'password') String password});
}

/// @nodoc
class __$$_CreateUserReqCopyWithImpl<$Res>
    extends _$CreateUserReqCopyWithImpl<$Res, _$_CreateUserReq>
    implements _$$_CreateUserReqCopyWith<$Res> {
  __$$_CreateUserReqCopyWithImpl(
      _$_CreateUserReq _value, $Res Function(_$_CreateUserReq) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? imageUrl = null,
    Object? password = null,
  }) {
    return _then(_$_CreateUserReq(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: null == imageUrl
          ? _value._imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as List<String>,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_CreateUserReq implements _CreateUserReq {
  const _$_CreateUserReq(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'image_url') required final List<String> imageUrl,
      @JsonKey(name: 'password') required this.password})
      : _imageUrl = imageUrl;

  factory _$_CreateUserReq.fromJson(Map<String, dynamic> json) =>
      _$$_CreateUserReqFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String id;
  @override
  @JsonKey(name: 'name')
  final String? name;
  final List<String> _imageUrl;
  @override
  @JsonKey(name: 'image_url')
  List<String> get imageUrl {
    if (_imageUrl is EqualUnmodifiableListView) return _imageUrl;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageUrl);
  }

  @override
  @JsonKey(name: 'password')
  final String password;

  @override
  String toString() {
    return 'CreateUserReq(id: $id, name: $name, imageUrl: $imageUrl, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateUserReq &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._imageUrl, _imageUrl) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name,
      const DeepCollectionEquality().hash(_imageUrl), password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateUserReqCopyWith<_$_CreateUserReq> get copyWith =>
      __$$_CreateUserReqCopyWithImpl<_$_CreateUserReq>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_CreateUserReqToJson(
      this,
    );
  }
}

abstract class _CreateUserReq implements CreateUserReq {
  const factory _CreateUserReq(
          {@JsonKey(name: 'id') required final String id,
          @JsonKey(name: 'name') final String? name,
          @JsonKey(name: 'image_url') required final List<String> imageUrl,
          @JsonKey(name: 'password') required final String password}) =
      _$_CreateUserReq;

  factory _CreateUserReq.fromJson(Map<String, dynamic> json) =
      _$_CreateUserReq.fromJson;

  @override
  @JsonKey(name: 'id')
  String get id;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'image_url')
  List<String> get imageUrl;
  @override
  @JsonKey(name: 'password')
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_CreateUserReqCopyWith<_$_CreateUserReq> get copyWith =>
      throw _privateConstructorUsedError;
}
