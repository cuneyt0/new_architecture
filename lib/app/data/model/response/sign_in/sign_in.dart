// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:architecture/app/data/model/response/sign_in/sign_in_data/sign_in_data.dart';
import 'package:architecture/app/data/model/response/sign_in/support/support.dart';
import 'package:architecture/app/domain/sign_in/entity/sign_in_data_entity.dart';
import 'package:architecture/app/domain/sign_in/entity/sign_in_entity.dart';
import 'package:architecture/core/network/interfaces/base_network_model.dart';
import 'package:architecture/core/network/interfaces/data_mapper.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_in.g.dart';

@JsonSerializable()
@HiveType(typeId: 0)
class SignIn implements BaseNetworkModel<SignIn>, DataMapper<SignInEntity> {
  @HiveField(0)
  final String? token;
  @HiveField(1)
  final int? page;
  @HiveField(2)
  @JsonKey(name: 'per_page')
  final int? perPage;
  @HiveField(3)
  final List<SignInData?>? data;
  @HiveField(4)
  final Support? support;

  SignIn({this.page, this.perPage, this.data, this.support, this.token});

  factory SignIn.fromJson(Map<String, dynamic> json) => _$SignInFromJson(json);
  Map<String, dynamic> toJson() => _$SignInToJson(this);

  @override
  SignIn fromJson(Map<String, dynamic> json) {
    return SignIn.fromJson(json);
  }

  @override
  SignInEntity mapToEntity() {
    final List<SignInDataEntity?>? _data =
        data?.map((SignInData? e) => e?.mapToEntity()).toList();
    return SignInEntity(
        support: support?.mapToEntity(), data: _data, token: token);
  }
}
