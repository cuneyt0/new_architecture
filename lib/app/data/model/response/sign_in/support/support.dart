import 'package:architecture/app/domain/sign_in/entity/support_entity.dart';
import 'package:architecture/core/network/interfaces/base_network_model.dart';
import 'package:architecture/core/network/interfaces/data_mapper.dart';

import 'package:json_annotation/json_annotation.dart';

part 'support.g.dart';

@JsonSerializable()
class Support implements BaseNetworkModel<Support>, DataMapper<SupportEntity> {
  final String? url;
  final String? text;

  Support({this.text, this.url});

  factory Support.fromJson(Map<String, dynamic> json) =>
      _$SupportFromJson(json);
  Map<String, dynamic> toJson() => _$SupportToJson(this);

  @override
  Support fromJson(Map<String, dynamic> json) {
    return Support.fromJson(json);
  }

  @override
  SupportEntity mapToEntity() {
    return SupportEntity(text: text, url: url);
  }
}
