import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
class Result<T, E extends Exception> with _$Result<T, E> {
  const Result._() : super();

  const factory Result.success(T data) = _Success;
  const factory Result.failure(E error) = _Failure;

  T? get data {
    return when(success: (data) {
      return data;
    }, failure: (error) {
      return null;
    });
  }

  bool get hasData {
    return data != null;
  }
}
