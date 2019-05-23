// GENERATED CODE - DO NOT MODIFY BY HAND

part of lift;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Lift> _$liftSerializer = new _$LiftSerializer();

class _$LiftSerializer implements StructuredSerializer<Lift> {
  @override
  final Iterable<Type> types = const [Lift, _$Lift];
  @override
  final String wireName = 'Lift';

  @override
  Iterable serialize(Serializers serializers, Lift object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.customer != null) {
      result
        ..add('customer')
        ..add(serializers.serialize(object.customer,
            specifiedType: const FullType(int)));
    }
    if (object.status != null) {
      result
        ..add('status')
        ..add(serializers.serialize(object.status,
            specifiedType: const FullType(String)));
    }
    if (object.address != null) {
      result
        ..add('address')
        ..add(serializers.serialize(object.address,
            specifiedType: const FullType(String)));
    }
    if (object.postcode != null) {
      result
        ..add('postcode')
        ..add(serializers.serialize(object.postcode,
            specifiedType: const FullType(int)));
    }
    if (object.position != null) {
      result
        ..add('position')
        ..add(serializers.serialize(object.position,
            specifiedType:
                const FullType(BuiltList, const [const FullType(double)])));
    }
    if (object.floor != null) {
      result
        ..add('floor')
        ..add(serializers.serialize(object.floor,
            specifiedType: const FullType(int)));
    }
    if (object.elevator != null) {
      result
        ..add('elevator')
        ..add(serializers.serialize(object.elevator,
            specifiedType: const FullType(bool)));
    }
    if (object.note != null) {
      result
        ..add('note')
        ..add(serializers.serialize(object.note,
            specifiedType: const FullType(String)));
    }
    if (object.customerNote != null) {
      result
        ..add('customer_note')
        ..add(serializers.serialize(object.customerNote,
            specifiedType: const FullType(String)));
    }
    if (object.estimatedEmployees != null) {
      result
        ..add('estimated_employees')
        ..add(serializers.serialize(object.estimatedEmployees,
            specifiedType: const FullType(int)));
    }
    if (object.estimatedDuration != null) {
      result
        ..add('estimated_duration')
        ..add(serializers.serialize(object.estimatedDuration,
            specifiedType: const FullType(int)));
    }
    if (object.estimatedPrice != null) {
      result
        ..add('estimated_price')
        ..add(serializers.serialize(object.estimatedPrice,
            specifiedType: const FullType(Decimal)));
    }
    if (object.flexible != null) {
      result
        ..add('flexible')
        ..add(serializers.serialize(object.flexible,
            specifiedType: const FullType(bool)));
    }
    if (object.roundsCompatible != null) {
      result
        ..add('rounds_compatible')
        ..add(serializers.serialize(object.roundsCompatible,
            specifiedType: const FullType(bool)));
    }

    return result;
  }

  @override
  Lift deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LiftBuilder();

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
        case 'customer':
          result.customer = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'postcode':
          result.postcode = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'position':
          result.position.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(double)]))
              as BuiltList);
          break;
        case 'floor':
          result.floor = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'elevator':
          result.elevator = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'note':
          result.note = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'customer_note':
          result.customerNote = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'estimated_employees':
          result.estimatedEmployees = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'estimated_duration':
          result.estimatedDuration = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'estimated_price':
          result.estimatedPrice = serializers.deserialize(value,
              specifiedType: const FullType(Decimal)) as Decimal;
          break;
        case 'flexible':
          result.flexible = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'rounds_compatible':
          result.roundsCompatible = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$Lift extends Lift {
  @override
  final int id;
  @override
  final int customer;
  @override
  final String status;
  @override
  final String address;
  @override
  final int postcode;
  @override
  final BuiltList<double> position;
  @override
  final int floor;
  @override
  final bool elevator;
  @override
  final String note;
  @override
  final String customerNote;
  @override
  final int estimatedEmployees;
  @override
  final int estimatedDuration;
  @override
  final Decimal estimatedPrice;
  @override
  final bool flexible;
  @override
  final bool roundsCompatible;

  factory _$Lift([void Function(LiftBuilder) updates]) =>
      (new LiftBuilder()..update(updates)).build();

  _$Lift._(
      {this.id,
      this.customer,
      this.status,
      this.address,
      this.postcode,
      this.position,
      this.floor,
      this.elevator,
      this.note,
      this.customerNote,
      this.estimatedEmployees,
      this.estimatedDuration,
      this.estimatedPrice,
      this.flexible,
      this.roundsCompatible})
      : super._();

  @override
  Lift rebuild(void Function(LiftBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LiftBuilder toBuilder() => new LiftBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Lift &&
        id == other.id &&
        customer == other.customer &&
        status == other.status &&
        address == other.address &&
        postcode == other.postcode &&
        position == other.position &&
        floor == other.floor &&
        elevator == other.elevator &&
        note == other.note &&
        customerNote == other.customerNote &&
        estimatedEmployees == other.estimatedEmployees &&
        estimatedDuration == other.estimatedDuration &&
        estimatedPrice == other.estimatedPrice &&
        flexible == other.flexible &&
        roundsCompatible == other.roundsCompatible;
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
                                                        $jc($jc(0, id.hashCode),
                                                            customer.hashCode),
                                                        status.hashCode),
                                                    address.hashCode),
                                                postcode.hashCode),
                                            position.hashCode),
                                        floor.hashCode),
                                    elevator.hashCode),
                                note.hashCode),
                            customerNote.hashCode),
                        estimatedEmployees.hashCode),
                    estimatedDuration.hashCode),
                estimatedPrice.hashCode),
            flexible.hashCode),
        roundsCompatible.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Lift')
          ..add('id', id)
          ..add('customer', customer)
          ..add('status', status)
          ..add('address', address)
          ..add('postcode', postcode)
          ..add('position', position)
          ..add('floor', floor)
          ..add('elevator', elevator)
          ..add('note', note)
          ..add('customerNote', customerNote)
          ..add('estimatedEmployees', estimatedEmployees)
          ..add('estimatedDuration', estimatedDuration)
          ..add('estimatedPrice', estimatedPrice)
          ..add('flexible', flexible)
          ..add('roundsCompatible', roundsCompatible))
        .toString();
  }
}

