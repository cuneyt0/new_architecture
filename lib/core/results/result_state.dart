import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_state.freezed.dart';

@freezed
class ResultState<T, E extends Exception> with _$ResultState<T, E> {
  const ResultState._() : super();

  const factory ResultState.idle() = Idle;
  const factory ResultState.pending() = Pending;
  const factory ResultState.completed(T data) = Completed;
  const factory ResultState.failed(E error, {Color? textColor}) = Failed;
  const factory ResultState.empty({Color? textColor}) = Empty;

  T? get data {
    return whenOrNull(completed: ((data) => data));
  }
}
