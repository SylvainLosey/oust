// GENERATED CODE - DO NOT MODIFY BY HAND

part of pickup;

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
    if (object.city != null) {
      result
        ..add('city')
        ..add(serializers.serialize(object.city,
            specifiedType: const FullType(String)));
    }
    if (object.completed != null) {
      result
        ..add('completed')
        ..add(serializers.serialize(object.completed,
            specifiedType: const FullType(bool)));
    }
    if (object.customerUnavailable != null) {
      result
        ..add('customer_unavailable')
        ..add(serializers.serialize(object.customerUnavailable,
            specifiedType: const FullType(bool)));
    }
    if (object.duration != null) {
      result
        ..add('duration')
        ..add(serializers.serialize(object.duration,
            specifiedType: const FullType(String)));
    }
    if (object.note != null) {
      result
        ..add('note')
        ..add(serializers.serialize(object.note,
            specifiedType: const FullType(String)));
    }
    if (object.pickupDate != null) {
      result
        ..add('pickup_date')
        ..add(serializers.serialize(object.pickupDate,
            specifiedType: const FullType(DateTime)));
    }
    if (object.position != null) {
      result
        ..add('position')
        ..add(serializers.serialize(object.position,
            specifiedType:
                const FullType(BuiltList, const [const FullType(double)])));
    }
    if (object.representation != null) {
      result
        ..add('representation')
        ..add(serializers.serialize(object.representation,
            specifiedType: const FullType(String)));
    }
    if (object.customerNote != null) {
      result
        ..add('customer_note')
        ..add(serializers.serialize(object.customerNote,
            specifiedType: const FullType(String)));
    }
    if (object.isInvoiced != null) {
      result
        ..add('is_invoiced')
        ..add(serializers.serialize(object.isInvoiced,
            specifiedType: const FullType(bool)));
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
        case 'average_duration':
          result.averageDuration = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'average_quantity':
          result.averageQuantity = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'city':
          result.city = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'completed':
          result.completed = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'customer_unavailable':
          result.customerUnavailable = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'duration':
          result.duration = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'note':
          result.note = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'pickup_date':
          result.pickupDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'position':
          result.position.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(double)]))
              as BuiltList);
          break;
        case 'representation':
          result.representation = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'subscription':
          result.subscription = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'customer_note':
          result.customerNote = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'is_invoiced':
          result.isInvoiced = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$Pickup extends Pickup {
  @override
  final int averageDuration;
  @override
  final int averageQuantity;
  @override
  final String city;
  @override
  final bool completed;
  @override
  final bool customerUnavailable;
  @override
  final String duration;
  @override
  final int id;
  @override
  final String note;
  @override
  final DateTime pickupDate;
  @override
  final BuiltList<double> position;
  @override
  final String representation;
  @override
  final int subscription;
  @override
  final String customerNote;
  @override
  final bool isInvoiced;

  factory _$Pickup([void Function(PickupBuilder) updates]) =>
      (new PickupBuilder()..update(updates)).build();

  _$Pickup._(
      {this.averageDuration,
      this.averageQuantity,
      this.city,
      this.completed,
      this.customerUnavailable,
      this.duration,
      this.id,
      this.note,
      this.pickupDate,
      this.position,
      this.representation,
      this.subscription,
      this.customerNote,
      this.isInvoiced})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Pickup', 'id');
    }
    if (subscription == null) {
      throw new BuiltValueNullFieldError('Pickup', 'subscription');
    }
  }

  @override
  Pickup rebuild(void Function(PickupBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PickupBuilder toBuilder() => new PickupBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Pickup &&
        averageDuration == other.averageDuration &&
        averageQuantity == other.averageQuantity &&
        city == other.city &&
        completed == other.completed &&
        customerUnavailable == other.customerUnavailable &&
        duration == other.duration &&
        id == other.id &&
        note == other.note &&
        pickupDate == other.pickupDate &&
        position == other.position &&
        representation == other.representation &&
        subscription == other.subscription &&
        customerNote == other.customerNote &&
        isInvoiced == other.isInvoiced;
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
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            0,
                                                            averageDuration
                                                                .hashCode),
                                                        averageQuantity
                                                            .hashCode),
                                                    city.hashCode),
                                                completed.hashCode),
                                            customerUnavailable.hashCode),
                                        duration.hashCode),
                                    id.hashCode),
                                note.hashCode),
                            pickupDate.hashCode),
                        position.hashCode),
                    representation.hashCode),
                subscription.hashCode),
            customerNote.hashCode),
        isInvoiced.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Pickup')
          ..add('averageDuration', averageDuration)
          ..add('averageQuantity', averageQuantity)
          ..add('city', city)
          ..add('completed', completed)
          ..add('customerUnavailable', customerUnavailable)
          ..add('duration', duration)
          ..add('id', id)
          ..add('note', note)
          ..add('pickupDate', pickupDate)
          ..add('position', position)
          ..add('representation', representation)
          ..add('subscription', subscription)
          ..add('customerNote', customerNote)
          ..add('isInvoiced', isInvoiced))
        .toString();
  }
}

