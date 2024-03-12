import 'package:freezed_annotation/freezed_annotation.dart';
part 'sw_error.freezed.dart';

@freezed
class SwError with _$SwError implements Exception {
  const factory SwError({String? errorMessage, int? errorCode}) = _SwError;
}
