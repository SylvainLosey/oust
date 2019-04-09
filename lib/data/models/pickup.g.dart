// GENERATED CODE - DO NOT MODIFY BY HAND

part of Pickup;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Pickup> _$pickupSerializer = new _$PickupSerializer();

class _$PickupSerializer implements StructuredSerializer<Pickup> {
  @override
  final Iterable<Type> types = const [Pickup, _$Pickup];
  @override
  final String wireName = 'Pickup';

  @override
  Iterable serialize(Serializers serializers, Pickup object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'subscription',
      serializers.serialize(object.subscription,
          specifiedType: const FullType(int)),
    ];
    if (object.representation != null) {
      result
        ..add('representation')
        ..add(serializers.serialize(object.representation,
            specifiedType: const FullType(String)));
    }
    if (object.city != null) {
      result
        ..add('city')
        ..add(serializers.serialize(object.city,
            specifiedType: const FullType(String)));
    }
    if (object.position != null) {
      result
        ..add('position')
        ..add(serializers.serialize(object.position,
            specifiedType:
                const FullType(BuiltList, const [const FullType(double)])));
    }
    if (object.averageDuration != null) {
      result
        ..add('average_duration')
        ..add(serializers.serialize(object.averageDuration,
            specifiedType: const FullType(int)));
    }
    if (object.averageQuantity != null) {
      result
        ..add('average_quantity')
        ..add(serializers.serialize(object.averageQuantity,
            specifiedType: const FullType(int)));
    }
    if (object.pickupDate != null) {
      result
        ..add('pickup_date')
        ..add(serializers.serialize(object.pickupDate,
            specifiedType: const FullType(String)));
    }
    if (object.duration != null) {
      result
        ..add('duration')
        ..add(serializers.serialize(object.duration,
            specifiedType: const FullType(String)));
    }
    if (object.completed != null) {
      result
        ..add('completed')
        ..add(serializers.serialize(object.completed,
            specifiedType: const FullType(bool)));
    }
    if (object.completedAt != null) {
      result
        ..add('completed_at')
        ..add(serializers.serialize(object.completedAt,
            specifiedType: const FullType(String)));
    }
    if (object.customerUnavailable != null) {
      result
        ..add('customer_unavailable')
        ..add(serializers.serialize(object.customerUnavailable,
            specifiedType: const FullType(bool)));
    }
    if (object.note != null) {
      result
        ..add('note')
        ..add(serializers.serialize(object.note,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  Pickup deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PickupBuilder();

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
        case 'representation':
          result.representation = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'city':
          result.city = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'position':
          result.position.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(double)]))
              as BuiltList);
          break;
        case 'average_duration':
          result.averageDuration = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'average_quantity':
          result.averageQuantity = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'pickup_date':
          result.pickupDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'duration':
          result.duration = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'completed':
          result.completed = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'completed_at':
          result.completedAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'customer_unavailable':
          result.customerUnavailable = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'note':
          result.note = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'subscription':
          result.subscription = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$Pickup extends Pickup {
  @override
  final int id;
  @override
  final String representation;
  @override
  final String city;
  @override
  final BuiltList<double> position;
  @override
  final int averageDuration;
  @override
  final int averageQuantity;
  @override
  final String pickupDate;
  @override
  final String duration;
  @override
  final bool completed;
  @override
  final String completedAt;
  @override
  final bool customerUnavailable;
  @override
  final String note;
  @override
  final int subscription;

  factory _$Pickup([void updates(PickupBuilder b)]) =>
      (new PickupBuilder()..update(updates)).build();

  _$Pickup._(
      {this.id,
      this.representation,
      this.city,
      this.position,
      this.averageDuration,
      this.averageQuantity,
      this.pickupDate,
      this.duration,
      this.completed,
      this.completedAt,
      this.customerUnavailable,
      this.note,
      this.subscription})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Pickup', 'id');
    }
    if (subscription == null) {
      throw new BuiltValueNullFieldError('Pickup', 'subscription');
    }
  }

  @override
  Pickup rebuild(void updates(PickupBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  PickupBuilder toBuilder() => new PickupBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Pickup &&
        id == other.id &&
        representation == other.representation &&
        city == other.city &&
        position == other.position &&
        averageDuration == other.averageDuration &&
        averageQuantity == other.averageQuantity &&
        pickupDate == other.pickupDate &&
        duration == other.duration &&
        completed == other.completed &&
        completedAt == other.completedAt &&
        customerUnavailable == other.customerUnavailable &&
        note == other.note &&
        subscription == other.subscription;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc($jc(0, id.hashCode),
                                                    representation.hashCode),
                                                city.hashCode),
                                            position.hashCode),
                                        averageDuration.hashCode),
                                    averageQuantity.hashCode),
                                pickupDate.hashCode),
                            duration.hashCode),
                        completed.hashCode),
                    completedAt.hashCode),
                customerUnavailable.hashCode),
            note.hashCode),
        subscription.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Pickup')
          ..add('id', id)
          ..add('representation', representation)
          ..add('city', city)
          ..add('position', position)
          ..add('averageDuration', averageDuration)
          ..add('averageQuantity', averageQuantity)
          ..add('pickupDate', pickupDate)
          ..add('duration', duration)
          ..add('completed', completed)
          ..add('completedAt', completedAt)
          ..add('customerUnavailable', customerUnavailable)
          ..add('note', note)
          ..add('subscription', subscription))
        .toString();
  }
}

