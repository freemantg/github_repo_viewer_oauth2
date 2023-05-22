// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'repo_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RepoDetailEvent {
  String get fullRepoName => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String fullRepoName) getRepoDetail,
    required TResult Function(String fullRepoName) switchStarredStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String fullRepoName)? getRepoDetail,
    TResult? Function(String fullRepoName)? switchStarredStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String fullRepoName)? getRepoDetail,
    TResult Function(String fullRepoName)? switchStarredStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetRepoDetail value) getRepoDetail,
    required TResult Function(_SwitchStarredStatus value) switchStarredStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetRepoDetail value)? getRepoDetail,
    TResult? Function(_SwitchStarredStatus value)? switchStarredStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetRepoDetail value)? getRepoDetail,
    TResult Function(_SwitchStarredStatus value)? switchStarredStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RepoDetailEventCopyWith<RepoDetailEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepoDetailEventCopyWith<$Res> {
  factory $RepoDetailEventCopyWith(
          RepoDetailEvent value, $Res Function(RepoDetailEvent) then) =
      _$RepoDetailEventCopyWithImpl<$Res, RepoDetailEvent>;
  @useResult
  $Res call({String fullRepoName});
}

/// @nodoc
class _$RepoDetailEventCopyWithImpl<$Res, $Val extends RepoDetailEvent>
    implements $RepoDetailEventCopyWith<$Res> {
  _$RepoDetailEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullRepoName = null,
  }) {
    return _then(_value.copyWith(
      fullRepoName: null == fullRepoName
          ? _value.fullRepoName
          : fullRepoName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GetRepoDetailCopyWith<$Res>
    implements $RepoDetailEventCopyWith<$Res> {
  factory _$$_GetRepoDetailCopyWith(
          _$_GetRepoDetail value, $Res Function(_$_GetRepoDetail) then) =
      __$$_GetRepoDetailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String fullRepoName});
}

/// @nodoc
class __$$_GetRepoDetailCopyWithImpl<$Res>
    extends _$RepoDetailEventCopyWithImpl<$Res, _$_GetRepoDetail>
    implements _$$_GetRepoDetailCopyWith<$Res> {
  __$$_GetRepoDetailCopyWithImpl(
      _$_GetRepoDetail _value, $Res Function(_$_GetRepoDetail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullRepoName = null,
  }) {
    return _then(_$_GetRepoDetail(
      null == fullRepoName
          ? _value.fullRepoName
          : fullRepoName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_GetRepoDetail implements _GetRepoDetail {
  const _$_GetRepoDetail(this.fullRepoName);

  @override
  final String fullRepoName;

  @override
  String toString() {
    return 'RepoDetailEvent.getRepoDetail(fullRepoName: $fullRepoName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetRepoDetail &&
            (identical(other.fullRepoName, fullRepoName) ||
                other.fullRepoName == fullRepoName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fullRepoName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetRepoDetailCopyWith<_$_GetRepoDetail> get copyWith =>
      __$$_GetRepoDetailCopyWithImpl<_$_GetRepoDetail>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String fullRepoName) getRepoDetail,
    required TResult Function(String fullRepoName) switchStarredStatus,
  }) {
    return getRepoDetail(fullRepoName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String fullRepoName)? getRepoDetail,
    TResult? Function(String fullRepoName)? switchStarredStatus,
  }) {
    return getRepoDetail?.call(fullRepoName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String fullRepoName)? getRepoDetail,
    TResult Function(String fullRepoName)? switchStarredStatus,
    required TResult orElse(),
  }) {
    if (getRepoDetail != null) {
      return getRepoDetail(fullRepoName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetRepoDetail value) getRepoDetail,
    required TResult Function(_SwitchStarredStatus value) switchStarredStatus,
  }) {
    return getRepoDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetRepoDetail value)? getRepoDetail,
    TResult? Function(_SwitchStarredStatus value)? switchStarredStatus,
  }) {
    return getRepoDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetRepoDetail value)? getRepoDetail,
    TResult Function(_SwitchStarredStatus value)? switchStarredStatus,
    required TResult orElse(),
  }) {
    if (getRepoDetail != null) {
      return getRepoDetail(this);
    }
    return orElse();
  }
}

abstract class _GetRepoDetail implements RepoDetailEvent {
  const factory _GetRepoDetail(final String fullRepoName) = _$_GetRepoDetail;

