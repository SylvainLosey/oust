// GENERATED CODE - DO NOT MODIFY BY HAND

part of PickupState;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PickupState> _$pickupStateSerializer = new _$PickupStateSerializer();

class _$PickupStateSerializer implements StructuredSerializer<PickupState> {
  @override
  final Iterable<Type> types = const [PickupState, _$PickupState];
  @override
  final String wireName = 'PickupState';

  @override
  Iterable serialize(Serializers serializers, PickupState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'isLoading',
      serializers.serialize(object.isLoading,
          specifiedType: const FullType(bool)),
    ];
    if (object.pickups != null) {
      result
        ..add('pickups')
        ..add(serializers.serialize(object.pickups,
            specifiedType: const FullType(BuiltMap,
                const [const FullType(int), const FullType(Pickup)])));
    }
    if (object.error != null) {
      result
        ..add('error')
        ..add(serializers.serialize(object.error,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  PickupState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PickupStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'isLoading':
          result.isLoading = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'pickups':
          result.pickups.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(int),
                const FullType(Pickup)
              ])) as BuiltMap);
          break;
        case 'error':
          result.error = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$PickupState extends PickupState {
  @override
  final bool isLoading;
  @override
  final BuiltMap<int, Pickup> pickups;
  @override
  final String error;

  factory _$PickupState([void updates(PickupStateBuilder b)]) =>
      (new PickupStateBuilder()..update(updates)).build();

  _$PickupState._({this.isLoading, this.pickups, this.error}) : super._() {
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('PickupState', 'isLoading');
    }
  }

  @override
  PickupState rebuild(void updates(PickupStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  PickupStateBuilder toBuilder() => new PickupStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PickupState &&
        isLoading == other.isLoading &&
        pickups == other.pickups &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, isLoading.hashCode), pickups.hashCode), error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PickupState')
          ..add('isLoading', isLoading)
          ..add('pickups', pickups)
          ..add('error', error))
        .toString();
  }
}

class PickupStateBuilder implements Builder<PickupState, PickupStateBuilder> {
  _$PickupState _$v;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  MapBuilder<int, Pickup> _pickups;
  MapBuilder<int, Pickup> get pickups =>
      _$this._pickups ??= new MapBuilder<int, Pickup>();
  set pickups(MapBuilder<int, Pickup> pickups) => _$this._pickups = pickups;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  PickupStateBuilder();

  PickupStateBuilder get _$this {
    if (_$v != null) {
      _isLoading = _$v.isLoading;
      _pickups = _$v.pickups?.toBuilder();
      _error = _$v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PickupState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PickupState;
  }

  @override
  void update(void updates(PickupStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$PickupState build() {
    _$PickupState _$result;
    try {
      _$result = _$v ??
          new _$PickupState._(
              isLoading: isLoading, pickups: _pickups?.build(), error: error);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'pickups';
        _pickups?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PickupState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
