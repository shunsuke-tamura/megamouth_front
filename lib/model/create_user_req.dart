import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_user_req.freezed.dart';
part 'create_user_req.g.dart';

@freezed
abstract class CreateUserReq with _$CreateUserReq {
  const factory CreateUserReq({
    @JsonKey(name: 'id') required String id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'image_url') required List<String> imageUrl,
    @JsonKey(name: 'password') required String password,
  }) = _CreateUserReq;

  factory CreateUserReq.fromJson(Map<String, dynamic> json) =>
      _$CreateUserReqFromJson(json);
}
