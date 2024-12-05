import 'package:app/src/auth/data/models/register_params.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_profile_params.g.dart';

@JsonSerializable(ignoreUnannotated: true)
class UpdateProfileParams {
  @JsonKey(name: 'displayName')
  String? displayName;

  UpdateProfileParams({this.displayName});

   factory UpdateProfileParams.fromJson(Map<String, dynamic> json) => _$UpdateProfileParamsFromJson(json);

   Map<String, dynamic> toJson() => _$UpdateProfileParamsToJson(this);
}


