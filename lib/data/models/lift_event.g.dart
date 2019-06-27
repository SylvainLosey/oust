// GENERATED CODE - DO NOT MODIFY BY HAND

part of lift_event;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LiftEvent> _$liftEventSerializer = new _$LiftEventSerializer();

class _$LiftEventSerializer implements StructuredSerializer<LiftEvent> {
  @override
  final Iterable<Type> types = const [LiftEvent, _$LiftEvent];
  @override
  final String wireName = 'LiftEvent';

  @override
  Iterable serialize(Serializers serializers, LiftEvent object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.flexible != null) {
      result
        ..add('flexible')
        ..add(serializers.serialize(object.flexible,
            specifiedType: const FullType(bool)));
    }
    if (object.date != null) {
      result
        ..add('date')
        ..add(serializers.serialize(object.date,
            specifiedType: const FullType(String)));
    }
    if (object.start != null) {
      result
        ..add('start')
        ..add(serializers.serialize(object.start,
            specifiedType: const FullType(String)));
    }
    if (object.end != null) {
      result
        ..add('end')
        ..add(serializers.serialize(object.end,
            specifiedType: const FullType(String)));
    }
    if (object.eventId != null) {
      result
        ..add('event_id')
        ..add(serializers.serialize(object.eventId,
            specifiedType: const FullType(String)));
    }
    if (object.lift != null) {
      result
        ..add('lift')
        ..add(serializers.serialize(object.lift,
            specifiedType: const FullType(int)));
    }

    return result;
  }

  @override
  LiftEvent deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LiftEventBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'flexible':
          result.flexible = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'start':
          result.start = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'end':
          result.end = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'event_id':
          result.eventId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'lift':
          result.lift = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$LiftEvent extends LiftEvent {
  @override
  final int id;
  @override
  final bool flexible;
  @override
  final String date;
  @override
  final String start;
  @override
  final String end;
  @override
  final String eventId;
  @override
  final int lift;

  factory _$LiftEvent([void Function(LiftEventBuilder) updates]) =>
      (new LiftEventBuilder()..update(updates)).build();

  _$LiftEvent._(
      {this.id,
      this.flexible,
      this.date,
      this.start,
      this.end,
      this.eventId,
      this.lift})
      : super._();

  @override
  LiftEvent rebuild(void Function(LiftEventBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LiftEventBuilder toBuilder() => new LiftEventBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LiftEvent &&
        id == other.id &&
        flexible == other.flexible &&
        date == other.date &&
        start == other.start &&
        end == other.end &&
        eventId == other.eventId &&
        lift == other.lift;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, id.hashCode), flexible.hashCode),
                        date.hashCode),
                    start.hashCode),
                end.hashCode),
            eventId.hashCode),
        lift.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LiftEvent')
          ..add('id', id)
          ..add('flexible', flexible)
          ..add('date', date)
          ..add('start', start)
          ..add('end', end)
          ..add('eventId', eventId)
          ..add('lift', lift))
        .toString();
  }
}

class LiftEventBuilder implements Builder<LiftEvent, LiftEventBuilder> {
  _$LiftEvent _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  bool _flexible;
  bool get flexible => _$this._flexible;
  set flexible(bool flexible) => _$this._flexible = flexible;

  String _date;
  String get date => _$this._date;
  set date(String date) => _$this._date = date;

  String _start;
  String get start => _$this._start;
  set start(String start) => _$this._start = start;

  String _end;
  String get end => _$this._end;
  set end(String end) => _$this._end = end;

  String _eventId;
  String get eventId => _$this._eventId;
  set eventId(String eventId) => _$this._eventId = eventId;

  int _lift;
  int get lift => _$this._lift;
  set lift(int lift) => _$this._lift = lift;

  LiftEventBuilder();

  LiftEventBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _flexible = _$v.flexible;
      _date = _$v.date;
      _start = _$v.start;
      _end = _$v.end;
      _eventId = _$v.eventId;
      _lift = _$v.lift;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LiftEvent other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LiftEvent;
  }

  @override
  void update(void Function(LiftEventBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LiftEvent build() {
    final _$result = _$v ??
        new _$LiftEvent._(
            id: id,
            flexible: flexible,
            date: date,
            start: start,
            end: end,
            eventId: eventId,
            lift: lift);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
