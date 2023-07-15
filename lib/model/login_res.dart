import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:megamouth_front/model/user.dart';

part 'login_res.freezed.dart';
part 'login_res.g.dart';

@freezed
abstract class LoginRes with _$LoginRes {
  const factory LoginRes({
    @JsonKey(name: 'jwt') required String jwt,
    @JsonKey(name: 'user') required User user,
  }) = _LoginRes;

  factory LoginRes.fromJson(Map<String, dynamic> json) =>
      _$LoginResFromJson(json);
}
