// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_sliver_app_bar_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppSliverAppBarState {
  bool get showLargeTitle => throw _privateConstructorUsedError;
  double get dividerOpacity => throw _privateConstructorUsedError;

  /// Create a copy of AppSliverAppBarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppSliverAppBarStateCopyWith<AppSliverAppBarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppSliverAppBarStateCopyWith<$Res> {
  factory $AppSliverAppBarStateCopyWith(AppSliverAppBarState value,
          $Res Function(AppSliverAppBarState) then) =
      _$AppSliverAppBarStateCopyWithImpl<$Res, AppSliverAppBarState>;
  @useResult
  $Res call({bool showLargeTitle, double dividerOpacity});
}

/// @nodoc
class _$AppSliverAppBarStateCopyWithImpl<$Res,
        $Val extends AppSliverAppBarState>
    implements $AppSliverAppBarStateCopyWith<$Res> {
  _$AppSliverAppBarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppSliverAppBarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showLargeTitle = null,
    Object? dividerOpacity = null,
  }) {
    return _then(_value.copyWith(
      showLargeTitle: null == showLargeTitle
          ? _value.showLargeTitle
          : showLargeTitle // ignore: cast_nullable_to_non_nullable
              as bool,
      dividerOpacity: null == dividerOpacity
          ? _value.dividerOpacity
          : dividerOpacity // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppSliverAppBarStateImplCopyWith<$Res>
    implements $AppSliverAppBarStateCopyWith<$Res> {
  factory _$$AppSliverAppBarStateImplCopyWith(_$AppSliverAppBarStateImpl value,
          $Res Function(_$AppSliverAppBarStateImpl) then) =
      __$$AppSliverAppBarStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool showLargeTitle, double dividerOpacity});
}

/// @nodoc
class __$$AppSliverAppBarStateImplCopyWithImpl<$Res>
    extends _$AppSliverAppBarStateCopyWithImpl<$Res, _$AppSliverAppBarStateImpl>
    implements _$$AppSliverAppBarStateImplCopyWith<$Res> {
  __$$AppSliverAppBarStateImplCopyWithImpl(_$AppSliverAppBarStateImpl _value,
      $Res Function(_$AppSliverAppBarStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppSliverAppBarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showLargeTitle = null,
    Object? dividerOpacity = null,
  }) {
    return _then(_$AppSliverAppBarStateImpl(
      showLargeTitle: null == showLargeTitle
          ? _value.showLargeTitle
          : showLargeTitle // ignore: cast_nullable_to_non_nullable
              as bool,
      dividerOpacity: null == dividerOpacity
          ? _value.dividerOpacity
          : dividerOpacity // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$AppSliverAppBarStateImpl implements _AppSliverAppBarState {
  _$AppSliverAppBarStateImpl(
      {this.showLargeTitle = true, this.dividerOpacity = 0});

  @override
  @JsonKey()
  final bool showLargeTitle;
  @override
  @JsonKey()
  final double dividerOpacity;

  @override
  String toString() {
    return 'AppSliverAppBarState(showLargeTitle: $showLargeTitle, dividerOpacity: $dividerOpacity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppSliverAppBarStateImpl &&
            (identical(other.showLargeTitle, showLargeTitle) ||
                other.showLargeTitle == showLargeTitle) &&
            (identical(other.dividerOpacity, dividerOpacity) ||
                other.dividerOpacity == dividerOpacity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, showLargeTitle, dividerOpacity);

  /// Create a copy of AppSliverAppBarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppSliverAppBarStateImplCopyWith<_$AppSliverAppBarStateImpl>
      get copyWith =>
          __$$AppSliverAppBarStateImplCopyWithImpl<_$AppSliverAppBarStateImpl>(
              this, _$identity);
}

abstract class _AppSliverAppBarState implements AppSliverAppBarState {
  factory _AppSliverAppBarState(
      {final bool showLargeTitle,
      final double dividerOpacity}) = _$AppSliverAppBarStateImpl;

  @override
  bool get showLargeTitle;
  @override
  double get dividerOpacity;

  /// Create a copy of AppSliverAppBarState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppSliverAppBarStateImplCopyWith<_$AppSliverAppBarStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
