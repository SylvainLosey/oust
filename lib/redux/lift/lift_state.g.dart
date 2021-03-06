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
    if (object.selectedId != null) {
      result
        ..add('selectedId')
        ..add(serializers.serialize(object.selectedId,
            specifiedType: const FullType(int)));
    }
    if (object.lifts != null) {
      result
        ..add('lifts')
        ..add(serializers.serialize(object.lifts,
            specifiedType: const FullType(
                BuiltMap, const [const FullType(int), const FullType(Lift)])));
    }
    if (object.liftImages != null) {
      result
        ..add('liftImages')
        ..add(serializers.serialize(object.liftImages,
            specifiedType: const FullType(BuiltMap,
                const [const FullType(int), const FullType(LiftImage)])));
    }
    if (object.liftEvents != null) {
      result
        ..add('liftEvents')
        ..add(serializers.serialize(object.liftEvents,
            specifiedType: const FullType(BuiltMap,
                const [const FullType(int), const FullType(LiftEvent)])));
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
        case 'selectedId':
          result.selectedId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'lifts':
          result.lifts.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(int),
                const FullType(Lift)
              ])) as BuiltMap);
          break;
        case 'liftImages':
          result.liftImages.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(int),
                const FullType(LiftImage)
              ])) as BuiltMap);
          break;
        case 'liftEvents':
          result.liftEvents.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(int),
                const FullType(LiftEvent)
              ])) as BuiltMap);
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
  final int selectedId;
  @override
  final BuiltMap<int, Lift> lifts;
  @override
  final BuiltMap<int, LiftImage> liftImages;
  @override
  final BuiltMap<int, LiftEvent> liftEvents;

  factory _$LiftState([void Function(LiftStateBuilder) updates]) =>
      (new LiftStateBuilder()..update(updates)).build();

  _$LiftState._(
      {this.fetchCount,
      this.error,
      this.selectedId,
      this.lifts,
      this.liftImages,
      this.liftEvents})
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
        selectedId == other.selectedId &&
        lifts == other.lifts &&
        liftImages == other.liftImages &&
        liftEvents == other.liftEvents;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, fetchCount.hashCode), error.hashCode),
                    selectedId.hashCode),
                lifts.hashCode),
            liftImages.hashCode),
        liftEvents.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LiftState')
          ..add('fetchCount', fetchCount)
          ..add('error', error)
          ..add('selectedId', selectedId)
          ..add('lifts', lifts)
          ..add('liftImages', liftImages)
          ..add('liftEvents', liftEvents))
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

  int _selectedId;
  int get selectedId => _$this._selectedId;
  set selectedId(int selectedId) => _$this._selectedId = selectedId;

  MapBuilder<int, Lift> _lifts;
  MapBuilder<int, Lift> get lifts =>
      _$this._lifts ??= new MapBuilder<int, Lift>();
  set lifts(MapBuilder<int, Lift> lifts) => _$this._lifts = lifts;

  MapBuilder<int, LiftImage> _liftImages;
  MapBuilder<int, LiftImage> get liftImages =>
      _$this._liftImages ??= new MapBuilder<int, LiftImage>();
  set liftImages(MapBuilder<int, LiftImage> liftImages) =>
      _$this._liftImages = liftImages;

  MapBuilder<int, LiftEvent> _liftEvents;
  MapBuilder<int, LiftEvent> get liftEvents =>
      _$this._liftEvents ??= new MapBuilder<int, LiftEvent>();
  set liftEvents(MapBuilder<int, LiftEvent> liftEvents) =>
      _$this._liftEvents = liftEvents;

  LiftStateBuilder();

  LiftStateBuilder get _$this {
    if (_$v != null) {
      _fetchCount = _$v.fetchCount;
      _error = _$v.error;
      _selectedId = _$v.selectedId;
      _lifts = _$v.lifts?.toBuilder();
      _liftImages = _$v.liftImages?.toBuilder();
      _liftEvents = _$v.liftEvents?.toBuilder();
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
              selectedId: selectedId,
              lifts: _lifts?.build(),
              liftImages: _liftImages?.build(),
              liftEvents: _liftEvents?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'lifts';
        _lifts?.build();
        _$failedField = 'liftImages';
        _liftImages?.build();
        _$failedField = 'liftEvents';
        _liftEvents?.build();
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
