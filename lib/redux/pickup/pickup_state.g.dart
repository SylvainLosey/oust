// GENERATED CODE - DO NOT MODIFY BY HAND

part of pickup_state;

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
    if (object.error != null) {
      result
        ..add('error')
        ..add(serializers.serialize(object.error,
            specifiedType: const FullType(String)));
    }
    if (object.pickups != null) {
      result
        ..add('pickups')
        ..add(serializers.serialize(object.pickups,
            specifiedType: const FullType(BuiltMap,
                const [const FullType(int), const FullType(Pickup)])));
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
        case 'error':
          result.error = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
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
      }
    }

    return result.build();
  }
}

class _$PickupState extends PickupState {
  @override
  final String error;
  @override
  final bool isLoading;
  @override
  final BuiltMap<int, Pickup> pickups;

  factory _$PickupState([void Function(PickupStateBuilder) updates]) =>
      (new PickupStateBuilder()..update(updates)).build();

  _$PickupState._({this.error, this.isLoading, this.pickups}) : super._() {
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('PickupState', 'isLoading');
    }
  }

  @override
  PickupState rebuild(void Function(PickupStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PickupStateBuilder toBuilder() => new PickupStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PickupState &&
        error == other.error &&
        isLoading == other.isLoading &&
        pickups == other.pickups;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, error.hashCode), isLoading.hashCode), pickups.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PickupState')
          ..add('error', error)
          ..add('isLoading', isLoading)
          ..add('pickups', pickups))
        .toString();
  }
}

class PickupStateBuilder implements Builder<PickupState, PickupStateBuilder> {
  _$PickupState _$v;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  MapBuilder<int, Pickup> _pickups;
  MapBuilder<int, Pickup> get pickups =>
      _$this._pickups ??= new MapBuilder<int, Pickup>();
  set pickups(MapBuilder<int, Pickup> pickups) => _$this._pickups = pickups;

  PickupStateBuilder();

  PickupStateBuilder get _$this {
    if (_$v != null) {
      _error = _$v.error;
      _isLoading = _$v.isLoading;
      _pickups = _$v.pickups?.toBuilder();
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
  void update(void Function(PickupStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PickupState build() {
    _$PickupState _$result;
    try {
      _$result = _$v ??
          new _$PickupState._(
              error: error, isLoading: isLoading, pickups: _pickups?.build());
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
