// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Users _$UsersFromJson(Map<String, dynamic> json) => Users(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : SignInData.fromJson(e as Map<String, dynamic>))
          .toList(),
      page: json['page'] as int?,
      perPage: json['per_page'] as int?,
      support: json['support'] == null
          ? null
          : Support.fromJson(json['support'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UsersToJson(Users instance) => <String, dynamic>{
      'page': instance.page,
      'per_page': instance.perPage,
      'data': instance.data,
      'support': instance.support,
    };
