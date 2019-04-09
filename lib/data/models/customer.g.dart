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
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'customer_status',
      serializers.serialize(object.customerStatus,
          specifiedType: const FullType(String)),
      'gender',
      serializers.serialize(object.gender,
          specifiedType: const FullType(String)),
      'first_name',
      serializers.serialize(object.firstName,
          specifiedType: const FullType(String)),
      'last_name',
      serializers.serialize(object.lastName,
          specifiedType: const FullType(String)),
      'address',
      serializers.serialize(object.address,
          specifiedType: const FullType(String)),
      'city',
      serializers.serialize(object.city, specifiedType: const FullType(String)),
      'prefered_communication',
      serializers.serialize(object.preferedCommunication,
          specifiedType: const FullType(String)),
      'prefered_payment_method',
      serializers.serialize(object.preferedPaymentMethod,
          specifiedType: const FullType(String)),
      'postcode',
      serializers.serialize(object.postcode,
          specifiedType: const FullType(int)),
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
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'customer_status':
          result.customerStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'company':
          result.company = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'gender':
          result.gender = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'first_name':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'last_name':
          result.lastName = serializers.deserialize(value,
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
        case 'prefered_communication':
          result.preferedCommunication = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'prefered_payment_method':
          result.preferedPaymentMethod = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'postcode':
          result.postcode = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
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
  final int id;
  @override
  final String customerStatus;
  @override
  final String company;
  @override
  final String gender;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String address;
  @override
  final String city;
  @override
  final String preferedCommunication;
  @override
  final String preferedPaymentMethod;
  @override
  final int postcode;
  @override
  final int user;

  factory _$Customer([void updates(CustomerBuilder b)]) =>
      (new CustomerBuilder()..update(updates)).build();

  _$Customer._(
      {this.id,
      this.customerStatus,
      this.company,
      this.gender,
      this.firstName,
      this.lastName,
      this.address,
      this.city,
      this.preferedCommunication,
      this.preferedPaymentMethod,
      this.postcode,
      this.user})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Customer', 'id');
    }
    if (customerStatus == null) {
      throw new BuiltValueNullFieldError('Customer', 'customerStatus');
    }
    if (gender == null) {
      throw new BuiltValueNullFieldError('Customer', 'gender');
    }
    if (firstName == null) {
      throw new BuiltValueNullFieldError('Customer', 'firstName');
    }
    if (lastName == null) {
      throw new BuiltValueNullFieldError('Customer', 'lastName');
    }
    if (address == null) {
      throw new BuiltValueNullFieldError('Customer', 'address');
    }
    if (city == null) {
      throw new BuiltValueNullFieldError('Customer', 'city');
    }
    if (preferedCommunication == null) {
      throw new BuiltValueNullFieldError('Customer', 'preferedCommunication');
    }
    if (preferedPaymentMethod == null) {
      throw new BuiltValueNullFieldError('Customer', 'preferedPaymentMethod');
    }
    if (postcode == null) {
      throw new BuiltValueNullFieldError('Customer', 'postcode');
    }
    if (user == null) {
      throw new BuiltValueNullFieldError('Customer', 'user');
    }
  }

  @override
  Customer rebuild(void updates(CustomerBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  CustomerBuilder toBuilder() => new CustomerBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Customer &&
        id == other.id &&
        customerStatus == other.customerStatus &&
        company == other.company &&
        gender == other.gender &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        address == other.address &&
        city == other.city &&
        preferedCommunication == other.preferedCommunication &&
        preferedPaymentMethod == other.preferedPaymentMethod &&
        postcode == other.postcode &&
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
                                            $jc($jc(0, id.hashCode),
                                                customerStatus.hashCode),
                                            company.hashCode),
                                        gender.hashCode),
                                    firstName.hashCode),
                                lastName.hashCode),
                            address.hashCode),
                        city.hashCode),
                    preferedCommunication.hashCode),
                preferedPaymentMethod.hashCode),
            postcode.hashCode),
        user.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Customer')
          ..add('id', id)
          ..add('customerStatus', customerStatus)
          ..add('company', company)
          ..add('gender', gender)
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('address', address)
          ..add('city', city)
          ..add('preferedCommunication', preferedCommunication)
          ..add('preferedPaymentMethod', preferedPaymentMethod)
          ..add('postcode', postcode)
          ..add('user', user))
        .toString();
  }
}

class CustomerBuilder implements Builder<Customer, CustomerBuilder> {
  _$Customer _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _customerStatus;
  String get customerStatus => _$this._customerStatus;
  set customerStatus(String customerStatus) =>
      _$this._customerStatus = customerStatus;

  String _company;
  String get company => _$this._company;
  set company(String company) => _$this._company = company;

  String _gender;
  String get gender => _$this._gender;
  set gender(String gender) => _$this._gender = gender;

  String _firstName;
  String get firstName => _$this._firstName;
  set firstName(String firstName) => _$this._firstName = firstName;

  String _lastName;
  String get lastName => _$this._lastName;
  set lastName(String lastName) => _$this._lastName = lastName;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  String _city;
  String get city => _$this._city;
  set city(String city) => _$this._city = city;

  String _preferedCommunication;
  String get preferedCommunication => _$this._preferedCommunication;
  set preferedCommunication(String preferedCommunication) =>
      _$this._preferedCommunication = preferedCommunication;

  String _preferedPaymentMethod;
  String get preferedPaymentMethod => _$this._preferedPaymentMethod;
  set preferedPaymentMethod(String preferedPaymentMethod) =>
      _$this._preferedPaymentMethod = preferedPaymentMethod;

  int _postcode;
  int get postcode => _$this._postcode;
  set postcode(int postcode) => _$this._postcode = postcode;

  int _user;
  int get user => _$this._user;
  set user(int user) => _$this._user = user;

  CustomerBuilder();

  CustomerBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _customerStatus = _$v.customerStatus;
      _company = _$v.company;
      _gender = _$v.gender;
      _firstName = _$v.firstName;
      _lastName = _$v.lastName;
      _address = _$v.address;
      _city = _$v.city;
      _preferedCommunication = _$v.preferedCommunication;
      _preferedPaymentMethod = _$v.preferedPaymentMethod;
      _postcode = _$v.postcode;
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
  void update(void updates(CustomerBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Customer build() {
    final _$result = _$v ??
        new _$Customer._(
            id: id,
            customerStatus: customerStatus,
            company: company,
            gender: gender,
            firstName: firstName,
            lastName: lastName,
            address: address,
            city: city,
            preferedCommunication: preferedCommunication,
            preferedPaymentMethod: preferedPaymentMethod,
            postcode: postcode,
            user: user);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
