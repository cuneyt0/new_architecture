import 'package:equatable/equatable.dart';

class SignInDataEntity extends Equatable {
  final String? email;

  final String? firstName;

  final String? lastName;
  final String? avatar;

  const SignInDataEntity(
      {this.avatar, this.email, this.firstName, this.lastName});

  @override
  List<Object?> get props => [email, firstName, lastName, avatar];
}