  @override
  String get fullRepoName;
  @override
  @JsonKey(ignore: true)
  _$$_GetRepoDetailCopyWith<_$_GetRepoDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SwitchStarredStatusCopyWith<$Res>
    implements $RepoDetailEventCopyWith<$Res> {
  factory _$$_SwitchStarredStatusCopyWith(_$_SwitchStarredStatus value,
          $Res Function(_$_SwitchStarredStatus) then) =
      __$$_SwitchStarredStatusCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String fullRepoName});
}

/// @nodoc
class __$$_SwitchStarredStatusCopyWithImpl<$Res>
    extends _$RepoDetailEventCopyWithImpl<$Res, _$_SwitchStarredStatus>
    implements _$$_SwitchStarredStatusCopyWith<$Res> {
  __$$_SwitchStarredStatusCopyWithImpl(_$_SwitchStarredStatus _value,
      $Res Function(_$_SwitchStarredStatus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fullRepoName = null,
  }) {
    return _then(_$_SwitchStarredStatus(
      null == fullRepoName
          ? _value.fullRepoName
          : fullRepoName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SwitchStarredStatus implements _SwitchStarredStatus {
  const _$_SwitchStarredStatus(this.fullRepoName);

  @override
  final String fullRepoName;

  @override
  String toString() {
    return 'RepoDetailEvent.switchStarredStatus(fullRepoName: $fullRepoName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SwitchStarredStatus &&
            (identical(other.fullRepoName, fullRepoName) ||
                other.fullRepoName == fullRepoName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fullRepoName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SwitchStarredStatusCopyWith<_$_SwitchStarredStatus> get copyWith =>
      __$$_SwitchStarredStatusCopyWithImpl<_$_SwitchStarredStatus>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String fullRepoName) getRepoDetail,
    required TResult Function(String fullRepoName) switchStarredStatus,
  }) {
    return switchStarredStatus(fullRepoName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String fullRepoName)? getRepoDetail,
    TResult? Function(String fullRepoName)? switchStarredStatus,
  }) {
    return switchStarredStatus?.call(fullRepoName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String fullRepoName)? getRepoDetail,
    TResult Function(String fullRepoName)? switchStarredStatus,
    required TResult orElse(),
  }) {
    if (switchStarredStatus != null) {
      return switchStarredStatus(fullRepoName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetRepoDetail value) getRepoDetail,
    required TResult Function(_SwitchStarredStatus value) switchStarredStatus,
  }) {
    return switchStarredStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetRepoDetail value)? getRepoDetail,
    TResult? Function(_SwitchStarredStatus value)? switchStarredStatus,
  }) {
    return switchStarredStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetRepoDetail value)? getRepoDetail,
    TResult Function(_SwitchStarredStatus value)? switchStarredStatus,
    required TResult orElse(),
  }) {
    if (switchStarredStatus != null) {
      return switchStarredStatus(this);
    }
    return orElse();
  }
}

abstract class _SwitchStarredStatus implements RepoDetailEvent {
  const factory _SwitchStarredStatus(final String fullRepoName) =
      _$_SwitchStarredStatus;

  @override
  String get fullRepoName;
  @override
  @JsonKey(ignore: true)
  _$$_SwitchStarredStatusCopyWith<_$_SwitchStarredStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RepoDetailState {
  bool get hasStarredStatusChanged => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool hasStarredStatusChanged) initial,
    required TResult Function(bool hasStarredStatusChanged) loadInProgress,
    required TResult Function(
            Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatusChanged)
        loadSuccess,
    required TResult Function(
            GithubFailure failure, bool hasStarredStatusChanged)
        loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool hasStarredStatusChanged)? initial,
    TResult? Function(bool hasStarredStatusChanged)? loadInProgress,
    TResult? Function(
            Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatusChanged)?
        loadSuccess,
    TResult? Function(GithubFailure failure, bool hasStarredStatusChanged)?
        loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool hasStarredStatusChanged)? initial,
    TResult Function(bool hasStarredStatusChanged)? loadInProgress,
    TResult Function(
            Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatusChanged)?
        loadSuccess,
    TResult Function(GithubFailure failure, bool hasStarredStatusChanged)?
        loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_Failure value) loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_Failure value)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_Failure value)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RepoDetailStateCopyWith<RepoDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepoDetailStateCopyWith<$Res> {
  factory $RepoDetailStateCopyWith(
          RepoDetailState value, $Res Function(RepoDetailState) then) =
      _$RepoDetailStateCopyWithImpl<$Res, RepoDetailState>;
  @useResult
  $Res call({bool hasStarredStatusChanged});
}

