// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'link_tile_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LinkTileState {
  Link get link => throw _privateConstructorUsedError;
  Map<String, String> get params => throw _privateConstructorUsedError;

  /// Create a copy of LinkTileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LinkTileStateCopyWith<LinkTileState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LinkTileStateCopyWith<$Res> {
  factory $LinkTileStateCopyWith(
          LinkTileState value, $Res Function(LinkTileState) then) =
      _$LinkTileStateCopyWithImpl<$Res, LinkTileState>;
  @useResult
  $Res call({Link link, Map<String, String> params});

  $LinkCopyWith<$Res> get link;
}

/// @nodoc
class _$LinkTileStateCopyWithImpl<$Res, $Val extends LinkTileState>
    implements $LinkTileStateCopyWith<$Res> {
  _$LinkTileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LinkTileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? link = null,
    Object? params = null,
  }) {
    return _then(_value.copyWith(
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as Link,
      params: null == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ) as $Val);
  }

  /// Create a copy of LinkTileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LinkCopyWith<$Res> get link {
    return $LinkCopyWith<$Res>(_value.link, (value) {
      return _then(_value.copyWith(link: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LinkTileStateImplCopyWith<$Res>
    implements $LinkTileStateCopyWith<$Res> {
  factory _$$LinkTileStateImplCopyWith(
          _$LinkTileStateImpl value, $Res Function(_$LinkTileStateImpl) then) =
      __$$LinkTileStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Link link, Map<String, String> params});

  @override
  $LinkCopyWith<$Res> get link;
}

/// @nodoc
class __$$LinkTileStateImplCopyWithImpl<$Res>
    extends _$LinkTileStateCopyWithImpl<$Res, _$LinkTileStateImpl>
    implements _$$LinkTileStateImplCopyWith<$Res> {
  __$$LinkTileStateImplCopyWithImpl(
      _$LinkTileStateImpl _value, $Res Function(_$LinkTileStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of LinkTileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? link = null,
    Object? params = null,
  }) {
    return _then(_$LinkTileStateImpl(
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as Link,
      params: null == params
          ? _value._params
          : params // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc

class _$LinkTileStateImpl extends _LinkTileState {
  const _$LinkTileStateImpl(
      {required this.link, required final Map<String, String> params})
      : _params = params,
        super._();

  @override
  final Link link;
  final Map<String, String> _params;
  @override
  Map<String, String> get params {
    if (_params is EqualUnmodifiableMapView) return _params;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_params);
  }

  @override
  String toString() {
    return 'LinkTileState(link: $link, params: $params)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LinkTileStateImpl &&
            (identical(other.link, link) || other.link == link) &&
            const DeepCollectionEquality().equals(other._params, _params));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, link, const DeepCollectionEquality().hash(_params));

  /// Create a copy of LinkTileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LinkTileStateImplCopyWith<_$LinkTileStateImpl> get copyWith =>
      __$$LinkTileStateImplCopyWithImpl<_$LinkTileStateImpl>(this, _$identity);
}

abstract class _LinkTileState extends LinkTileState {
  const factory _LinkTileState(
      {required final Link link,
      required final Map<String, String> params}) = _$LinkTileStateImpl;
  const _LinkTileState._() : super._();

  @override
  Link get link;
  @override
  Map<String, String> get params;

  /// Create a copy of LinkTileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LinkTileStateImplCopyWith<_$LinkTileStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
