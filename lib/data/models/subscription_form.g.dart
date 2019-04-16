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
    if (object.packageId != null) {
      result
        ..add('packageId')
        ..add(serializers.serialize(object.packageId,
            specifiedType: const FullType(int)));
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
    if (object.appRegistration != null) {
      result
        ..add('appRegistration')
        ..add(serializers.serialize(object.appRegistration,
            specifiedType: const FullType(bool)));
    }
    if (object.smallBins != null) {
      result
        ..add('smallBins')
        ..add(serializers.serialize(object.smallBins,
            specifiedType: const FullType(int)));
    }
    if (object.bigBins != null) {
      result
        ..add('bigBins')
        ..add(serializers.serialize(object.bigBins,
            specifiedType: const FullType(int)));
    }
    if (object.accessType != null) {
      result
        ..add('accessType')
        ..add(serializers.serialize(object.accessType,
            specifiedType: const FullType(int)));
    }
    if (object.code != null) {
      result
        ..add('code')
        ..add(serializers.serialize(object.code,
            specifiedType: const FullType(String)));
    }
    if (object.doorKey != null) {
      result
        ..add('doorKey')
        ..add(serializers.serialize(object.doorKey,
            specifiedType: const FullType(bool)));
    }
    if (object.note != null) {
      result
        ..add('note')
        ..add(serializers.serialize(object.note,
            specifiedType: const FullType(String)));
    }
    if (object.phoneNumber != null) {
      result
        ..add('phoneNumber')
        ..add(serializers.serialize(object.phoneNumber,
            specifiedType: const FullType(String)));
    }
    if (object.startDate != null) {
      result
        ..add('startDate')
        ..add(serializers.serialize(object.startDate,
            specifiedType: const FullType(DateTime)));
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
        case 'packageId':
          result.packageId = serializers.deserialize(value,
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
        case 'appRegistration':
          result.appRegistration = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'smallBins':
          result.smallBins = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'bigBins':
          result.bigBins = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'accessType':
          result.accessType = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'code':
          result.code = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'doorKey':
          result.doorKey = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'note':
          result.note = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'phoneNumber':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'startDate':
          result.startDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
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
  final int packageId;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String address;
  @override
  final int postcode;
  @override
  final bool appRegistration;
  @override
  final int smallBins;
  @override
  final int bigBins;
  @override
  final int accessType;
  @override
  final String code;
  @override
  final bool doorKey;
  @override
  final String note;
  @override
  final String phoneNumber;
  @override
  final DateTime startDate;
  @override
  final String email;
  @override
  final String password;

  factory _$SubscriptionForm([void updates(SubscriptionFormBuilder b)]) =>
      (new SubscriptionFormBuilder()..update(updates)).build();

  _$SubscriptionForm._(
      {this.currentStep,
      this.packageId,
      this.firstName,
      this.lastName,
      this.address,
      this.postcode,
      this.appRegistration,
      this.smallBins,
      this.bigBins,
      this.accessType,
      this.code,
      this.doorKey,
      this.note,
      this.phoneNumber,
      this.startDate,
      this.email,
      this.password})
      : super._() {
    if (currentStep == null) {
      throw new BuiltValueNullFieldError('SubscriptionForm', 'currentStep');
    }
  }

  @override
  SubscriptionForm rebuild(void updates(SubscriptionFormBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SubscriptionFormBuilder toBuilder() =>
      new SubscriptionFormBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SubscriptionForm &&
        currentStep == other.currentStep &&
        packageId == other.packageId &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        address == other.address &&
        postcode == other.postcode &&
        appRegistration == other.appRegistration &&
        smallBins == other.smallBins &&
        bigBins == other.bigBins &&
        accessType == other.accessType &&
        code == other.code &&
        doorKey == other.doorKey &&
        note == other.note &&
        phoneNumber == other.phoneNumber &&
        startDate == other.startDate &&
        email == other.email &&
        password == other.password;
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
                                                                        0,
                                                                        currentStep
                                                                            .hashCode),
                                                                    packageId
                                                                        .hashCode),
                                                                firstName
                                                                    .hashCode),
                                                            lastName.hashCode),
                                                        address.hashCode),
                                                    postcode.hashCode),
                                                appRegistration.hashCode),
                                            smallBins.hashCode),
                                        bigBins.hashCode),
                                    accessType.hashCode),
                                code.hashCode),
                            doorKey.hashCode),
                        note.hashCode),
                    phoneNumber.hashCode),
                startDate.hashCode),
            email.hashCode),
        password.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SubscriptionForm')
          ..add('currentStep', currentStep)
          ..add('packageId', packageId)
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('address', address)
          ..add('postcode', postcode)
          ..add('appRegistration', appRegistration)
          ..add('smallBins', smallBins)
          ..add('bigBins', bigBins)
          ..add('accessType', accessType)
          ..add('code', code)
          ..add('doorKey', doorKey)
          ..add('note', note)
          ..add('phoneNumber', phoneNumber)
          ..add('startDate', startDate)
          ..add('email', email)
          ..add('password', password))
        .toString();
  }
}

