// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInData _$SignInDataFromJson(Map<String, dynamic> json) => SignInData(
      avatar: json['avatar'] as String?,
      email: json['email'] as String?,
      firstName: json['first_name'] as String?,
      id: json['id'] as int?,
      lastName: json['last_name'] as String?,
    );

Map<String, dynamic> _$SignInDataToJson(SignInData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'avatar': instance.avatar,
    };
