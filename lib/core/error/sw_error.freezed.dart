// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sw_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SwError {
  String? get errorMessage => throw _privateConstructorUsedError;
  int? get errorCode => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SwErrorCopyWith<SwError> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SwErrorCopyWith<$Res> {
  factory $SwErrorCopyWith(SwError value, $Res Function(SwError) then) =
      _$SwErrorCopyWithImpl<$Res, SwError>;
  @useResult
  $Res call({String? errorMessage, int? errorCode});
}

/// @nodoc
class _$SwErrorCopyWithImpl<$Res, $Val extends SwError>
    implements $SwErrorCopyWith<$Res> {
  _$SwErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? errorCode = freezed,
  }) {
    return _then(_value.copyWith(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      errorCode: freezed == errorCode
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SwErrorImplCopyWith<$Res> implements $SwErrorCopyWith<$Res> {
  factory _$$SwErrorImplCopyWith(
          _$SwErrorImpl value, $Res Function(_$SwErrorImpl) then) =
      __$$SwErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? errorMessage, int? errorCode});
}

/// @nodoc
class __$$SwErrorImplCopyWithImpl<$Res>
    extends _$SwErrorCopyWithImpl<$Res, _$SwErrorImpl>
    implements _$$SwErrorImplCopyWith<$Res> {
  __$$SwErrorImplCopyWithImpl(
      _$SwErrorImpl _value, $Res Function(_$SwErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorMessage = freezed,
    Object? errorCode = freezed,
  }) {
    return _then(_$SwErrorImpl(
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      errorCode: freezed == errorCode
          ? _value.errorCode
          : errorCode // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$SwErrorImpl implements _SwError {
  const _$SwErrorImpl({this.errorMessage, this.errorCode});

  @override
  final String? errorMessage;
  @override
  final int? errorCode;

  @override
  String toString() {
    return 'SwError(errorMessage: $errorMessage, errorCode: $errorCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SwErrorImpl &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.errorCode, errorCode) ||
                other.errorCode == errorCode));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage, errorCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SwErrorImplCopyWith<_$SwErrorImpl> get copyWith =>
      __$$SwErrorImplCopyWithImpl<_$SwErrorImpl>(this, _$identity);
}

abstract class _SwError implements SwError {
  const factory _SwError({final String? errorMessage, final int? errorCode}) =
      _$SwErrorImpl;

  @override
  String? get errorMessage;
  @override
  int? get errorCode;
  @override
  @JsonKey(ignore: true)
  _$$SwErrorImplCopyWith<_$SwErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
