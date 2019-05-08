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
    if (object.frequency != null) {
      result
        ..add('frequency')
        ..add(serializers.serialize(object.frequency,
            specifiedType: const FullType(int)));
    }
    if (object.address != null) {
      result
        ..add('address')
        ..add(serializers.serialize(object.address,
            specifiedType: const FullType(String)));
    }
    if (object.contactMethod != null) {
      result
        ..add('contactMethod')
        ..add(serializers.serialize(object.contactMethod,
            specifiedType: const FullType(String)));
    }
    if (object.registrationMethod != null) {
      result
        ..add('registrationMethod')
        ..add(serializers.serialize(object.registrationMethod,
            specifiedType: const FullType(String)));
    }
    if (object.paymentMethod != null) {
      result
        ..add('paymentMethod')
        ..add(serializers.serialize(object.paymentMethod,
            specifiedType: const FullType(String)));
    }
    if (object.email != null) {
      result
        ..add('email')
        ..add(serializers.serialize(object.email,
            specifiedType: const FullType(String)));
    }
    if (object.password != null) {
      result
        ..add('password')
        ..add(serializers.serialize(object.password,
            specifiedType: const FullType(String)));
    }
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
    if (object.leadStatus != null) {
      result
        ..add('leadStatus')
        ..add(serializers.serialize(object.leadStatus,
            specifiedType: const FullType(String)));
    }
    if (object.location != null) {
      result
        ..add('location')
        ..add(serializers.serialize(object.location,
            specifiedType: const FullType(String)));
    }
    if (object.phoneNumber != null) {
      result
        ..add('phoneNumber')
        ..add(serializers.serialize(object.phoneNumber,
            specifiedType: const FullType(String)));
    }
    if (object.postcode != null) {
      result
        ..add('postcode')
        ..add(serializers.serialize(object.postcode,
            specifiedType: const FullType(int)));
    }
    if (object.selectedLocationIndex != null) {
      result
        ..add('selectedLocationIndex')
        ..add(serializers.serialize(object.selectedLocationIndex,
            specifiedType: const FullType(int)));
    }
    if (object.selectedPackage != null) {
      result
        ..add('selectedPackage')
        ..add(serializers.serialize(object.selectedPackage,
            specifiedType: const FullType(int)));
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
    if (object.wantsContainers != null) {
      result
        ..add('wantsContainers')
        ..add(serializers.serialize(object.wantsContainers,
            specifiedType: const FullType(bool)));
    }
    if (object.wantsReminder != null) {
      result
        ..add('wantsReminder')
        ..add(serializers.serialize(object.wantsReminder,
            specifiedType: const FullType(bool)));
    }
    if (object.selectedStartDate != null) {
      result
        ..add('selectedStartDate')
        ..add(serializers.serialize(object.selectedStartDate,
            specifiedType: const FullType(DateTime)));
    }
    if (object.startDates != null) {
      result
        ..add('startDates')
        ..add(serializers.serialize(object.startDates,
            specifiedType:
                const FullType(BuiltList, const [const FullType(DateTime)])));
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
        case 'frequency':
          result.frequency = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'contactMethod':
          result.contactMethod = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'registrationMethod':
          result.registrationMethod = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'paymentMethod':
          result.paymentMethod = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'firstName':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'lastName':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'leadStatus':
          result.leadStatus = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'location':
          result.location = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'phoneNumber':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'postcode':
          result.postcode = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'selectedLocationIndex':
          result.selectedLocationIndex = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'selectedPackage':
          result.selectedPackage = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'smallContainerQuantity':
          result.smallContainerQuantity = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'bigContainerQuantity':
          result.bigContainerQuantity = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'wantsContainers':
          result.wantsContainers = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'wantsReminder':
          result.wantsReminder = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'selectedStartDate':
          result.selectedStartDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'startDates':
          result.startDates.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(DateTime)])) as BuiltList);
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
  final int frequency;
  @override
  final String address;
  @override
  final String contactMethod;
  @override
  final String registrationMethod;
  @override
  final String paymentMethod;
  @override
  final String email;
  @override
  final String password;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String leadStatus;
  @override
  final String location;
  @override
  final String phoneNumber;
  @override
  final int postcode;
  @override
  final int selectedLocationIndex;
  @override
  final int selectedPackage;
  @override
  final int smallContainerQuantity;
  @override
  final int bigContainerQuantity;
  @override
  final bool wantsContainers;
  @override
  final bool wantsReminder;
  @override
  final DateTime selectedStartDate;
  @override
  final BuiltList<DateTime> startDates;

  factory _$SubscriptionForm(
          [void Function(SubscriptionFormBuilder) updates]) =>
      (new SubscriptionFormBuilder()..update(updates)).build();

  _$SubscriptionForm._(
      {this.currentStep,
      this.frequency,
      this.address,
      this.contactMethod,
      this.registrationMethod,
      this.paymentMethod,
      this.email,
      this.password,
      this.firstName,
      this.lastName,
      this.leadStatus,
      this.location,
      this.phoneNumber,
      this.postcode,
      this.selectedLocationIndex,
      this.selectedPackage,
      this.smallContainerQuantity,
      this.bigContainerQuantity,
      this.wantsContainers,
      this.wantsReminder,
      this.selectedStartDate,
      this.startDates})
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
        frequency == other.frequency &&
        address == other.address &&
        contactMethod == other.contactMethod &&
        registrationMethod == other.registrationMethod &&
        paymentMethod == other.paymentMethod &&
        email == other.email &&
        password == other.password &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        leadStatus == other.leadStatus &&
        location == other.location &&
        phoneNumber == other.phoneNumber &&
        postcode == other.postcode &&
        selectedLocationIndex == other.selectedLocationIndex &&
        selectedPackage == other.selectedPackage &&
        smallContainerQuantity == other.smallContainerQuantity &&
        bigContainerQuantity == other.bigContainerQuantity &&
        wantsContainers == other.wantsContainers &&
        wantsReminder == other.wantsReminder &&
        selectedStartDate == other.selectedStartDate &&
        startDates == other.startDates;
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
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc(0, currentStep.hashCode), frequency.hashCode), address.hashCode),
                                                                                contactMethod.hashCode),
                                                                            registrationMethod.hashCode),
                                                                        paymentMethod.hashCode),
                                                                    email.hashCode),
                                                                password.hashCode),
                                                            firstName.hashCode),
                                                        lastName.hashCode),
                                                    leadStatus.hashCode),
                                                location.hashCode),
                                            phoneNumber.hashCode),
                                        postcode.hashCode),
                                    selectedLocationIndex.hashCode),
                                selectedPackage.hashCode),
                            smallContainerQuantity.hashCode),
                        bigContainerQuantity.hashCode),
                    wantsContainers.hashCode),
                wantsReminder.hashCode),
            selectedStartDate.hashCode),
        startDates.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SubscriptionForm')
          ..add('currentStep', currentStep)
          ..add('frequency', frequency)
          ..add('address', address)
          ..add('contactMethod', contactMethod)
          ..add('registrationMethod', registrationMethod)
          ..add('paymentMethod', paymentMethod)
          ..add('email', email)
          ..add('password', password)
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('leadStatus', leadStatus)
          ..add('location', location)
          ..add('phoneNumber', phoneNumber)
          ..add('postcode', postcode)
          ..add('selectedLocationIndex', selectedLocationIndex)
          ..add('selectedPackage', selectedPackage)
          ..add('smallContainerQuantity', smallContainerQuantity)
          ..add('bigContainerQuantity', bigContainerQuantity)
          ..add('wantsContainers', wantsContainers)
          ..add('wantsReminder', wantsReminder)
          ..add('selectedStartDate', selectedStartDate)
          ..add('startDates', startDates))
        .toString();
  }
}