/// @nodoc
class _$RepoDetailStateCopyWithImpl<$Res, $Val extends RepoDetailState>
    implements $RepoDetailStateCopyWith<$Res> {
  _$RepoDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasStarredStatusChanged = null,
  }) {
    return _then(_value.copyWith(
      hasStarredStatusChanged: null == hasStarredStatusChanged
          ? _value.hasStarredStatusChanged
          : hasStarredStatusChanged // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $RepoDetailStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool hasStarredStatusChanged});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$RepoDetailStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasStarredStatusChanged = null,
  }) {
    return _then(_$_Initial(
      hasStarredStatusChanged: null == hasStarredStatusChanged
          ? _value.hasStarredStatusChanged
          : hasStarredStatusChanged // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial({this.hasStarredStatusChanged = false});

  @override
  @JsonKey()
  final bool hasStarredStatusChanged;

  @override
  String toString() {
    return 'RepoDetailState.initial(hasStarredStatusChanged: $hasStarredStatusChanged)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            (identical(
                    other.hasStarredStatusChanged, hasStarredStatusChanged) ||
                other.hasStarredStatusChanged == hasStarredStatusChanged));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hasStarredStatusChanged);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool hasStarredStatusChanged) initial,
    required TResult Function(bool hasStarredStatusChanged) loadInProgress,
    required TResult Function(
            Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatusChanged)
        loadSuccess,
    required TResult Function(
            GithubFailure failure, bool hasStarredStatusChanged)
        loadFailure,
  }) {
    return initial(hasStarredStatusChanged);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool hasStarredStatusChanged)? initial,
    TResult? Function(bool hasStarredStatusChanged)? loadInProgress,
    TResult? Function(
            Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatusChanged)?
        loadSuccess,
    TResult? Function(GithubFailure failure, bool hasStarredStatusChanged)?
        loadFailure,
  }) {
    return initial?.call(hasStarredStatusChanged);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool hasStarredStatusChanged)? initial,
    TResult Function(bool hasStarredStatusChanged)? loadInProgress,
    TResult Function(
            Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatusChanged)?
        loadSuccess,
    TResult Function(GithubFailure failure, bool hasStarredStatusChanged)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(hasStarredStatusChanged);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_Failure value) loadFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_Failure value)? loadFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_Failure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements RepoDetailState {
  const factory _Initial({final bool hasStarredStatusChanged}) = _$_Initial;

  @override
  bool get hasStarredStatusChanged;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadInProgressCopyWith<$Res>
    implements $RepoDetailStateCopyWith<$Res> {
  factory _$$_LoadInProgressCopyWith(
          _$_LoadInProgress value, $Res Function(_$_LoadInProgress) then) =
      __$$_LoadInProgressCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool hasStarredStatusChanged});
}

/// @nodoc
class __$$_LoadInProgressCopyWithImpl<$Res>
    extends _$RepoDetailStateCopyWithImpl<$Res, _$_LoadInProgress>
    implements _$$_LoadInProgressCopyWith<$Res> {
  __$$_LoadInProgressCopyWithImpl(
      _$_LoadInProgress _value, $Res Function(_$_LoadInProgress) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasStarredStatusChanged = null,
  }) {
    return _then(_$_LoadInProgress(
      hasStarredStatusChanged: null == hasStarredStatusChanged
          ? _value.hasStarredStatusChanged
          : hasStarredStatusChanged // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_LoadInProgress implements _LoadInProgress {
  const _$_LoadInProgress({this.hasStarredStatusChanged = false});

  @override
  @JsonKey()
  final bool hasStarredStatusChanged;

  @override
  String toString() {
    return 'RepoDetailState.loadInProgress(hasStarredStatusChanged: $hasStarredStatusChanged)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadInProgress &&
            (identical(
                    other.hasStarredStatusChanged, hasStarredStatusChanged) ||
                other.hasStarredStatusChanged == hasStarredStatusChanged));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hasStarredStatusChanged);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadInProgressCopyWith<_$_LoadInProgress> get copyWith =>
      __$$_LoadInProgressCopyWithImpl<_$_LoadInProgress>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool hasStarredStatusChanged) initial,
    required TResult Function(bool hasStarredStatusChanged) loadInProgress,
    required TResult Function(
            Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatusChanged)
        loadSuccess,
    required TResult Function(
            GithubFailure failure, bool hasStarredStatusChanged)
        loadFailure,
  }) {
    return loadInProgress(hasStarredStatusChanged);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool hasStarredStatusChanged)? initial,
    TResult? Function(bool hasStarredStatusChanged)? loadInProgress,
    TResult? Function(
            Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatusChanged)?
        loadSuccess,
    TResult? Function(GithubFailure failure, bool hasStarredStatusChanged)?
        loadFailure,
  }) {
    return loadInProgress?.call(hasStarredStatusChanged);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool hasStarredStatusChanged)? initial,
    TResult Function(bool hasStarredStatusChanged)? loadInProgress,
    TResult Function(
            Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatusChanged)?
        loadSuccess,
    TResult Function(GithubFailure failure, bool hasStarredStatusChanged)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(hasStarredStatusChanged);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_Failure value) loadFailure,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_Failure value)? loadFailure,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_Failure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class _LoadInProgress implements RepoDetailState {
  const factory _LoadInProgress({final bool hasStarredStatusChanged}) =
      _$_LoadInProgress;

  @override
  bool get hasStarredStatusChanged;
  @override
  @JsonKey(ignore: true)
  _$$_LoadInProgressCopyWith<_$_LoadInProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadSuccessCopyWith<$Res>
    implements $RepoDetailStateCopyWith<$Res> {
  factory _$$_LoadSuccessCopyWith(
          _$_LoadSuccess value, $Res Function(_$_LoadSuccess) then) =
      __$$_LoadSuccessCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatusChanged});

  $FreshCopyWith<GithubRepoDetail?, $Res> get repoDetail;
}