class PickupBuilder implements Builder<Pickup, PickupBuilder> {
  _$Pickup _$v;

  int _averageDuration;
  int get averageDuration => _$this._averageDuration;
  set averageDuration(int averageDuration) =>
      _$this._averageDuration = averageDuration;

  int _averageQuantity;
  int get averageQuantity => _$this._averageQuantity;
  set averageQuantity(int averageQuantity) =>
      _$this._averageQuantity = averageQuantity;

  String _city;
  String get city => _$this._city;
  set city(String city) => _$this._city = city;

  bool _completed;
  bool get completed => _$this._completed;
  set completed(bool completed) => _$this._completed = completed;

  bool _customerUnavailable;
  bool get customerUnavailable => _$this._customerUnavailable;
  set customerUnavailable(bool customerUnavailable) =>
      _$this._customerUnavailable = customerUnavailable;

  String _duration;
  String get duration => _$this._duration;
  set duration(String duration) => _$this._duration = duration;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _note;
  String get note => _$this._note;
  set note(String note) => _$this._note = note;

  DateTime _pickupDate;
  DateTime get pickupDate => _$this._pickupDate;
  set pickupDate(DateTime pickupDate) => _$this._pickupDate = pickupDate;

  ListBuilder<double> _position;
  ListBuilder<double> get position =>
      _$this._position ??= new ListBuilder<double>();
  set position(ListBuilder<double> position) => _$this._position = position;

  String _representation;
  String get representation => _$this._representation;
  set representation(String representation) =>
      _$this._representation = representation;

  int _subscription;
  int get subscription => _$this._subscription;
  set subscription(int subscription) => _$this._subscription = subscription;

  String _customerNote;
  String get customerNote => _$this._customerNote;
  set customerNote(String customerNote) => _$this._customerNote = customerNote;

  bool _isInvoiced;
  bool get isInvoiced => _$this._isInvoiced;
  set isInvoiced(bool isInvoiced) => _$this._isInvoiced = isInvoiced;

  PickupBuilder();

  PickupBuilder get _$this {
    if (_$v != null) {
      _averageDuration = _$v.averageDuration;
      _averageQuantity = _$v.averageQuantity;
      _city = _$v.city;
      _completed = _$v.completed;
      _customerUnavailable = _$v.customerUnavailable;
      _duration = _$v.duration;
      _id = _$v.id;
      _note = _$v.note;
      _pickupDate = _$v.pickupDate;
      _position = _$v.position?.toBuilder();
      _representation = _$v.representation;
      _subscription = _$v.subscription;
      _customerNote = _$v.customerNote;
      _isInvoiced = _$v.isInvoiced;
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
  void update(void Function(PickupBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Pickup build() {
    _$Pickup _$result;
    try {
      _$result = _$v ??
          new _$Pickup._(
              averageDuration: averageDuration,
              averageQuantity: averageQuantity,
              city: city,
              completed: completed,
              customerUnavailable: customerUnavailable,
              duration: duration,
              id: id,
              note: note,
              pickupDate: pickupDate,
              position: _position?.build(),
              representation: representation,
              subscription: subscription,
              customerNote: customerNote,
              isInvoiced: isInvoiced);
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
