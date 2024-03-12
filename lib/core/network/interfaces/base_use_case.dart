import 'package:architecture/core/base/base_network_error_type.dart';
import 'package:architecture/core/base/base_network_type_def.dart';
import 'package:equatable/equatable.dart';

abstract class BaseParamsUseCase<Type, Request> {
  ResultDecode<Type, BaseNetworkErrorType>? call({required Request? params});
}

class NoParams extends Equatable {
  @override
  List<Object> get props => <Object>[];
}

class QueryParameters extends Equatable {
  final Map<String, dynamic> queryParameters;

  const QueryParameters({required this.queryParameters});
  @override
  List<Object> get props => <Object>[queryParameters];
}
