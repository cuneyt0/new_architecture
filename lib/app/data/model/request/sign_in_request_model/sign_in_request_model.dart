import 'package:architecture/core/network/interfaces/base_network_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_in_request_model.g.dart';

@JsonSerializable()
class SignInRequestModel extends BaseNetworkModel<SignInRequestModel> {
  String? email;
  String? password;

  SignInRequestModel({this.email, this.password});

  factory SignInRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SignInRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$SignInRequestModelToJson(this);

  @override
  SignInRequestModel fromJson(Map<String, dynamic> json) {
    return SignInRequestModel.fromJson(json);
  }
}