class SubscriptionFormBuilder
    implements Builder<SubscriptionForm, SubscriptionFormBuilder> {
  _$SubscriptionForm _$v;

  int _currentStep;
  int get currentStep => _$this._currentStep;
  set currentStep(int currentStep) => _$this._currentStep = currentStep;

  int _packageId;
  int get packageId => _$this._packageId;
  set packageId(int packageId) => _$this._packageId = packageId;

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

  bool _appRegistration;
  bool get appRegistration => _$this._appRegistration;
  set appRegistration(bool appRegistration) =>
      _$this._appRegistration = appRegistration;

  int _smallBins;
  int get smallBins => _$this._smallBins;
  set smallBins(int smallBins) => _$this._smallBins = smallBins;

  int _bigBins;
  int get bigBins => _$this._bigBins;
  set bigBins(int bigBins) => _$this._bigBins = bigBins;

  int _accessType;
  int get accessType => _$this._accessType;
  set accessType(int accessType) => _$this._accessType = accessType;

  String _code;
  String get code => _$this._code;
  set code(String code) => _$this._code = code;

  bool _doorKey;
  bool get doorKey => _$this._doorKey;
  set doorKey(bool doorKey) => _$this._doorKey = doorKey;

  String _note;
  String get note => _$this._note;
  set note(String note) => _$this._note = note;

  String _phoneNumber;
  String get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String phoneNumber) => _$this._phoneNumber = phoneNumber;

  DateTime _startDate;
  DateTime get startDate => _$this._startDate;
  set startDate(DateTime startDate) => _$this._startDate = startDate;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  String _password;
  String get password => _$this._password;
  set password(String password) => _$this._password = password;

  SubscriptionFormBuilder();

  SubscriptionFormBuilder get _$this {
    if (_$v != null) {
      _currentStep = _$v.currentStep;
      _packageId = _$v.packageId;
      _firstName = _$v.firstName;
      _lastName = _$v.lastName;
      _address = _$v.address;
      _postcode = _$v.postcode;
      _appRegistration = _$v.appRegistration;
      _smallBins = _$v.smallBins;
      _bigBins = _$v.bigBins;
      _accessType = _$v.accessType;
      _code = _$v.code;
      _doorKey = _$v.doorKey;
      _note = _$v.note;
      _phoneNumber = _$v.phoneNumber;
      _startDate = _$v.startDate;
      _email = _$v.email;
      _password = _$v.password;
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
  void update(void updates(SubscriptionFormBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$SubscriptionForm build() {
    final _$result = _$v ??
        new _$SubscriptionForm._(
            currentStep: currentStep,
            packageId: packageId,
            firstName: firstName,
            lastName: lastName,
            address: address,
            postcode: postcode,
            appRegistration: appRegistration,
            smallBins: smallBins,
            bigBins: bigBins,
            accessType: accessType,
            code: code,
            doorKey: doorKey,
            note: note,
            phoneNumber: phoneNumber,
            startDate: startDate,
            email: email,
            password: password);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