class PickupBuilder implements Builder<Pickup, PickupBuilder> {
  _$Pickup _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _representation;
  String get representation => _$this._representation;
  set representation(String representation) =>
      _$this._representation = representation;

  String _city;
  String get city => _$this._city;
  set city(String city) => _$this._city = city;

  ListBuilder<double> _position;
  ListBuilder<double> get position =>
      _$this._position ??= new ListBuilder<double>();
  set position(ListBuilder<double> position) => _$this._position = position;

  int _averageDuration;
  int get averageDuration => _$this._averageDuration;
  set averageDuration(int averageDuration) =>
      _$this._averageDuration = averageDuration;

  int _averageQuantity;
  int get averageQuantity => _$this._averageQuantity;
  set averageQuantity(int averageQuantity) =>
      _$this._averageQuantity = averageQuantity;

  String _pickupDate;
  String get pickupDate => _$this._pickupDate;
  set pickupDate(String pickupDate) => _$this._pickupDate = pickupDate;

  String _duration;
  String get duration => _$this._duration;
  set duration(String duration) => _$this._duration = duration;

  bool _completed;
  bool get completed => _$this._completed;
  set completed(bool completed) => _$this._completed = completed;

  String _completedAt;
  String get completedAt => _$this._completedAt;
  set completedAt(String completedAt) => _$this._completedAt = completedAt;

  bool _customerUnavailable;
  bool get customerUnavailable => _$this._customerUnavailable;
  set customerUnavailable(bool customerUnavailable) =>
      _$this._customerUnavailable = customerUnavailable;

  String _note;
  String get note => _$this._note;
  set note(String note) => _$this._note = note;

  int _subscription;
  int get subscription => _$this._subscription;
  set subscription(int subscription) => _$this._subscription = subscription;

  PickupBuilder();

  PickupBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _representation = _$v.representation;
      _city = _$v.city;
      _position = _$v.position?.toBuilder();
      _averageDuration = _$v.averageDuration;
      _averageQuantity = _$v.averageQuantity;
      _pickupDate = _$v.pickupDate;
      _duration = _$v.duration;
      _completed = _$v.completed;
      _completedAt = _$v.completedAt;
      _customerUnavailable = _$v.customerUnavailable;
      _note = _$v.note;
      _subscription = _$v.subscription;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Pickup other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Pickup;
  }

  @override
  void update(void updates(PickupBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Pickup build() {
    _$Pickup _$result;
    try {
      _$result = _$v ??
          new _$Pickup._(
              id: id,
              representation: representation,
              city: city,
              position: _position?.build(),
              averageDuration: averageDuration,
              averageQuantity: averageQuantity,
              pickupDate: pickupDate,
              duration: duration,
              completed: completed,
              completedAt: completedAt,
              customerUnavailable: customerUnavailable,
              note: note,
              subscription: subscription);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'position';
        _position?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Pickup', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