/// @nodoc
class __$$_LoadSuccessCopyWithImpl<$Res>
    extends _$RepoDetailStateCopyWithImpl<$Res, _$_LoadSuccess>
    implements _$$_LoadSuccessCopyWith<$Res> {
  __$$_LoadSuccessCopyWithImpl(
      _$_LoadSuccess _value, $Res Function(_$_LoadSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repoDetail = null,
    Object? hasStarredStatusChanged = null,
  }) {
    return _then(_$_LoadSuccess(
      null == repoDetail
          ? _value.repoDetail
          : repoDetail // ignore: cast_nullable_to_non_nullable
              as Fresh<GithubRepoDetail?>,
      hasStarredStatusChanged: null == hasStarredStatusChanged
          ? _value.hasStarredStatusChanged
          : hasStarredStatusChanged // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $FreshCopyWith<GithubRepoDetail?, $Res> get repoDetail {
    return $FreshCopyWith<GithubRepoDetail?, $Res>(_value.repoDetail, (value) {
      return _then(_value.copyWith(repoDetail: value));
    });
  }
}

/// @nodoc

class _$_LoadSuccess implements _LoadSuccess {
  const _$_LoadSuccess(this.repoDetail, {this.hasStarredStatusChanged = false});

  @override
  final Fresh<GithubRepoDetail?> repoDetail;
  @override
  @JsonKey()
  final bool hasStarredStatusChanged;

  @override
  String toString() {
    return 'RepoDetailState.loadSuccess(repoDetail: $repoDetail, hasStarredStatusChanged: $hasStarredStatusChanged)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadSuccess &&
            (identical(other.repoDetail, repoDetail) ||
                other.repoDetail == repoDetail) &&
            (identical(
                    other.hasStarredStatusChanged, hasStarredStatusChanged) ||
                other.hasStarredStatusChanged == hasStarredStatusChanged));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, repoDetail, hasStarredStatusChanged);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadSuccessCopyWith<_$_LoadSuccess> get copyWith =>
      __$$_LoadSuccessCopyWithImpl<_$_LoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool hasStarredStatusChanged) initial,
    required TResult Function(bool hasStarredStatusChanged) loadInProgress,
    required TResult Function(
            Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatusChanged)
        loadSuccess,
    required TResult Function(
            GithubFailure failure, bool hasStarredStatusChanged)
        loadFailure,
  }) {
    return loadSuccess(repoDetail, hasStarredStatusChanged);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool hasStarredStatusChanged)? initial,
    TResult? Function(bool hasStarredStatusChanged)? loadInProgress,
    TResult? Function(
            Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatusChanged)?
        loadSuccess,
    TResult? Function(GithubFailure failure, bool hasStarredStatusChanged)?
        loadFailure,
  }) {
    return loadSuccess?.call(repoDetail, hasStarredStatusChanged);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool hasStarredStatusChanged)? initial,
    TResult Function(bool hasStarredStatusChanged)? loadInProgress,
    TResult Function(
            Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatusChanged)?
        loadSuccess,
    TResult Function(GithubFailure failure, bool hasStarredStatusChanged)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(repoDetail, hasStarredStatusChanged);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_Failure value) loadFailure,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_Failure value)? loadFailure,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_Failure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadSuccess implements RepoDetailState {
  const factory _LoadSuccess(final Fresh<GithubRepoDetail?> repoDetail,
      {final bool hasStarredStatusChanged}) = _$_LoadSuccess;

  Fresh<GithubRepoDetail?> get repoDetail;
  @override
  bool get hasStarredStatusChanged;
  @override
  @JsonKey(ignore: true)
  _$$_LoadSuccessCopyWith<_$_LoadSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FailureCopyWith<$Res>
    implements $RepoDetailStateCopyWith<$Res> {
  factory _$$_FailureCopyWith(
          _$_Failure value, $Res Function(_$_Failure) then) =
      __$$_FailureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GithubFailure failure, bool hasStarredStatusChanged});

  $GithubFailureCopyWith<$Res> get failure;
}

