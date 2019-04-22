// GENERATED CODE - DO NOT MODIFY BY HAND

part of subscriptionForm;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SubscriptionForm> _$subscriptionFormSerializer =
    new _$SubscriptionFormSerializer();

class _$SubscriptionFormSerializer
    implements StructuredSerializer<SubscriptionForm> {
  @override
  final Iterable<Type> types = const [SubscriptionForm, _$SubscriptionForm];
  @override
  final String wireName = 'SubscriptionForm';

  @override
  Iterable serialize(Serializers serializers, SubscriptionForm object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'currentStep',
      serializers.serialize(object.currentStep,
          specifiedType: const FullType(int)),
    ];
    if (object.firstName != null) {
      result
        ..add('firstName')
        ..add(serializers.serialize(object.firstName,
            specifiedType: const FullType(String)));
    }
    if (object.lastName != null) {
      result
        ..add('lastName')
        ..add(serializers.serialize(object.lastName,
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
    if (object.email != null) {
      result
        ..add('email')
        ..add(serializers.serialize(object.email,
            specifiedType: const FullType(String)));
    }
    if (object.phoneNumber != null) {
      result
        ..add('phoneNumber')
        ..add(serializers.serialize(object.phoneNumber,
            specifiedType: const FullType(String)));
    }
    if (object.registrationMethod != null) {
      result
        ..add('registrationMethod')
        ..add(serializers.serialize(object.registrationMethod,
            specifiedType: const FullType(String)));
    }
    if (object.contactMethod != null) {
      result
        ..add('contactMethod')
        ..add(serializers.serialize(object.contactMethod,
            specifiedType: const FullType(String)));
    }
    if (object.leadStatus != null) {
      result
        ..add('leadStatus')
        ..add(serializers.serialize(object.leadStatus,
            specifiedType: const FullType(String)));
    }
    if (object.wantsContainers != null) {
      result
        ..add('wantsContainers')
        ..add(serializers.serialize(object.wantsContainers,
            specifiedType: const FullType(bool)));
    }
    if (object.smallContainerQuantity != null) {
      result
        ..add('smallContainerQuantity')
        ..add(serializers.serialize(object.smallContainerQuantity,
            specifiedType: const FullType(int)));
    }
    if (object.bigContainerQuantity != null) {
      result
        ..add('bigContainerQuantity')
        ..add(serializers.serialize(object.bigContainerQuantity,
            specifiedType: const FullType(int)));
    }
    if (object.selectedLocationIndex != null) {
      result
        ..add('selectedLocationIndex')
        ..add(serializers.serialize(object.selectedLocationIndex,
            specifiedType: const FullType(int)));
    }
    if (object.location != null) {
      result
        ..add('location')
        ..add(serializers.serialize(object.location,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  SubscriptionForm deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SubscriptionFormBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'currentStep':
          result.currentStep = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'firstName':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'lastName':
          result.lastName = serializers.deserialize(value,
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
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'phoneNumber':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'registrationMethod':
          result.registrationMethod = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'contactMethod':
          result.contactMethod = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'leadStatus':
          result.leadStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'wantsContainers':
          result.wantsContainers = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'smallContainerQuantity':
          result.smallContainerQuantity = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'bigContainerQuantity':
          result.bigContainerQuantity = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'selectedLocationIndex':
          result.selectedLocationIndex = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$SubscriptionForm extends SubscriptionForm {
  @override
  final int currentStep;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String address;
  @override
  final int postcode;
  @override
  final String email;
  @override
  final String phoneNumber;
  @override
  final String registrationMethod;
  @override
  final String contactMethod;
  @override
  final String leadStatus;
  @override
  final bool wantsContainers;
  @override
  final int smallContainerQuantity;
  @override
  final int bigContainerQuantity;
  @override
  final int selectedLocationIndex;
  @override
  final String location;

  factory _$SubscriptionForm(
          [void Function(SubscriptionFormBuilder) updates]) =>
      (new SubscriptionFormBuilder()..update(updates)).build();

  _$SubscriptionForm._(
      {this.currentStep,
      this.firstName,
      this.lastName,
      this.address,
      this.postcode,
      this.email,
      this.phoneNumber,
      this.registrationMethod,
      this.contactMethod,
      this.leadStatus,
      this.wantsContainers,
      this.smallContainerQuantity,
      this.bigContainerQuantity,
      this.selectedLocationIndex,
      this.location})
      : super._() {
    if (currentStep == null) {
      throw new BuiltValueNullFieldError('SubscriptionForm', 'currentStep');
    }
  }

  @override
  SubscriptionForm rebuild(void Function(SubscriptionFormBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubscriptionFormBuilder toBuilder() =>
      new SubscriptionFormBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SubscriptionForm &&
        currentStep == other.currentStep &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        address == other.address &&
        postcode == other.postcode &&
        email == other.email &&
        phoneNumber == other.phoneNumber &&
        registrationMethod == other.registrationMethod &&
        contactMethod == other.contactMethod &&
        leadStatus == other.leadStatus &&
        wantsContainers == other.wantsContainers &&
        smallContainerQuantity == other.smallContainerQuantity &&
        bigContainerQuantity == other.bigContainerQuantity &&
        selectedLocationIndex == other.selectedLocationIndex &&
        location == other.location;
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
                                                                currentStep
                                                                    .hashCode),
                                                            firstName.hashCode),
                                                        lastName.hashCode),
                                                    address.hashCode),
                                                postcode.hashCode),
                                            email.hashCode),
                                        phoneNumber.hashCode),
                                    registrationMethod.hashCode),
                                contactMethod.hashCode),
                            leadStatus.hashCode),
                        wantsContainers.hashCode),
                    smallContainerQuantity.hashCode),
                bigContainerQuantity.hashCode),
            selectedLocationIndex.hashCode),
        location.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SubscriptionForm')
          ..add('currentStep', currentStep)
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('address', address)
          ..add('postcode', postcode)
          ..add('email', email)
          ..add('phoneNumber', phoneNumber)
          ..add('registrationMethod', registrationMethod)
          ..add('contactMethod', contactMethod)
          ..add('leadStatus', leadStatus)
          ..add('wantsContainers', wantsContainers)
          ..add('smallContainerQuantity', smallContainerQuantity)
          ..add('bigContainerQuantity', bigContainerQuantity)
          ..add('selectedLocationIndex', selectedLocationIndex)
          ..add('location', location))
        .toString();
  }
}

