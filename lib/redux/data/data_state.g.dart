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
      'fetchCount',
      serializers.serialize(object.fetchCount,
          specifiedType: const FullType(int)),
    ];
    if (object.error != null) {
      result
        ..add('error')
        ..add(serializers.serialize(object.error,
            specifiedType: const FullType(String)));
    }
    if (object.packages != null) {
      result
        ..add('packages')
        ..add(serializers.serialize(object.packages,
            specifiedType: const FullType(BuiltMap,
                const [const FullType(int), const FullType(Package)])));
    }
    if (object.postcodes != null) {
      result
        ..add('postcodes')
        ..add(serializers.serialize(object.postcodes,
            specifiedType: const FullType(BuiltMap,
                const [const FullType(int), const FullType(Postcode)])));
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
        case 'error':
          result.error = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'fetchCount':
          result.fetchCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'packages':
          result.packages.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(int),
                const FullType(Package)
              ])) as BuiltMap);
          break;
        case 'postcodes':
          result.postcodes.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(int),
                const FullType(Postcode)
              ])) as BuiltMap);
          break;
      }
    }

    return result.build();
  }
}

class _$DataState extends DataState {
  @override
  final String error;
  @override
  final int fetchCount;
  @override
  final BuiltMap<int, Package> packages;
  @override
  final BuiltMap<int, Postcode> postcodes;

  factory _$DataState([void Function(DataStateBuilder) updates]) =>
      (new DataStateBuilder()..update(updates)).build();

  _$DataState._({this.error, this.fetchCount, this.packages, this.postcodes})
      : super._() {
    if (fetchCount == null) {
      throw new BuiltValueNullFieldError('DataState', 'fetchCount');
    }
  }

  @override
  DataState rebuild(void Function(DataStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DataStateBuilder toBuilder() => new DataStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DataState &&
        error == other.error &&
        fetchCount == other.fetchCount &&
        packages == other.packages &&
        postcodes == other.postcodes;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, error.hashCode), fetchCount.hashCode),
            packages.hashCode),
        postcodes.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DataState')
          ..add('error', error)
          ..add('fetchCount', fetchCount)
          ..add('packages', packages)
          ..add('postcodes', postcodes))
        .toString();
  }
}

class DataStateBuilder implements Builder<DataState, DataStateBuilder> {
  _$DataState _$v;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  int _fetchCount;
  int get fetchCount => _$this._fetchCount;
  set fetchCount(int fetchCount) => _$this._fetchCount = fetchCount;

  MapBuilder<int, Package> _packages;
  MapBuilder<int, Package> get packages =>
      _$this._packages ??= new MapBuilder<int, Package>();
  set packages(MapBuilder<int, Package> packages) =>
      _$this._packages = packages;

  MapBuilder<int, Postcode> _postcodes;
  MapBuilder<int, Postcode> get postcodes =>
      _$this._postcodes ??= new MapBuilder<int, Postcode>();
  set postcodes(MapBuilder<int, Postcode> postcodes) =>
      _$this._postcodes = postcodes;

  DataStateBuilder();

  DataStateBuilder get _$this {
    if (_$v != null) {
      _error = _$v.error;
      _fetchCount = _$v.fetchCount;
      _packages = _$v.packages?.toBuilder();
      _postcodes = _$v.postcodes?.toBuilder();
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
  void update(void Function(DataStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DataState build() {
    _$DataState _$result;
    try {
      _$result = _$v ??
          new _$DataState._(
              error: error,
              fetchCount: fetchCount,
              packages: _packages?.build(),
              postcodes: _postcodes?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'packages';
        _packages?.build();
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
