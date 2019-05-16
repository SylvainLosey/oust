// GENERATED CODE - DO NOT MODIFY BY HAND

part of lift_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LiftState> _$liftStateSerializer = new _$LiftStateSerializer();

class _$LiftStateSerializer implements StructuredSerializer<LiftState> {
  @override
  final Iterable<Type> types = const [LiftState, _$LiftState];
  @override
  final String wireName = 'LiftState';

  @override
  Iterable serialize(Serializers serializers, LiftState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.fetchCount != null) {
      result
        ..add('fetchCount')
        ..add(serializers.serialize(object.fetchCount,
            specifiedType: const FullType(int)));
    }
    if (object.error != null) {
      result
        ..add('error')
        ..add(serializers.serialize(object.error,
            specifiedType: const FullType(String)));
    }
    if (object.liftQuoteFormState != null) {
      result
        ..add('liftQuoteFormState')
        ..add(serializers.serialize(object.liftQuoteFormState,
            specifiedType: const FullType(LiftQuoteFormState)));
    }

    return result;
  }

  @override
  LiftState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LiftStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'fetchCount':
          result.fetchCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'error':
          result.error = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'liftQuoteFormState':
          result.liftQuoteFormState.replace(serializers.deserialize(value,
                  specifiedType: const FullType(LiftQuoteFormState))
              as LiftQuoteFormState);
          break;
      }
    }

    return result.build();
  }
}

class _$LiftState extends LiftState {
  @override
  final int fetchCount;
  @override
  final String error;
  @override
  final LiftQuoteFormState liftQuoteFormState;

  factory _$LiftState([void Function(LiftStateBuilder) updates]) =>
      (new LiftStateBuilder()..update(updates)).build();

  _$LiftState._({this.fetchCount, this.error, this.liftQuoteFormState})
      : super._();

  @override
  LiftState rebuild(void Function(LiftStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LiftStateBuilder toBuilder() => new LiftStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LiftState &&
        fetchCount == other.fetchCount &&
        error == other.error &&
        liftQuoteFormState == other.liftQuoteFormState;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, fetchCount.hashCode), error.hashCode),
        liftQuoteFormState.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LiftState')
          ..add('fetchCount', fetchCount)
          ..add('error', error)
          ..add('liftQuoteFormState', liftQuoteFormState))
        .toString();
  }
}

class LiftStateBuilder implements Builder<LiftState, LiftStateBuilder> {
  _$LiftState _$v;

  int _fetchCount;
  int get fetchCount => _$this._fetchCount;
  set fetchCount(int fetchCount) => _$this._fetchCount = fetchCount;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  LiftQuoteFormStateBuilder _liftQuoteFormState;
  LiftQuoteFormStateBuilder get liftQuoteFormState =>
      _$this._liftQuoteFormState ??= new LiftQuoteFormStateBuilder();
  set liftQuoteFormState(LiftQuoteFormStateBuilder liftQuoteFormState) =>
      _$this._liftQuoteFormState = liftQuoteFormState;

  LiftStateBuilder();

  LiftStateBuilder get _$this {
    if (_$v != null) {
      _fetchCount = _$v.fetchCount;
      _error = _$v.error;
      _liftQuoteFormState = _$v.liftQuoteFormState?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LiftState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LiftState;
  }

  @override
  void update(void Function(LiftStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LiftState build() {
    _$LiftState _$result;
    try {
      _$result = _$v ??
          new _$LiftState._(
              fetchCount: fetchCount,
              error: error,
              liftQuoteFormState: _liftQuoteFormState?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'liftQuoteFormState';
        _liftQuoteFormState?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'LiftState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
