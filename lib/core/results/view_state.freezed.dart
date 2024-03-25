// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ViewState<T, E extends Exception> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() pending,
    required TResult Function(T data) completed,
    required TResult Function(E error, Color? textColor) failed,
    required TResult Function(Color? textColor) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? pending,
    TResult? Function(T data)? completed,
    TResult? Function(E error, Color? textColor)? failed,
    TResult? Function(Color? textColor)? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? pending,
    TResult Function(T data)? completed,
    TResult Function(E error, Color? textColor)? failed,
    TResult Function(Color? textColor)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T, E> value) idle,
    required TResult Function(Pending<T, E> value) pending,
    required TResult Function(Completed<T, E> value) completed,
    required TResult Function(Failed<T, E> value) failed,
    required TResult Function(Empty<T, E> value) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T, E> value)? idle,
    TResult? Function(Pending<T, E> value)? pending,
    TResult? Function(Completed<T, E> value)? completed,
    TResult? Function(Failed<T, E> value)? failed,
    TResult? Function(Empty<T, E> value)? empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T, E> value)? idle,
    TResult Function(Pending<T, E> value)? pending,
    TResult Function(Completed<T, E> value)? completed,
    TResult Function(Failed<T, E> value)? failed,
    TResult Function(Empty<T, E> value)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ViewStateCopyWith<T, E extends Exception, $Res> {
  factory $ViewStateCopyWith(
          ViewState<T, E> value, $Res Function(ViewState<T, E>) then) =
      _$ViewStateCopyWithImpl<T, E, $Res, ViewState<T, E>>;
}

/// @nodoc
class _$ViewStateCopyWithImpl<T, E extends Exception, $Res,
    $Val extends ViewState<T, E>> implements $ViewStateCopyWith<T, E, $Res> {
  _$ViewStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$IdleImplCopyWith<T, E extends Exception, $Res> {
  factory _$$IdleImplCopyWith(
          _$IdleImpl<T, E> value, $Res Function(_$IdleImpl<T, E>) then) =
      __$$IdleImplCopyWithImpl<T, E, $Res>;
}

/// @nodoc
class __$$IdleImplCopyWithImpl<T, E extends Exception, $Res>
    extends _$ViewStateCopyWithImpl<T, E, $Res, _$IdleImpl<T, E>>
    implements _$$IdleImplCopyWith<T, E, $Res> {
  __$$IdleImplCopyWithImpl(
      _$IdleImpl<T, E> _value, $Res Function(_$IdleImpl<T, E>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$IdleImpl<T, E extends Exception> extends Idle<T, E> {
  const _$IdleImpl() : super._();

  @override
  String toString() {
    return 'ViewState<$T, $E>.idle()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$IdleImpl<T, E>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() pending,
    required TResult Function(T data) completed,
    required TResult Function(E error, Color? textColor) failed,
    required TResult Function(Color? textColor) empty,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? pending,
    TResult? Function(T data)? completed,
    TResult? Function(E error, Color? textColor)? failed,
    TResult? Function(Color? textColor)? empty,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? pending,
    TResult Function(T data)? completed,
    TResult Function(E error, Color? textColor)? failed,
    TResult Function(Color? textColor)? empty,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T, E> value) idle,
    required TResult Function(Pending<T, E> value) pending,
    required TResult Function(Completed<T, E> value) completed,
    required TResult Function(Failed<T, E> value) failed,
    required TResult Function(Empty<T, E> value) empty,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T, E> value)? idle,
    TResult? Function(Pending<T, E> value)? pending,
    TResult? Function(Completed<T, E> value)? completed,
    TResult? Function(Failed<T, E> value)? failed,
    TResult? Function(Empty<T, E> value)? empty,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T, E> value)? idle,
    TResult Function(Pending<T, E> value)? pending,
    TResult Function(Completed<T, E> value)? completed,
    TResult Function(Failed<T, E> value)? failed,
    TResult Function(Empty<T, E> value)? empty,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class Idle<T, E extends Exception> extends ViewState<T, E> {
  const factory Idle() = _$IdleImpl<T, E>;
  const Idle._() : super._();
}

/// @nodoc
abstract class _$$PendingImplCopyWith<T, E extends Exception, $Res> {
  factory _$$PendingImplCopyWith(
          _$PendingImpl<T, E> value, $Res Function(_$PendingImpl<T, E>) then) =
      __$$PendingImplCopyWithImpl<T, E, $Res>;
}

/// @nodoc
class __$$PendingImplCopyWithImpl<T, E extends Exception, $Res>
    extends _$ViewStateCopyWithImpl<T, E, $Res, _$PendingImpl<T, E>>
    implements _$$PendingImplCopyWith<T, E, $Res> {
  __$$PendingImplCopyWithImpl(
      _$PendingImpl<T, E> _value, $Res Function(_$PendingImpl<T, E>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PendingImpl<T, E extends Exception> extends Pending<T, E> {
  const _$PendingImpl() : super._();

  @override
  String toString() {
    return 'ViewState<$T, $E>.pending()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PendingImpl<T, E>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() pending,
    required TResult Function(T data) completed,
    required TResult Function(E error, Color? textColor) failed,
    required TResult Function(Color? textColor) empty,
  }) {
    return pending();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? pending,
    TResult? Function(T data)? completed,
    TResult? Function(E error, Color? textColor)? failed,
    TResult? Function(Color? textColor)? empty,
  }) {
    return pending?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? pending,
    TResult Function(T data)? completed,
    TResult Function(E error, Color? textColor)? failed,
    TResult Function(Color? textColor)? empty,
    required TResult orElse(),
  }) {
    if (pending != null) {
      return pending();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T, E> value) idle,
    required TResult Function(Pending<T, E> value) pending,
    required TResult Function(Completed<T, E> value) completed,
    required TResult Function(Failed<T, E> value) failed,
    required TResult Function(Empty<T, E> value) empty,
  }) {
    return pending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T, E> value)? idle,
    TResult? Function(Pending<T, E> value)? pending,
    TResult? Function(Completed<T, E> value)? completed,
    TResult? Function(Failed<T, E> value)? failed,
    TResult? Function(Empty<T, E> value)? empty,
  }) {
    return pending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T, E> value)? idle,
    TResult Function(Pending<T, E> value)? pending,
    TResult Function(Completed<T, E> value)? completed,
    TResult Function(Failed<T, E> value)? failed,
    TResult Function(Empty<T, E> value)? empty,
    required TResult orElse(),
  }) {
    if (pending != null) {
      return pending(this);
    }
    return orElse();
  }
}

