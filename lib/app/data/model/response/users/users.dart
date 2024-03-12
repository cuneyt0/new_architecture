// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:architecture/app/data/model/response/sign_in/sign_in_data/sign_in_data.dart';
import 'package:architecture/app/data/model/response/sign_in/support/support.dart';
import 'package:architecture/app/domain/sign_in/entity/sign_in_data_entity.dart';
import 'package:architecture/app/domain/users/entity/users_entity.dart';
import 'package:architecture/core/network/interfaces/base_network_model.dart';
import 'package:architecture/core/network/interfaces/data_mapper.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'users.g.dart';

@JsonSerializable()
final class Users implements BaseNetworkModel<Users>, DataMapper<UsersEntity> {
  final int? page;
  @JsonKey(name: 'per_page')
  final int? perPage;
  final List<SignInData?>? data;
  final Support? support;

  Users({this.data, this.page, this.perPage, this.support});

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);
  Map<String, dynamic> toJson() => _$UsersToJson(this);

  @override
  Users fromJson(Map<String, dynamic> json) {
    return Users.fromJson(json);
  }

  @override
  UsersEntity mapToEntity() {
    final List<SignInDataEntity?>? _data =
        data?.map((SignInData? e) => e?.mapToEntity()).toList();
    return UsersEntity(
      data: _data,
      support: support?.mapToEntity(),
    );
  }
}
