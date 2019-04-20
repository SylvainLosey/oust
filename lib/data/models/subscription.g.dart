// GENERATED CODE - DO NOT MODIFY BY HAND

part of subscription;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Subscription> _$subscriptionSerializer =
    new _$SubscriptionSerializer();

class _$SubscriptionSerializer implements StructuredSerializer<Subscription> {
  @override
  final Iterable<Type> types = const [Subscription, _$Subscription];
  @override
  final String wireName = 'Subscription';

  @override
  Iterable serialize(Serializers serializers, Subscription object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'representation',
      serializers.serialize(object.representation,
          specifiedType: const FullType(String)),
    ];
    if (object.position != null) {
      result
        ..add('position')
        ..add(serializers.serialize(object.position,
            specifiedType:
                const FullType(BuiltList, const [const FullType(double)])));
    }
    if (object.subscriptionType != null) {
      result
        ..add('subscription_type')
        ..add(serializers.serialize(object.subscriptionType,
            specifiedType: const FullType(String)));
    }
    if (object.status != null) {
      result
        ..add('status')
        ..add(serializers.serialize(object.status,
            specifiedType: const FullType(String)));
    }
    if (object.baseDate != null) {
      result
        ..add('base_date')
        ..add(serializers.serialize(object.baseDate,
            specifiedType: const FullType(String)));
    }
    if (object.remainingPickups != null) {
      result
        ..add('remainingPickups')
        ..add(serializers.serialize(object.remainingPickups,
            specifiedType: const FullType(int)));
    }
    if (object.pickupDay != null) {
      result
        ..add('pickup_day')
        ..add(serializers.serialize(object.pickupDay,
            specifiedType: const FullType(int)));
    }
    if (object.averageQuantity != null) {
      result
        ..add('average_quantity')
        ..add(serializers.serialize(object.averageQuantity,
            specifiedType: const FullType(int)));
    }
    if (object.note != null) {
      result
        ..add('note')
        ..add(serializers.serialize(object.note,
            specifiedType: const FullType(String)));
    }
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.address != null) {
      result
        ..add('address')
        ..add(serializers.serialize(object.address,
            specifiedType: const FullType(String)));
    }
    if (object.city != null) {
      result
        ..add('city')
        ..add(serializers.serialize(object.city,
            specifiedType: const FullType(String)));
    }
    if (object.customer != null) {
      result
        ..add('customer')
        ..add(serializers.serialize(object.customer,
            specifiedType: const FullType(int)));
    }
    if (object.postcode != null) {
      result
        ..add('postcode')
        ..add(serializers.serialize(object.postcode,
            specifiedType: const FullType(int)));
    }

    return result;
  }

  @override
  Subscription deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SubscriptionBuilder();

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
        case 'position':
          result.position.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(double)]))
              as BuiltList);
          break;
        case 'subscription_type':
          result.subscriptionType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'base_date':
          result.baseDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'remainingPickups':
          result.remainingPickups = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'pickup_day':
          result.pickupDay = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'average_quantity':
          result.averageQuantity = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'note':
          result.note = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'city':
          result.city = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'customer':
          result.customer = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'postcode':
          result.postcode = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$Subscription extends Subscription {
  @override
  final int id;
  @override
  final String representation;
  @override
  final BuiltList<double> position;
  @override
  final String subscriptionType;
  @override
  final String status;
  @override
  final String baseDate;
  @override
  final int remainingPickups;
  @override
  final int pickupDay;
  @override
  final int averageQuantity;
  @override
  final String note;
  @override
  final String name;
  @override
  final String address;
  @override
  final String city;
  @override
  final int customer;
  @override
  final int postcode;

  factory _$Subscription([void Function(SubscriptionBuilder) updates]) =>
      (new SubscriptionBuilder()..update(updates)).build();

  _$Subscription._(
      {this.id,
      this.representation,
      this.position,
      this.subscriptionType,
      this.status,
      this.baseDate,
      this.remainingPickups,
      this.pickupDay,
      this.averageQuantity,
      this.note,
      this.name,
      this.address,
      this.city,
      this.customer,
      this.postcode})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Subscription', 'id');
    }
    if (representation == null) {
      throw new BuiltValueNullFieldError('Subscription', 'representation');
    }
  }

  @override
  Subscription rebuild(void Function(SubscriptionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubscriptionBuilder toBuilder() => new SubscriptionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Subscription &&
        id == other.id &&
        representation == other.representation &&
        position == other.position &&
        subscriptionType == other.subscriptionType &&
        status == other.status &&
        baseDate == other.baseDate &&
        remainingPickups == other.remainingPickups &&
        pickupDay == other.pickupDay &&
        averageQuantity == other.averageQuantity &&
        note == other.note &&
        name == other.name &&
        address == other.address &&
        city == other.city &&
        customer == other.customer &&
        postcode == other.postcode;
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
                                                            $jc(0, id.hashCode),
                                                            representation
                                                                .hashCode),
                                                        position.hashCode),
                                                    subscriptionType.hashCode),
                                                status.hashCode),
                                            baseDate.hashCode),
                                        remainingPickups.hashCode),
                                    pickupDay.hashCode),
                                averageQuantity.hashCode),
                            note.hashCode),
                        name.hashCode),
                    address.hashCode),
                city.hashCode),
            customer.hashCode),
        postcode.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Subscription')
          ..add('id', id)
          ..add('representation', representation)
          ..add('position', position)
          ..add('subscriptionType', subscriptionType)
          ..add('status', status)
          ..add('baseDate', baseDate)
          ..add('remainingPickups', remainingPickups)
          ..add('pickupDay', pickupDay)
          ..add('averageQuantity', averageQuantity)
          ..add('note', note)
          ..add('name', name)
          ..add('address', address)
          ..add('city', city)
          ..add('customer', customer)
          ..add('postcode', postcode))
        .toString();
  }
}

