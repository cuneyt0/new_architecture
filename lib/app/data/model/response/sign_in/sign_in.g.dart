// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SignInAdapter extends TypeAdapter<SignIn> {
  @override
  final int typeId = 0;

  @override
  SignIn read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SignIn(
      page: fields[1] as int?,
      perPage: fields[2] as int?,
      data: (fields[3] as List?)?.cast<SignInData?>(),
      support: fields[4] as Support?,
      token: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SignIn obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.token)
      ..writeByte(1)
      ..write(obj.page)
      ..writeByte(2)
      ..write(obj.perPage)
      ..writeByte(3)
      ..write(obj.data)
      ..writeByte(4)
      ..write(obj.support);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SignInAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignIn _$SignInFromJson(Map<String, dynamic> json) => SignIn(
      page: json['page'] as int?,
      perPage: json['per_page'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              e == null ? null : SignInData.fromJson(e as Map<String, dynamic>))
          .toList(),
      support: json['support'] == null
          ? null
          : Support.fromJson(json['support'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$SignInToJson(SignIn instance) => <String, dynamic>{
      'token': instance.token,
      'page': instance.page,
      'per_page': instance.perPage,
      'data': instance.data,
      'support': instance.support,
    };
