import 'package:architecture/app/domain/sign_in/entity/sign_in_data_entity.dart';
import 'package:architecture/core/network/interfaces/base_network_model.dart';
import 'package:architecture/core/network/interfaces/data_mapper.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_in_data.g.dart';

@JsonSerializable()
class SignInData
    implements BaseNetworkModel<SignInData>, DataMapper<SignInDataEntity> {
  final int? id;
  final String? email;
  @JsonKey(name: 'first_name')
  final String? firstName;
  @JsonKey(name: 'last_name')
  final String? lastName;
  final String? avatar;

  SignInData({this.avatar, this.email, this.firstName, this.id, this.lastName});

  factory SignInData.fromJson(Map<String, dynamic> json) =>
      _$SignInDataFromJson(json);
  Map<String, dynamic> toJson() => _$SignInDataToJson(this);

  @override
  SignInData fromJson(Map<String, dynamic> json) {
    return SignInData.fromJson(json);
  }

  @override
  SignInDataEntity mapToEntity() {
    return SignInDataEntity(
      avatar: avatar,
      email: email,
      lastName: lastName,
      firstName: firstName,
    );
  }
}
