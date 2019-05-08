// GENERATED CODE - DO NOT MODIFY BY HAND

part of CustomerState;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CustomerState> _$customerStateSerializer =
    new _$CustomerStateSerializer();

class _$CustomerStateSerializer implements StructuredSerializer<CustomerState> {
  @override
  final Iterable<Type> types = const [CustomerState, _$CustomerState];
  @override
  final String wireName = 'CustomerState';

  @override
  Iterable serialize(Serializers serializers, CustomerState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'fetchCount',
      serializers.serialize(object.fetchCount,
          specifiedType: const FullType(int)),
    ];
    if (object.customer != null) {
      result
        ..add('customer')
        ..add(serializers.serialize(object.customer,
            specifiedType: const FullType(Customer)));
    }
    if (object.phoneNumbers != null) {
      result
        ..add('phoneNumbers')
        ..add(serializers.serialize(object.phoneNumbers,
            specifiedType: const FullType(BuiltMap,
                const [const FullType(int), const FullType(PhoneNumber)])));
    }
    if (object.emails != null) {
      result
        ..add('emails')
        ..add(serializers.serialize(object.emails,
            specifiedType: const FullType(
                BuiltMap, const [const FullType(int), const FullType(Email)])));
    }
    if (object.error != null) {
      result
        ..add('error')
        ..add(serializers.serialize(object.error,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  CustomerState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CustomerStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'customer':
          result.customer.replace(serializers.deserialize(value,
              specifiedType: const FullType(Customer)) as Customer);
          break;
        case 'phoneNumbers':
          result.phoneNumbers.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(int),
                const FullType(PhoneNumber)
              ])) as BuiltMap);
          break;
        case 'emails':
          result.emails.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(int),
                const FullType(Email)
              ])) as BuiltMap);
          break;
        case 'error':
          result.error = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'fetchCount':
          result.fetchCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$CustomerState extends CustomerState {
  @override
  final Customer customer;
  @override
  final BuiltMap<int, PhoneNumber> phoneNumbers;
  @override
  final BuiltMap<int, Email> emails;
  @override
  final String error;
  @override
  final int fetchCount;

  factory _$CustomerState([void Function(CustomerStateBuilder) updates]) =>
      (new CustomerStateBuilder()..update(updates)).build();

  _$CustomerState._(
      {this.customer,
      this.phoneNumbers,
      this.emails,
      this.error,
      this.fetchCount})
      : super._() {
    if (fetchCount == null) {
      throw new BuiltValueNullFieldError('CustomerState', 'fetchCount');
    }
  }

  @override
  CustomerState rebuild(void Function(CustomerStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CustomerStateBuilder toBuilder() => new CustomerStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CustomerState &&
        customer == other.customer &&
        phoneNumbers == other.phoneNumbers &&
        emails == other.emails &&
        error == other.error &&
        fetchCount == other.fetchCount;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, customer.hashCode), phoneNumbers.hashCode),
                emails.hashCode),
            error.hashCode),
        fetchCount.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CustomerState')
          ..add('customer', customer)
          ..add('phoneNumbers', phoneNumbers)
          ..add('emails', emails)
          ..add('error', error)
          ..add('fetchCount', fetchCount))
        .toString();
  }
}

class CustomerStateBuilder
    implements Builder<CustomerState, CustomerStateBuilder> {
  _$CustomerState _$v;

  CustomerBuilder _customer;
  CustomerBuilder get customer => _$this._customer ??= new CustomerBuilder();
  set customer(CustomerBuilder customer) => _$this._customer = customer;

  MapBuilder<int, PhoneNumber> _phoneNumbers;
  MapBuilder<int, PhoneNumber> get phoneNumbers =>
      _$this._phoneNumbers ??= new MapBuilder<int, PhoneNumber>();
  set phoneNumbers(MapBuilder<int, PhoneNumber> phoneNumbers) =>
      _$this._phoneNumbers = phoneNumbers;

  MapBuilder<int, Email> _emails;
  MapBuilder<int, Email> get emails =>
      _$this._emails ??= new MapBuilder<int, Email>();
  set emails(MapBuilder<int, Email> emails) => _$this._emails = emails;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  int _fetchCount;
  int get fetchCount => _$this._fetchCount;
  set fetchCount(int fetchCount) => _$this._fetchCount = fetchCount;

  CustomerStateBuilder();

  CustomerStateBuilder get _$this {
    if (_$v != null) {
      _customer = _$v.customer?.toBuilder();
      _phoneNumbers = _$v.phoneNumbers?.toBuilder();
      _emails = _$v.emails?.toBuilder();
      _error = _$v.error;
      _fetchCount = _$v.fetchCount;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CustomerState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$CustomerState;
  }

  @override
  void update(void Function(CustomerStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CustomerState build() {
    _$CustomerState _$result;
    try {
      _$result = _$v ??
          new _$CustomerState._(
              customer: _customer?.build(),
              phoneNumbers: _phoneNumbers?.build(),
              emails: _emails?.build(),
              error: error,
              fetchCount: fetchCount);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'customer';
        _customer?.build();
        _$failedField = 'phoneNumbers';
        _phoneNumbers?.build();
        _$failedField = 'emails';
        _emails?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'CustomerState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
