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
    final result = <Object>[];
    if (object.address != null) {
      result
        ..add('address')
        ..add(serializers.serialize(object.address,
            specifiedType: const FullType(String)));
    }
    if (object.averageQuantity != null) {
      result
        ..add('average_quantity')
        ..add(serializers.serialize(object.averageQuantity,
            specifiedType: const FullType(int)));
    }
    if (object.baseDate != null) {
      result
        ..add('base_date')
        ..add(serializers.serialize(object.baseDate,
            specifiedType: const FullType(DateTime)));
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
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.note != null) {
      result
        ..add('note')
        ..add(serializers.serialize(object.note,
            specifiedType: const FullType(String)));
    }
    if (object.pickupDay != null) {
      result
        ..add('pickup_day')
        ..add(serializers.serialize(object.pickupDay,
            specifiedType: const FullType(int)));
    }
    if (object.position != null) {
      result
        ..add('position')
        ..add(serializers.serialize(object.position,
            specifiedType:
                const FullType(BuiltList, const [const FullType(double)])));
    }
    if (object.postcode != null) {
      result
        ..add('postcode')
        ..add(serializers.serialize(object.postcode,
            specifiedType: const FullType(int)));
    }
    if (object.remainingPickups != null) {
      result
        ..add('remainingPickups')
        ..add(serializers.serialize(object.remainingPickups,
            specifiedType: const FullType(int)));
    }
    if (object.representation != null) {
      result
        ..add('representation')
        ..add(serializers.serialize(object.representation,
            specifiedType: const FullType(String)));
    }
    if (object.status != null) {
      result
        ..add('status')
        ..add(serializers.serialize(object.status,
            specifiedType: const FullType(String)));
    }
    if (object.subscriptionType != null) {
      result
        ..add('subscription_type')
        ..add(serializers.serialize(object.subscriptionType,
            specifiedType: const FullType(String)));
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
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'average_quantity':
          result.averageQuantity = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'base_date':
          result.baseDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'city':
          result.city = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'customer':
          result.customer = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'note':
          result.note = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'pickup_day':
          result.pickupDay = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'position':
          result.position.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(double)]))
              as BuiltList);
          break;
        case 'postcode':
          result.postcode = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'remainingPickups':
          result.remainingPickups = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'representation':
          result.representation = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'subscription_type':
          result.subscriptionType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Subscription extends Subscription {
  @override
  final String address;
  @override
  final int averageQuantity;
  @override
  final DateTime baseDate;
  @override
  final String city;
  @override
  final int customer;
  @override
  final int id;
  @override
  final String name;
  @override
  final String note;
  @override
  final int pickupDay;
  @override
  final BuiltList<double> position;
  @override
  final int postcode;
  @override
  final int remainingPickups;
  @override
  final String representation;
  @override
  final String status;
  @override
  final String subscriptionType;

  factory _$Subscription([void Function(SubscriptionBuilder) updates]) =>
      (new SubscriptionBuilder()..update(updates)).build();

  _$Subscription._(
      {this.address,
      this.averageQuantity,
      this.baseDate,
      this.city,
      this.customer,
      this.id,
      this.name,
      this.note,
      this.pickupDay,
      this.position,
      this.postcode,
      this.remainingPickups,
      this.representation,
      this.status,
      this.subscriptionType})
      : super._();

  @override
  Subscription rebuild(void Function(SubscriptionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubscriptionBuilder toBuilder() => new SubscriptionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Subscription &&
        address == other.address &&
        averageQuantity == other.averageQuantity &&
        baseDate == other.baseDate &&
        city == other.city &&
        customer == other.customer &&
        id == other.id &&
        name == other.name &&
        note == other.note &&
        pickupDay == other.pickupDay &&
        position == other.position &&
        postcode == other.postcode &&
        remainingPickups == other.remainingPickups &&
        representation == other.representation &&
        status == other.status &&
        subscriptionType == other.subscriptionType;
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
                                                            $jc(
                                                                0,
                                                                address
                                                                    .hashCode),
                                                            averageQuantity
                                                                .hashCode),
                                                        baseDate.hashCode),
                                                    city.hashCode),
                                                customer.hashCode),
                                            id.hashCode),
                                        name.hashCode),
                                    note.hashCode),
                                pickupDay.hashCode),
                            position.hashCode),
                        postcode.hashCode),
                    remainingPickups.hashCode),
                representation.hashCode),
            status.hashCode),
        subscriptionType.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Subscription')
          ..add('address', address)
          ..add('averageQuantity', averageQuantity)
          ..add('baseDate', baseDate)
          ..add('city', city)
          ..add('customer', customer)
          ..add('id', id)
          ..add('name', name)
          ..add('note', note)
          ..add('pickupDay', pickupDay)
          ..add('position', position)
          ..add('postcode', postcode)
          ..add('remainingPickups', remainingPickups)
          ..add('representation', representation)
          ..add('status', status)
          ..add('subscriptionType', subscriptionType))
        .toString();
  }
}