abstract class Pending<T, E extends Exception> extends ViewState<T, E> {
  const factory Pending() = _$PendingImpl<T, E>;
  const Pending._() : super._();
}

/// @nodoc
abstract class _$$CompletedImplCopyWith<T, E extends Exception, $Res> {
  factory _$$CompletedImplCopyWith(_$CompletedImpl<T, E> value,
          $Res Function(_$CompletedImpl<T, E>) then) =
      __$$CompletedImplCopyWithImpl<T, E, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$CompletedImplCopyWithImpl<T, E extends Exception, $Res>
    extends _$ViewStateCopyWithImpl<T, E, $Res, _$CompletedImpl<T, E>>
    implements _$$CompletedImplCopyWith<T, E, $Res> {
  __$$CompletedImplCopyWithImpl(
      _$CompletedImpl<T, E> _value, $Res Function(_$CompletedImpl<T, E>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$CompletedImpl<T, E>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$CompletedImpl<T, E extends Exception> extends Completed<T, E> {
  const _$CompletedImpl(this.data) : super._();

  @override
  final T data;

  @override
  String toString() {
    return 'ViewState<$T, $E>.completed(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompletedImpl<T, E> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CompletedImplCopyWith<T, E, _$CompletedImpl<T, E>> get copyWith =>
      __$$CompletedImplCopyWithImpl<T, E, _$CompletedImpl<T, E>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() pending,
    required TResult Function(T data) completed,
    required TResult Function(E error, Color? textColor) failed,
    required TResult Function(Color? textColor) empty,
  }) {
    return completed(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? pending,
    TResult? Function(T data)? completed,
    TResult? Function(E error, Color? textColor)? failed,
    TResult? Function(Color? textColor)? empty,
  }) {
    return completed?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? pending,
    TResult Function(T data)? completed,
    TResult Function(E error, Color? textColor)? failed,
    TResult Function(Color? textColor)? empty,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T, E> value) idle,
    required TResult Function(Pending<T, E> value) pending,
    required TResult Function(Completed<T, E> value) completed,
    required TResult Function(Failed<T, E> value) failed,
    required TResult Function(Empty<T, E> value) empty,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T, E> value)? idle,
    TResult? Function(Pending<T, E> value)? pending,
    TResult? Function(Completed<T, E> value)? completed,
    TResult? Function(Failed<T, E> value)? failed,
    TResult? Function(Empty<T, E> value)? empty,
  }) {
    return completed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T, E> value)? idle,
    TResult Function(Pending<T, E> value)? pending,
    TResult Function(Completed<T, E> value)? completed,
    TResult Function(Failed<T, E> value)? failed,
    TResult Function(Empty<T, E> value)? empty,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class Completed<T, E extends Exception> extends ViewState<T, E> {
  const factory Completed(final T data) = _$CompletedImpl<T, E>;
  const Completed._() : super._();

  T get data;
  @JsonKey(ignore: true)
  _$$CompletedImplCopyWith<T, E, _$CompletedImpl<T, E>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailedImplCopyWith<T, E extends Exception, $Res> {
  factory _$$FailedImplCopyWith(
          _$FailedImpl<T, E> value, $Res Function(_$FailedImpl<T, E>) then) =
      __$$FailedImplCopyWithImpl<T, E, $Res>;
  @useResult
  $Res call({E error, Color? textColor});
}

/// @nodoc
class __$$FailedImplCopyWithImpl<T, E extends Exception, $Res>
    extends _$ViewStateCopyWithImpl<T, E, $Res, _$FailedImpl<T, E>>
    implements _$$FailedImplCopyWith<T, E, $Res> {
  __$$FailedImplCopyWithImpl(
      _$FailedImpl<T, E> _value, $Res Function(_$FailedImpl<T, E>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? textColor = freezed,
  }) {
    return _then(_$FailedImpl<T, E>(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as E,
      textColor: freezed == textColor
          ? _value.textColor
          : textColor // ignore: cast_nullable_to_non_nullable
              as Color?,
    ));
  }
}

/// @nodoc

class _$FailedImpl<T, E extends Exception> extends Failed<T, E> {
  const _$FailedImpl(this.error, {this.textColor}) : super._();

  @override
  final E error;
  @override
  final Color? textColor;

  @override
  String toString() {
    return 'ViewState<$T, $E>.failed(error: $error, textColor: $textColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailedImpl<T, E> &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.textColor, textColor) ||
                other.textColor == textColor));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(error), textColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailedImplCopyWith<T, E, _$FailedImpl<T, E>> get copyWith =>
      __$$FailedImplCopyWithImpl<T, E, _$FailedImpl<T, E>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() pending,
    required TResult Function(T data) completed,
    required TResult Function(E error, Color? textColor) failed,
    required TResult Function(Color? textColor) empty,
  }) {
    return failed(error, textColor);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? pending,
    TResult? Function(T data)? completed,
    TResult? Function(E error, Color? textColor)? failed,
    TResult? Function(Color? textColor)? empty,
  }) {
    return failed?.call(error, textColor);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? pending,
    TResult Function(T data)? completed,
    TResult Function(E error, Color? textColor)? failed,
    TResult Function(Color? textColor)? empty,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(error, textColor);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T, E> value) idle,
    required TResult Function(Pending<T, E> value) pending,
    required TResult Function(Completed<T, E> value) completed,
    required TResult Function(Failed<T, E> value) failed,
    required TResult Function(Empty<T, E> value) empty,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T, E> value)? idle,
    TResult? Function(Pending<T, E> value)? pending,
    TResult? Function(Completed<T, E> value)? completed,
    TResult? Function(Failed<T, E> value)? failed,
    TResult? Function(Empty<T, E> value)? empty,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T, E> value)? idle,
    TResult Function(Pending<T, E> value)? pending,
    TResult Function(Completed<T, E> value)? completed,
    TResult Function(Failed<T, E> value)? failed,
    TResult Function(Empty<T, E> value)? empty,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class Failed<T, E extends Exception> extends ViewState<T, E> {
  const factory Failed(final E error, {final Color? textColor}) =
      _$FailedImpl<T, E>;
  const Failed._() : super._();

  E get error;
  Color? get textColor;
  @JsonKey(ignore: true)
  _$$FailedImplCopyWith<T, E, _$FailedImpl<T, E>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EmptyImplCopyWith<T, E extends Exception, $Res> {
  factory _$$EmptyImplCopyWith(
          _$EmptyImpl<T, E> value, $Res Function(_$EmptyImpl<T, E>) then) =
      __$$EmptyImplCopyWithImpl<T, E, $Res>;
  @useResult
  $Res call({Color? textColor});
}

/// @nodoc
class __$$EmptyImplCopyWithImpl<T, E extends Exception, $Res>
    extends _$ViewStateCopyWithImpl<T, E, $Res, _$EmptyImpl<T, E>>
    implements _$$EmptyImplCopyWith<T, E, $Res> {
  __$$EmptyImplCopyWithImpl(
      _$EmptyImpl<T, E> _value, $Res Function(_$EmptyImpl<T, E>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? textColor = freezed,
  }) {
    return _then(_$EmptyImpl<T, E>(
      textColor: freezed == textColor
          ? _value.textColor
          : textColor // ignore: cast_nullable_to_non_nullable
              as Color?,
    ));
  }
}

/// @nodoc

class _$EmptyImpl<T, E extends Exception> extends Empty<T, E> {
  const _$EmptyImpl({this.textColor}) : super._();

  @override
  final Color? textColor;

  @override
  String toString() {
    return 'ViewState<$T, $E>.empty(textColor: $textColor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmptyImpl<T, E> &&
            (identical(other.textColor, textColor) ||
                other.textColor == textColor));
  }

  @override
  int get hashCode => Object.hash(runtimeType, textColor);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EmptyImplCopyWith<T, E, _$EmptyImpl<T, E>> get copyWith =>
      __$$EmptyImplCopyWithImpl<T, E, _$EmptyImpl<T, E>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() pending,
    required TResult Function(T data) completed,
    required TResult Function(E error, Color? textColor) failed,
    required TResult Function(Color? textColor) empty,
  }) {
    return empty(textColor);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function()? pending,
    TResult? Function(T data)? completed,
    TResult? Function(E error, Color? textColor)? failed,
    TResult? Function(Color? textColor)? empty,
  }) {
    return empty?.call(textColor);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? pending,
    TResult Function(T data)? completed,
    TResult Function(E error, Color? textColor)? failed,
    TResult Function(Color? textColor)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(textColor);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Idle<T, E> value) idle,
    required TResult Function(Pending<T, E> value) pending,
    required TResult Function(Completed<T, E> value) completed,
    required TResult Function(Failed<T, E> value) failed,
    required TResult Function(Empty<T, E> value) empty,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Idle<T, E> value)? idle,
    TResult? Function(Pending<T, E> value)? pending,
    TResult? Function(Completed<T, E> value)? completed,
    TResult? Function(Failed<T, E> value)? failed,
    TResult? Function(Empty<T, E> value)? empty,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Idle<T, E> value)? idle,
    TResult Function(Pending<T, E> value)? pending,
    TResult Function(Completed<T, E> value)? completed,
    TResult Function(Failed<T, E> value)? failed,
    TResult Function(Empty<T, E> value)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class Empty<T, E extends Exception> extends ViewState<T, E> {
  const factory Empty({final Color? textColor}) = _$EmptyImpl<T, E>;
  const Empty._() : super._();

  Color? get textColor;
  @JsonKey(ignore: true)
  _$$EmptyImplCopyWith<T, E, _$EmptyImpl<T, E>> get copyWith =>
      throw _privateConstructorUsedError;
}
