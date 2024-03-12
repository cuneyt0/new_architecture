import 'package:architecture/app/domain/sign_in/entity/sign_in_data_entity.dart';
import 'package:architecture/app/domain/sign_in/entity/support_entity.dart';

import 'package:equatable/equatable.dart';

class SignInEntity extends Equatable {
  final List<SignInDataEntity?>? data;
  final SupportEntity? support;
  final String? token;

  const SignInEntity({this.data, this.support, this.token});

  @override
  List<Object?> get props => [data, support, token];
}
