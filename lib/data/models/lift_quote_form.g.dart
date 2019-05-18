// GENERATED CODE - DO NOT MODIFY BY HAND

part of lift_quote_form;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LiftQuoteForm> _$liftQuoteFormSerializer =
    new _$LiftQuoteFormSerializer();

class _$LiftQuoteFormSerializer implements StructuredSerializer<LiftQuoteForm> {
  @override
  final Iterable<Type> types = const [LiftQuoteForm, _$LiftQuoteForm];
  @override
  final String wireName = 'LiftQuoteForm';

  @override
  Iterable serialize(Serializers serializers, LiftQuoteForm object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.currentStep != null) {
      result
        ..add('currentStep')
        ..add(serializers.serialize(object.currentStep,
            specifiedType: const FullType(int)));
    }
    if (object.images != null) {
      result
        ..add('images')
        ..add(serializers.serialize(object.images,
            specifiedType: const FullType(BuiltMap,
                const [const FullType(String), const FullType(LiftImage)])));
    }
    if (object.noCustomerRequired != null) {
      result
        ..add('noCustomerRequired')
        ..add(serializers.serialize(object.noCustomerRequired,
            specifiedType: const FullType(bool)));
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
            specifiedType: const FullType(bool)));
    }

    return result;
  }

  @override
  LiftQuoteForm deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LiftQuoteFormBuilder();

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
        case 'images':
          result.images.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(String),
                const FullType(LiftImage)
              ])) as BuiltMap);
          break;
        case 'noCustomerRequired':
          result.noCustomerRequired = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
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
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$LiftQuoteForm extends LiftQuoteForm {
  @override
  final int currentStep;
  @override
  final BuiltMap<String, LiftImage> images;
  @override
  final bool noCustomerRequired;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String address;
  @override
  final int postcode;
  @override
  final int floor;
  @override
  final bool elevator;
  @override
  final bool note;

  factory _$LiftQuoteForm([void Function(LiftQuoteFormBuilder) updates]) =>
      (new LiftQuoteFormBuilder()..update(updates)).build();

  _$LiftQuoteForm._(
      {this.currentStep,
      this.images,
      this.noCustomerRequired,
      this.firstName,
      this.lastName,
      this.address,
      this.postcode,
      this.floor,
      this.elevator,
      this.note})
      : super._();

  @override
  LiftQuoteForm rebuild(void Function(LiftQuoteFormBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LiftQuoteFormBuilder toBuilder() => new LiftQuoteFormBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LiftQuoteForm &&
        currentStep == other.currentStep &&
        images == other.images &&
        noCustomerRequired == other.noCustomerRequired &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        address == other.address &&
        postcode == other.postcode &&
        floor == other.floor &&
        elevator == other.elevator &&
        note == other.note;
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
                                    $jc($jc(0, currentStep.hashCode),
                                        images.hashCode),
                                    noCustomerRequired.hashCode),
                                firstName.hashCode),
                            lastName.hashCode),
                        address.hashCode),
                    postcode.hashCode),
                floor.hashCode),
            elevator.hashCode),
        note.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LiftQuoteForm')
          ..add('currentStep', currentStep)
          ..add('images', images)
          ..add('noCustomerRequired', noCustomerRequired)
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('address', address)
          ..add('postcode', postcode)
          ..add('floor', floor)
          ..add('elevator', elevator)
          ..add('note', note))
        .toString();
  }
}

class LiftQuoteFormBuilder
    implements Builder<LiftQuoteForm, LiftQuoteFormBuilder> {
  _$LiftQuoteForm _$v;

  int _currentStep;
  int get currentStep => _$this._currentStep;
  set currentStep(int currentStep) => _$this._currentStep = currentStep;

  MapBuilder<String, LiftImage> _images;
  MapBuilder<String, LiftImage> get images =>
      _$this._images ??= new MapBuilder<String, LiftImage>();
  set images(MapBuilder<String, LiftImage> images) => _$this._images = images;

  bool _noCustomerRequired;
  bool get noCustomerRequired => _$this._noCustomerRequired;
  set noCustomerRequired(bool noCustomerRequired) =>
      _$this._noCustomerRequired = noCustomerRequired;

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

  int _floor;
  int get floor => _$this._floor;
  set floor(int floor) => _$this._floor = floor;

  bool _elevator;
  bool get elevator => _$this._elevator;
  set elevator(bool elevator) => _$this._elevator = elevator;

  bool _note;
  bool get note => _$this._note;
  set note(bool note) => _$this._note = note;

  LiftQuoteFormBuilder();

  LiftQuoteFormBuilder get _$this {
    if (_$v != null) {
      _currentStep = _$v.currentStep;
      _images = _$v.images?.toBuilder();
      _noCustomerRequired = _$v.noCustomerRequired;
      _firstName = _$v.firstName;
      _lastName = _$v.lastName;
      _address = _$v.address;
      _postcode = _$v.postcode;
      _floor = _$v.floor;
      _elevator = _$v.elevator;
      _note = _$v.note;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LiftQuoteForm other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LiftQuoteForm;
  }

  @override
  void update(void Function(LiftQuoteFormBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LiftQuoteForm build() {
    _$LiftQuoteForm _$result;
    try {
      _$result = _$v ??
          new _$LiftQuoteForm._(
              currentStep: currentStep,
              images: _images?.build(),
              noCustomerRequired: noCustomerRequired,
              firstName: firstName,
              lastName: lastName,
              address: address,
              postcode: postcode,
              floor: floor,
              elevator: elevator,
              note: note);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'images';
        _images?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'LiftQuoteForm', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