class SubscriptionFormBuilder
    implements Builder<SubscriptionForm, SubscriptionFormBuilder> {
  _$SubscriptionForm _$v;

  int _currentStep;
  int get currentStep => _$this._currentStep;
  set currentStep(int currentStep) => _$this._currentStep = currentStep;

  String _firstName;
  String get firstName => _$this._firstName;
  set firstName(String firstName) => _$this._firstName = firstName;

  String _lastName;
  String get lastName => _$this._lastName;
  set lastName(String lastName) => _$this._lastName = lastName;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  int _postcode;
  int get postcode => _$this._postcode;
  set postcode(int postcode) => _$this._postcode = postcode;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _phoneNumber;
  String get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String phoneNumber) => _$this._phoneNumber = phoneNumber;

  String _registrationMethod;
  String get registrationMethod => _$this._registrationMethod;
  set registrationMethod(String registrationMethod) =>
      _$this._registrationMethod = registrationMethod;

  String _contactMethod;
  String get contactMethod => _$this._contactMethod;
  set contactMethod(String contactMethod) =>
      _$this._contactMethod = contactMethod;

  String _leadStatus;
  String get leadStatus => _$this._leadStatus;
  set leadStatus(String leadStatus) => _$this._leadStatus = leadStatus;

  bool _wantsContainers;
  bool get wantsContainers => _$this._wantsContainers;
  set wantsContainers(bool wantsContainers) =>
      _$this._wantsContainers = wantsContainers;

  int _smallContainerQuantity;
  int get smallContainerQuantity => _$this._smallContainerQuantity;
  set smallContainerQuantity(int smallContainerQuantity) =>
      _$this._smallContainerQuantity = smallContainerQuantity;

  int _bigContainerQuantity;
  int get bigContainerQuantity => _$this._bigContainerQuantity;
  set bigContainerQuantity(int bigContainerQuantity) =>
      _$this._bigContainerQuantity = bigContainerQuantity;

  int _selectedLocationIndex;
  int get selectedLocationIndex => _$this._selectedLocationIndex;
  set selectedLocationIndex(int selectedLocationIndex) =>
      _$this._selectedLocationIndex = selectedLocationIndex;

  String _location;
  String get location => _$this._location;
  set location(String location) => _$this._location = location;

  SubscriptionFormBuilder();

  SubscriptionFormBuilder get _$this {
    if (_$v != null) {
      _currentStep = _$v.currentStep;
      _firstName = _$v.firstName;
      _lastName = _$v.lastName;
      _address = _$v.address;
      _postcode = _$v.postcode;
      _email = _$v.email;
      _phoneNumber = _$v.phoneNumber;
      _registrationMethod = _$v.registrationMethod;
      _contactMethod = _$v.contactMethod;
      _leadStatus = _$v.leadStatus;
      _wantsContainers = _$v.wantsContainers;
      _smallContainerQuantity = _$v.smallContainerQuantity;
      _bigContainerQuantity = _$v.bigContainerQuantity;
      _selectedLocationIndex = _$v.selectedLocationIndex;
      _location = _$v.location;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SubscriptionForm other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SubscriptionForm;
  }

  @override
  void update(void Function(SubscriptionFormBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SubscriptionForm build() {
    final _$result = _$v ??
        new _$SubscriptionForm._(
            currentStep: currentStep,
            firstName: firstName,
            lastName: lastName,
            address: address,
            postcode: postcode,
            email: email,
            phoneNumber: phoneNumber,
            registrationMethod: registrationMethod,
            contactMethod: contactMethod,
            leadStatus: leadStatus,
            wantsContainers: wantsContainers,
            smallContainerQuantity: smallContainerQuantity,
            bigContainerQuantity: bigContainerQuantity,
            selectedLocationIndex: selectedLocationIndex,
            location: location);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
