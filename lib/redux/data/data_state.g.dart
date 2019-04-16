// GENERATED CODE - DO NOT MODIFY BY HAND

part of data_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DataState> _$dataStateSerializer = new _$DataStateSerializer();

class _$DataStateSerializer implements StructuredSerializer<DataState> {
  @override
  final Iterable<Type> types = const [DataState, _$DataState];
  @override
  final String wireName = 'DataState';

  @override
  Iterable serialize(Serializers serializers, DataState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'isLoading',
      serializers.serialize(object.isLoading,
          specifiedType: const FullType(bool)),
    ];
    if (object.postcodes != null) {
      result
        ..add('postcodes')
        ..add(serializers.serialize(object.postcodes,
            specifiedType: const FullType(BuiltMap,
                const [const FullType(int), const FullType(Postcode)])));
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
  DataState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DataStateBuilder();

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
        case 'postcodes':
          result.postcodes.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(int),
                const FullType(Postcode)
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

class _$DataState extends DataState {
  @override
  final bool isLoading;
  @override
  final BuiltMap<int, Postcode> postcodes;
  @override
  final String error;

  factory _$DataState([void updates(DataStateBuilder b)]) =>
      (new DataStateBuilder()..update(updates)).build();

  _$DataState._({this.isLoading, this.postcodes, this.error}) : super._() {
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('DataState', 'isLoading');
    }
  }

  @override
  DataState rebuild(void updates(DataStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  DataStateBuilder toBuilder() => new DataStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DataState &&
        isLoading == other.isLoading &&
        postcodes == other.postcodes &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, isLoading.hashCode), postcodes.hashCode), error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DataState')
          ..add('isLoading', isLoading)
          ..add('postcodes', postcodes)
          ..add('error', error))
        .toString();
  }
}

class DataStateBuilder implements Builder<DataState, DataStateBuilder> {
  _$DataState _$v;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  MapBuilder<int, Postcode> _postcodes;
  MapBuilder<int, Postcode> get postcodes =>
      _$this._postcodes ??= new MapBuilder<int, Postcode>();
  set postcodes(MapBuilder<int, Postcode> postcodes) =>
      _$this._postcodes = postcodes;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  DataStateBuilder();

  DataStateBuilder get _$this {
    if (_$v != null) {
      _isLoading = _$v.isLoading;
      _postcodes = _$v.postcodes?.toBuilder();
      _error = _$v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DataState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DataState;
  }

  @override
  void update(void updates(DataStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$DataState build() {
    _$DataState _$result;
    try {
      _$result = _$v ??
          new _$DataState._(
              isLoading: isLoading,
              postcodes: _postcodes?.build(),
              error: error);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'postcodes';
        _postcodes?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'DataState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