class SubscriptionBuilder
    implements Builder<Subscription, SubscriptionBuilder> {
  _$Subscription _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _representation;
  String get representation => _$this._representation;
  set representation(String representation) =>
      _$this._representation = representation;

  ListBuilder<double> _position;
  ListBuilder<double> get position =>
      _$this._position ??= new ListBuilder<double>();
  set position(ListBuilder<double> position) => _$this._position = position;

  String _subscriptionType;
  String get subscriptionType => _$this._subscriptionType;
  set subscriptionType(String subscriptionType) =>
      _$this._subscriptionType = subscriptionType;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  String _baseDate;
  String get baseDate => _$this._baseDate;
  set baseDate(String baseDate) => _$this._baseDate = baseDate;

  int _remainingPickups;
  int get remainingPickups => _$this._remainingPickups;
  set remainingPickups(int remainingPickups) =>
      _$this._remainingPickups = remainingPickups;

  int _pickupDay;
  int get pickupDay => _$this._pickupDay;
  set pickupDay(int pickupDay) => _$this._pickupDay = pickupDay;

  int _averageQuantity;
  int get averageQuantity => _$this._averageQuantity;
  set averageQuantity(int averageQuantity) =>
      _$this._averageQuantity = averageQuantity;

  String _note;
  String get note => _$this._note;
  set note(String note) => _$this._note = note;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  String _city;
  String get city => _$this._city;
  set city(String city) => _$this._city = city;

  int _customer;
  int get customer => _$this._customer;
  set customer(int customer) => _$this._customer = customer;

  int _postcode;
  int get postcode => _$this._postcode;
  set postcode(int postcode) => _$this._postcode = postcode;

  SubscriptionBuilder();

  SubscriptionBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _representation = _$v.representation;
      _position = _$v.position?.toBuilder();
      _subscriptionType = _$v.subscriptionType;
      _status = _$v.status;
      _baseDate = _$v.baseDate;
      _remainingPickups = _$v.remainingPickups;
      _pickupDay = _$v.pickupDay;
      _averageQuantity = _$v.averageQuantity;
      _note = _$v.note;
      _name = _$v.name;
      _address = _$v.address;
      _city = _$v.city;
      _customer = _$v.customer;
      _postcode = _$v.postcode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Subscription other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Subscription;
  }

  @override
  void update(void Function(SubscriptionBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Subscription build() {
    _$Subscription _$result;
    try {
      _$result = _$v ??
          new _$Subscription._(
              id: id,
              representation: representation,
              position: _position?.build(),
              subscriptionType: subscriptionType,
              status: status,
              baseDate: baseDate,
              remainingPickups: remainingPickups,
              pickupDay: pickupDay,
              averageQuantity: averageQuantity,
              note: note,
              name: name,
              address: address,
              city: city,
              customer: customer,
              postcode: postcode);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'position';
        _position?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Subscription', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
