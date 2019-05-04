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
      'isLoading',
      serializers.serialize(object.isLoading,
          specifiedType: const FullType(bool)),
    ];
    if (object.customer != null) {
      result
        ..add('customer')
        ..add(serializers.serialize(object.customer,
            specifiedType: const FullType(Customer)));
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
        case 'error':
          result.error = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'isLoading':
          result.isLoading = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
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
  final String error;
  @override
  final bool isLoading;

  factory _$CustomerState([void Function(CustomerStateBuilder) updates]) =>
      (new CustomerStateBuilder()..update(updates)).build();

  _$CustomerState._({this.customer, this.error, this.isLoading}) : super._() {
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('CustomerState', 'isLoading');
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
        error == other.error &&
        isLoading == other.isLoading;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, customer.hashCode), error.hashCode), isLoading.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CustomerState')
          ..add('customer', customer)
          ..add('error', error)
          ..add('isLoading', isLoading))
        .toString();
  }
}

class CustomerStateBuilder
    implements Builder<CustomerState, CustomerStateBuilder> {
  _$CustomerState _$v;

  CustomerBuilder _customer;
  CustomerBuilder get customer => _$this._customer ??= new CustomerBuilder();
  set customer(CustomerBuilder customer) => _$this._customer = customer;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  CustomerStateBuilder();

  CustomerStateBuilder get _$this {
    if (_$v != null) {
      _customer = _$v.customer?.toBuilder();
      _error = _$v.error;
      _isLoading = _$v.isLoading;
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
              customer: _customer?.build(), error: error, isLoading: isLoading);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'customer';
        _customer?.build();
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
