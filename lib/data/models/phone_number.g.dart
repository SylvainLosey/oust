// GENERATED CODE - DO NOT MODIFY BY HAND

part of phone_number;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PhoneNumber> _$phoneNumberSerializer = new _$PhoneNumberSerializer();

class _$PhoneNumberSerializer implements StructuredSerializer<PhoneNumber> {
  @override
  final Iterable<Type> types = const [PhoneNumber, _$PhoneNumber];
  @override
  final String wireName = 'PhoneNumber';

  @override
  Iterable serialize(Serializers serializers, PhoneNumber object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.phoneNumber != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(object.phoneNumber,
            specifiedType: const FullType(String)));
    }
    if (object.numberType != null) {
      result
        ..add('number_type')
        ..add(serializers.serialize(object.numberType,
            specifiedType: const FullType(String)));
    }
    if (object.reminder != null) {
      result
        ..add('reminder')
        ..add(serializers.serialize(object.reminder,
            specifiedType: const FullType(bool)));
    }
    if (object.customer != null) {
      result
        ..add('customer')
        ..add(serializers.serialize(object.customer,
            specifiedType: const FullType(int)));
    }

    return result;
  }

  @override
  PhoneNumber deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PhoneNumberBuilder();

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
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'number_type':
          result.numberType = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'reminder':
          result.reminder = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'customer':
          result.customer = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$PhoneNumber extends PhoneNumber {
  @override
  final int id;
  @override
  final String phoneNumber;
  @override
  final String numberType;
  @override
  final bool reminder;
  @override
  final int customer;

  factory _$PhoneNumber([void Function(PhoneNumberBuilder) updates]) =>
      (new PhoneNumberBuilder()..update(updates)).build();

  _$PhoneNumber._(
      {this.id,
      this.phoneNumber,
      this.numberType,
      this.reminder,
      this.customer})
      : super._();

  @override
  PhoneNumber rebuild(void Function(PhoneNumberBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PhoneNumberBuilder toBuilder() => new PhoneNumberBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PhoneNumber &&
        id == other.id &&
        phoneNumber == other.phoneNumber &&
        numberType == other.numberType &&
        reminder == other.reminder &&
        customer == other.customer;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, id.hashCode), phoneNumber.hashCode),
                numberType.hashCode),
            reminder.hashCode),
        customer.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PhoneNumber')
          ..add('id', id)
          ..add('phoneNumber', phoneNumber)
          ..add('numberType', numberType)
          ..add('reminder', reminder)
          ..add('customer', customer))
        .toString();
  }
}

class PhoneNumberBuilder implements Builder<PhoneNumber, PhoneNumberBuilder> {
  _$PhoneNumber _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _phoneNumber;
  String get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String phoneNumber) => _$this._phoneNumber = phoneNumber;

  String _numberType;
  String get numberType => _$this._numberType;
  set numberType(String numberType) => _$this._numberType = numberType;

  bool _reminder;
  bool get reminder => _$this._reminder;
  set reminder(bool reminder) => _$this._reminder = reminder;

  int _customer;
  int get customer => _$this._customer;
  set customer(int customer) => _$this._customer = customer;

  PhoneNumberBuilder();

  PhoneNumberBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _phoneNumber = _$v.phoneNumber;
      _numberType = _$v.numberType;
      _reminder = _$v.reminder;
      _customer = _$v.customer;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PhoneNumber other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$PhoneNumber;
  }

  @override
  void update(void Function(PhoneNumberBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PhoneNumber build() {
    final _$result = _$v ??
        new _$PhoneNumber._(
            id: id,
            phoneNumber: phoneNumber,
            numberType: numberType,
            reminder: reminder,
            customer: customer);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