class SubscriptionBuilder
    implements Builder<Subscription, SubscriptionBuilder> {
  _$Subscription _$v;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  int _averageQuantity;
  int get averageQuantity => _$this._averageQuantity;
  set averageQuantity(int averageQuantity) =>
      _$this._averageQuantity = averageQuantity;

  DateTime _baseDate;
  DateTime get baseDate => _$this._baseDate;
  set baseDate(DateTime baseDate) => _$this._baseDate = baseDate;

  String _city;
  String get city => _$this._city;
  set city(String city) => _$this._city = city;

  int _customer;
  int get customer => _$this._customer;
  set customer(int customer) => _$this._customer = customer;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _note;
  String get note => _$this._note;
  set note(String note) => _$this._note = note;

  int _pickupDay;
  int get pickupDay => _$this._pickupDay;
  set pickupDay(int pickupDay) => _$this._pickupDay = pickupDay;

  ListBuilder<double> _position;
  ListBuilder<double> get position =>
      _$this._position ??= new ListBuilder<double>();
  set position(ListBuilder<double> position) => _$this._position = position;

  int _postcode;
  int get postcode => _$this._postcode;
  set postcode(int postcode) => _$this._postcode = postcode;

  int _remainingPickups;
  int get remainingPickups => _$this._remainingPickups;
  set remainingPickups(int remainingPickups) =>
      _$this._remainingPickups = remainingPickups;

  String _representation;
  String get representation => _$this._representation;
  set representation(String representation) =>
      _$this._representation = representation;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  String _subscriptionType;
  String get subscriptionType => _$this._subscriptionType;
  set subscriptionType(String subscriptionType) =>
      _$this._subscriptionType = subscriptionType;

  SubscriptionBuilder();

  SubscriptionBuilder get _$this {
    if (_$v != null) {
      _address = _$v.address;
      _averageQuantity = _$v.averageQuantity;
      _baseDate = _$v.baseDate;
      _city = _$v.city;
      _customer = _$v.customer;
      _id = _$v.id;
      _name = _$v.name;
      _note = _$v.note;
      _pickupDay = _$v.pickupDay;
      _position = _$v.position?.toBuilder();
      _postcode = _$v.postcode;
      _remainingPickups = _$v.remainingPickups;
      _representation = _$v.representation;
      _status = _$v.status;
      _subscriptionType = _$v.subscriptionType;
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
              address: address,
              averageQuantity: averageQuantity,
              baseDate: baseDate,
              city: city,
              customer: customer,
              id: id,
              name: name,
              note: note,
              pickupDay: pickupDay,
              position: _position?.build(),
              postcode: postcode,
              remainingPickups: remainingPickups,
              representation: representation,
              status: status,
              subscriptionType: subscriptionType);
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