class LiftBuilder implements Builder<Lift, LiftBuilder> {
  _$Lift _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  int _customer;
  int get customer => _$this._customer;
  set customer(int customer) => _$this._customer = customer;

  String _status;
  String get status => _$this._status;
  set status(String status) => _$this._status = status;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  int _postcode;
  int get postcode => _$this._postcode;
  set postcode(int postcode) => _$this._postcode = postcode;

  ListBuilder<double> _position;
  ListBuilder<double> get position =>
      _$this._position ??= new ListBuilder<double>();
  set position(ListBuilder<double> position) => _$this._position = position;

  int _floor;
  int get floor => _$this._floor;
  set floor(int floor) => _$this._floor = floor;

  bool _elevator;
  bool get elevator => _$this._elevator;
  set elevator(bool elevator) => _$this._elevator = elevator;

  String _note;
  String get note => _$this._note;
  set note(String note) => _$this._note = note;

  String _customerNote;
  String get customerNote => _$this._customerNote;
  set customerNote(String customerNote) => _$this._customerNote = customerNote;

  int _estimatedEmployees;
  int get estimatedEmployees => _$this._estimatedEmployees;
  set estimatedEmployees(int estimatedEmployees) =>
      _$this._estimatedEmployees = estimatedEmployees;

  int _estimatedDuration;
  int get estimatedDuration => _$this._estimatedDuration;
  set estimatedDuration(int estimatedDuration) =>
      _$this._estimatedDuration = estimatedDuration;

  Decimal _estimatedPrice;
  Decimal get estimatedPrice => _$this._estimatedPrice;
  set estimatedPrice(Decimal estimatedPrice) =>
      _$this._estimatedPrice = estimatedPrice;

  bool _flexible;
  bool get flexible => _$this._flexible;
  set flexible(bool flexible) => _$this._flexible = flexible;

  bool _roundsCompatible;
  bool get roundsCompatible => _$this._roundsCompatible;
  set roundsCompatible(bool roundsCompatible) =>
      _$this._roundsCompatible = roundsCompatible;

  LiftBuilder();

  LiftBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _customer = _$v.customer;
      _status = _$v.status;
      _address = _$v.address;
      _postcode = _$v.postcode;
      _position = _$v.position?.toBuilder();
      _floor = _$v.floor;
      _elevator = _$v.elevator;
      _note = _$v.note;
      _customerNote = _$v.customerNote;
      _estimatedEmployees = _$v.estimatedEmployees;
      _estimatedDuration = _$v.estimatedDuration;
      _estimatedPrice = _$v.estimatedPrice;
      _flexible = _$v.flexible;
      _roundsCompatible = _$v.roundsCompatible;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Lift other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Lift;
  }

  @override
  void update(void Function(LiftBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Lift build() {
    _$Lift _$result;
    try {
      _$result = _$v ??
          new _$Lift._(
              id: id,
              customer: customer,
              status: status,
              address: address,
              postcode: postcode,
              position: _position?.build(),
              floor: floor,
              elevator: elevator,
              note: note,
              customerNote: customerNote,
              estimatedEmployees: estimatedEmployees,
              estimatedDuration: estimatedDuration,
              estimatedPrice: estimatedPrice,
              flexible: flexible,
              roundsCompatible: roundsCompatible);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'position';
        _position?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Lift', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