class SubscriptionFormBuilder
    implements Builder<SubscriptionForm, SubscriptionFormBuilder> {
  _$SubscriptionForm _$v;

  int _currentStep;
  int get currentStep => _$this._currentStep;
  set currentStep(int currentStep) => _$this._currentStep = currentStep;

  int _frequency;
  int get frequency => _$this._frequency;
  set frequency(int frequency) => _$this._frequency = frequency;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  String _contactMethod;
  String get contactMethod => _$this._contactMethod;
  set contactMethod(String contactMethod) =>
      _$this._contactMethod = contactMethod;

  String _registrationMethod;
  String get registrationMethod => _$this._registrationMethod;
  set registrationMethod(String registrationMethod) =>
      _$this._registrationMethod = registrationMethod;

  String _paymentMethod;
  String get paymentMethod => _$this._paymentMethod;
  set paymentMethod(String paymentMethod) =>
      _$this._paymentMethod = paymentMethod;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  String _firstName;
  String get firstName => _$this._firstName;
  set firstName(String firstName) => _$this._firstName = firstName;

  String _lastName;
  String get lastName => _$this._lastName;
  set lastName(String lastName) => _$this._lastName = lastName;

  String _leadStatus;
  String get leadStatus => _$this._leadStatus;
  set leadStatus(String leadStatus) => _$this._leadStatus = leadStatus;

  String _location;
  String get location => _$this._location;
  set location(String location) => _$this._location = location;

  String _phoneNumber;
  String get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String phoneNumber) => _$this._phoneNumber = phoneNumber;

  int _postcode;
  int get postcode => _$this._postcode;
  set postcode(int postcode) => _$this._postcode = postcode;

  int _selectedLocationIndex;
  int get selectedLocationIndex => _$this._selectedLocationIndex;
  set selectedLocationIndex(int selectedLocationIndex) =>
      _$this._selectedLocationIndex = selectedLocationIndex;

  int _selectedPackage;
  int get selectedPackage => _$this._selectedPackage;
  set selectedPackage(int selectedPackage) =>
      _$this._selectedPackage = selectedPackage;

  int _smallContainerQuantity;
  int get smallContainerQuantity => _$this._smallContainerQuantity;
  set smallContainerQuantity(int smallContainerQuantity) =>
      _$this._smallContainerQuantity = smallContainerQuantity;

  int _bigContainerQuantity;
  int get bigContainerQuantity => _$this._bigContainerQuantity;
  set bigContainerQuantity(int bigContainerQuantity) =>
      _$this._bigContainerQuantity = bigContainerQuantity;

  bool _wantsContainers;
  bool get wantsContainers => _$this._wantsContainers;
  set wantsContainers(bool wantsContainers) =>
      _$this._wantsContainers = wantsContainers;

  bool _wantsReminder;
  bool get wantsReminder => _$this._wantsReminder;
  set wantsReminder(bool wantsReminder) =>
      _$this._wantsReminder = wantsReminder;

  DateTime _selectedStartDate;
  DateTime get selectedStartDate => _$this._selectedStartDate;
  set selectedStartDate(DateTime selectedStartDate) =>
      _$this._selectedStartDate = selectedStartDate;

  ListBuilder<DateTime> _startDates;
  ListBuilder<DateTime> get startDates =>
      _$this._startDates ??= new ListBuilder<DateTime>();
  set startDates(ListBuilder<DateTime> startDates) =>
      _$this._startDates = startDates;

  SubscriptionFormBuilder();

  SubscriptionFormBuilder get _$this {
    if (_$v != null) {
      _currentStep = _$v.currentStep;
      _frequency = _$v.frequency;
      _address = _$v.address;
      _contactMethod = _$v.contactMethod;
      _registrationMethod = _$v.registrationMethod;
      _paymentMethod = _$v.paymentMethod;
      _email = _$v.email;
      _password = _$v.password;
      _firstName = _$v.firstName;
      _lastName = _$v.lastName;
      _leadStatus = _$v.leadStatus;
      _location = _$v.location;
      _phoneNumber = _$v.phoneNumber;
      _postcode = _$v.postcode;
      _selectedLocationIndex = _$v.selectedLocationIndex;
      _selectedPackage = _$v.selectedPackage;
      _smallContainerQuantity = _$v.smallContainerQuantity;
      _bigContainerQuantity = _$v.bigContainerQuantity;
      _wantsContainers = _$v.wantsContainers;
      _wantsReminder = _$v.wantsReminder;
      _selectedStartDate = _$v.selectedStartDate;
      _startDates = _$v.startDates?.toBuilder();
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
    _$SubscriptionForm _$result;
    try {
      _$result = _$v ??
          new _$SubscriptionForm._(
              currentStep: currentStep,
              frequency: frequency,
              address: address,
              contactMethod: contactMethod,
              registrationMethod: registrationMethod,
              paymentMethod: paymentMethod,
              email: email,
              password: password,
              firstName: firstName,
              lastName: lastName,
              leadStatus: leadStatus,
              location: location,
              phoneNumber: phoneNumber,
              postcode: postcode,
              selectedLocationIndex: selectedLocationIndex,
              selectedPackage: selectedPackage,
              smallContainerQuantity: smallContainerQuantity,
              bigContainerQuantity: bigContainerQuantity,
              wantsContainers: wantsContainers,
              wantsReminder: wantsReminder,
              selectedStartDate: selectedStartDate,
              startDates: _startDates?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'startDates';
        _startDates?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SubscriptionForm', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