/// @nodoc
class __$$_FailureCopyWithImpl<$Res>
    extends _$RepoDetailStateCopyWithImpl<$Res, _$_Failure>
    implements _$$_FailureCopyWith<$Res> {
  __$$_FailureCopyWithImpl(_$_Failure _value, $Res Function(_$_Failure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failure = null,
    Object? hasStarredStatusChanged = null,
  }) {
    return _then(_$_Failure(
      null == failure
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as GithubFailure,
      hasStarredStatusChanged: null == hasStarredStatusChanged
          ? _value.hasStarredStatusChanged
          : hasStarredStatusChanged // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $GithubFailureCopyWith<$Res> get failure {
    return $GithubFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc

class _$_Failure implements _Failure {
  const _$_Failure(this.failure, {this.hasStarredStatusChanged = false});

  @override
  final GithubFailure failure;
  @override
  @JsonKey()
  final bool hasStarredStatusChanged;

  @override
  String toString() {
    return 'RepoDetailState.loadFailure(failure: $failure, hasStarredStatusChanged: $hasStarredStatusChanged)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Failure &&
            (identical(other.failure, failure) || other.failure == failure) &&
            (identical(
                    other.hasStarredStatusChanged, hasStarredStatusChanged) ||
                other.hasStarredStatusChanged == hasStarredStatusChanged));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, failure, hasStarredStatusChanged);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FailureCopyWith<_$_Failure> get copyWith =>
      __$$_FailureCopyWithImpl<_$_Failure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool hasStarredStatusChanged) initial,
    required TResult Function(bool hasStarredStatusChanged) loadInProgress,
    required TResult Function(
            Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatusChanged)
        loadSuccess,
    required TResult Function(
            GithubFailure failure, bool hasStarredStatusChanged)
        loadFailure,
  }) {
    return loadFailure(failure, hasStarredStatusChanged);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool hasStarredStatusChanged)? initial,
    TResult? Function(bool hasStarredStatusChanged)? loadInProgress,
    TResult? Function(
            Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatusChanged)?
        loadSuccess,
    TResult? Function(GithubFailure failure, bool hasStarredStatusChanged)?
        loadFailure,
  }) {
    return loadFailure?.call(failure, hasStarredStatusChanged);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool hasStarredStatusChanged)? initial,
    TResult Function(bool hasStarredStatusChanged)? loadInProgress,
    TResult Function(
            Fresh<GithubRepoDetail?> repoDetail, bool hasStarredStatusChanged)?
        loadSuccess,
    TResult Function(GithubFailure failure, bool hasStarredStatusChanged)?
        loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(failure, hasStarredStatusChanged);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_LoadInProgress value) loadInProgress,
    required TResult Function(_LoadSuccess value) loadSuccess,
    required TResult Function(_Failure value) loadFailure,
  }) {
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_LoadInProgress value)? loadInProgress,
    TResult? Function(_LoadSuccess value)? loadSuccess,
    TResult? Function(_Failure value)? loadFailure,
  }) {
    return loadFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_LoadInProgress value)? loadInProgress,
    TResult Function(_LoadSuccess value)? loadSuccess,
    TResult Function(_Failure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements RepoDetailState {
  const factory _Failure(final GithubFailure failure,
      {final bool hasStarredStatusChanged}) = _$_Failure;

  GithubFailure get failure;
  @override
  bool get hasStarredStatusChanged;
  @override
  @JsonKey(ignore: true)
  _$$_FailureCopyWith<_$_Failure> get copyWith =>
      throw _privateConstructorUsedError;
}
