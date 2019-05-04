// GENERATED CODE - DO NOT MODIFY BY HAND

part of customer;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Customer> _$customerSerializer = new _$CustomerSerializer();

class _$CustomerSerializer implements StructuredSerializer<Customer> {
  @override
  final Iterable<Type> types = const [Customer, _$Customer];
  @override
  final String wireName = 'Customer';

  @override
  Iterable serialize(Serializers serializers, Customer object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'address',
      serializers.serialize(object.address,
          specifiedType: const FullType(String)),
      'city',
      serializers.serialize(object.city, specifiedType: const FullType(String)),
      'customer_status',
      serializers.serialize(object.customerStatus,
          specifiedType: const FullType(String)),
      'first_name',
      serializers.serialize(object.firstName,
          specifiedType: const FullType(String)),
      'gender',
      serializers.serialize(object.gender,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'last_name',
      serializers.serialize(object.lastName,
          specifiedType: const FullType(String)),
      'postcode',
      serializers.serialize(object.postcode,
          specifiedType: const FullType(int)),
      'prefered_communication',
      serializers.serialize(object.preferedCommunication,
          specifiedType: const FullType(String)),
      'prefered_payment_method',
      serializers.serialize(object.preferedPaymentMethod,
          specifiedType: const FullType(String)),
      'user',
      serializers.serialize(object.user, specifiedType: const FullType(int)),
    ];
    if (object.company != null) {
      result
        ..add('company')
        ..add(serializers.serialize(object.company,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  Customer deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CustomerBuilder();

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
        case 'city':
          result.city = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'company':
          result.company = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'customer_status':
          result.customerStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'first_name':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'gender':
          result.gender = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'last_name':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'postcode':
          result.postcode = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'prefered_communication':
          result.preferedCommunication = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'prefered_payment_method':
          result.preferedPaymentMethod = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$Customer extends Customer {
  @override
  final String address;
  @override
  final String city;
  @override
  final String company;
  @override
  final String customerStatus;
  @override
  final String firstName;
  @override
  final String gender;
  @override
  final int id;
  @override
  final String lastName;
  @override
  final int postcode;
  @override
  final String preferedCommunication;
  @override
  final String preferedPaymentMethod;
  @override
  final int user;

  factory _$Customer([void Function(CustomerBuilder) updates]) =>
      (new CustomerBuilder()..update(updates)).build();

  _$Customer._(
      {this.address,
      this.city,
      this.company,
      this.customerStatus,
      this.firstName,
      this.gender,
      this.id,
      this.lastName,
      this.postcode,
      this.preferedCommunication,
      this.preferedPaymentMethod,
      this.user})
      : super._() {
    if (address == null) {
      throw new BuiltValueNullFieldError('Customer', 'address');
    }
    if (city == null) {
      throw new BuiltValueNullFieldError('Customer', 'city');
    }
    if (customerStatus == null) {
      throw new BuiltValueNullFieldError('Customer', 'customerStatus');
    }
    if (firstName == null) {
      throw new BuiltValueNullFieldError('Customer', 'firstName');
    }
    if (gender == null) {
      throw new BuiltValueNullFieldError('Customer', 'gender');
    }
    if (id == null) {
      throw new BuiltValueNullFieldError('Customer', 'id');
    }
    if (lastName == null) {
      throw new BuiltValueNullFieldError('Customer', 'lastName');
    }
    if (postcode == null) {
      throw new BuiltValueNullFieldError('Customer', 'postcode');
    }
    if (preferedCommunication == null) {
      throw new BuiltValueNullFieldError('Customer', 'preferedCommunication');
    }
    if (preferedPaymentMethod == null) {
      throw new BuiltValueNullFieldError('Customer', 'preferedPaymentMethod');
    }
    if (user == null) {
      throw new BuiltValueNullFieldError('Customer', 'user');
    }
  }

  @override
  Customer rebuild(void Function(CustomerBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CustomerBuilder toBuilder() => new CustomerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Customer &&
        address == other.address &&
        city == other.city &&
        company == other.company &&
        customerStatus == other.customerStatus &&
        firstName == other.firstName &&
        gender == other.gender &&
        id == other.id &&
        lastName == other.lastName &&
        postcode == other.postcode &&
        preferedCommunication == other.preferedCommunication &&
        preferedPaymentMethod == other.preferedPaymentMethod &&
        user == other.user;
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
                                            $jc($jc(0, address.hashCode),
                                                city.hashCode),
                                            company.hashCode),
                                        customerStatus.hashCode),
                                    firstName.hashCode),
                                gender.hashCode),
                            id.hashCode),
                        lastName.hashCode),
                    postcode.hashCode),
                preferedCommunication.hashCode),
            preferedPaymentMethod.hashCode),
        user.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Customer')
          ..add('address', address)
          ..add('city', city)
          ..add('company', company)
          ..add('customerStatus', customerStatus)
          ..add('firstName', firstName)
          ..add('gender', gender)
          ..add('id', id)
          ..add('lastName', lastName)
          ..add('postcode', postcode)
          ..add('preferedCommunication', preferedCommunication)
          ..add('preferedPaymentMethod', preferedPaymentMethod)
          ..add('user', user))
        .toString();
  }
}

class CustomerBuilder implements Builder<Customer, CustomerBuilder> {
  _$Customer _$v;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  String _city;
  String get city => _$this._city;
  set city(String city) => _$this._city = city;

  String _company;
  String get company => _$this._company;
  set company(String company) => _$this._company = company;

  String _customerStatus;
  String get customerStatus => _$this._customerStatus;
  set customerStatus(String customerStatus) =>
      _$this._customerStatus = customerStatus;

  String _firstName;
  String get firstName => _$this._firstName;
  set firstName(String firstName) => _$this._firstName = firstName;

  String _gender;
  String get gender => _$this._gender;
  set gender(String gender) => _$this._gender = gender;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _lastName;
  String get lastName => _$this._lastName;
  set lastName(String lastName) => _$this._lastName = lastName;

  int _postcode;
  int get postcode => _$this._postcode;
  set postcode(int postcode) => _$this._postcode = postcode;

  String _preferedCommunication;
  String get preferedCommunication => _$this._preferedCommunication;
  set preferedCommunication(String preferedCommunication) =>
      _$this._preferedCommunication = preferedCommunication;

  String _preferedPaymentMethod;
  String get preferedPaymentMethod => _$this._preferedPaymentMethod;
  set preferedPaymentMethod(String preferedPaymentMethod) =>
      _$this._preferedPaymentMethod = preferedPaymentMethod;

  int _user;
  int get user => _$this._user;
  set user(int user) => _$this._user = user;

  CustomerBuilder();

  CustomerBuilder get _$this {
    if (_$v != null) {
      _address = _$v.address;
      _city = _$v.city;
      _company = _$v.company;
      _customerStatus = _$v.customerStatus;
      _firstName = _$v.firstName;
      _gender = _$v.gender;
      _id = _$v.id;
      _lastName = _$v.lastName;
      _postcode = _$v.postcode;
      _preferedCommunication = _$v.preferedCommunication;
      _preferedPaymentMethod = _$v.preferedPaymentMethod;
      _user = _$v.user;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Customer other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Customer;
  }

  @override
  void update(void Function(CustomerBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Customer build() {
    final _$result = _$v ??
        new _$Customer._(
            address: address,
            city: city,
            company: company,
            customerStatus: customerStatus,
            firstName: firstName,
            gender: gender,
            id: id,
            lastName: lastName,
            postcode: postcode,
            preferedCommunication: preferedCommunication,
            preferedPaymentMethod: preferedPaymentMethod,
            user: user);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
