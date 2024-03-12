import 'package:architecture/app/domain/sign_in/entity/sign_in_data_entity.dart';
import 'package:architecture/app/domain/sign_in/entity/support_entity.dart';

import 'package:equatable/equatable.dart';

class UsersEntity extends Equatable {
  final List<SignInDataEntity?>? data;
  final SupportEntity? support;

  const UsersEntity({
    this.data,
    this.support,
  });

  @override
  List<Object?> get props => [data, support];
}
