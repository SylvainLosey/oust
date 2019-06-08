// GENERATED CODE - DO NOT MODIFY BY HAND

part of lift_book_form;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LiftBookForm> _$liftBookFormSerializer =
    new _$LiftBookFormSerializer();

class _$LiftBookFormSerializer implements StructuredSerializer<LiftBookForm> {
  @override
  final Iterable<Type> types = const [LiftBookForm, _$LiftBookForm];
  @override
  final String wireName = 'LiftBookForm';

  @override
  Iterable serialize(Serializers serializers, LiftBookForm object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.currentStep != null) {
      result
        ..add('currentStep')
        ..add(serializers.serialize(object.currentStep,
            specifiedType: const FullType(int)));
    }
    if (object.noCustomerRequired != null) {
      result
        ..add('noCustomerRequired')
        ..add(serializers.serialize(object.noCustomerRequired,
            specifiedType: const FullType(bool)));
    }
    if (object.liftSlots != null) {
      result
        ..add('liftSlots')
        ..add(serializers.serialize(object.liftSlots,
            specifiedType:
                const FullType(BuiltList, const [const FullType(DateTime)])));
    }
    if (object.selectedLiftSlot != null) {
      result
        ..add('selectedLiftSlot')
        ..add(serializers.serialize(object.selectedLiftSlot,
            specifiedType: const FullType(DateTime)));
    }

    return result;
  }

  @override
  LiftBookForm deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LiftBookFormBuilder();

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
        case 'noCustomerRequired':
          result.noCustomerRequired = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'liftSlots':
          result.liftSlots.replace(serializers.deserialize(value,
              specifiedType: const FullType(
                  BuiltList, const [const FullType(DateTime)])) as BuiltList);
          break;
        case 'selectedLiftSlot':
          result.selectedLiftSlot = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime;
          break;
      }
    }

    return result.build();
  }
}

class _$LiftBookForm extends LiftBookForm {
  @override
  final int currentStep;
  @override
  final bool noCustomerRequired;
  @override
  final BuiltList<DateTime> liftSlots;
  @override
  final DateTime selectedLiftSlot;

  factory _$LiftBookForm([void Function(LiftBookFormBuilder) updates]) =>
      (new LiftBookFormBuilder()..update(updates)).build();

  _$LiftBookForm._(
      {this.currentStep,
      this.noCustomerRequired,
      this.liftSlots,
      this.selectedLiftSlot})
      : super._();

  @override
  LiftBookForm rebuild(void Function(LiftBookFormBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LiftBookFormBuilder toBuilder() => new LiftBookFormBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LiftBookForm &&
        currentStep == other.currentStep &&
        noCustomerRequired == other.noCustomerRequired &&
        liftSlots == other.liftSlots &&
        selectedLiftSlot == other.selectedLiftSlot;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, currentStep.hashCode), noCustomerRequired.hashCode),
            liftSlots.hashCode),
        selectedLiftSlot.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LiftBookForm')
          ..add('currentStep', currentStep)
          ..add('noCustomerRequired', noCustomerRequired)
          ..add('liftSlots', liftSlots)
          ..add('selectedLiftSlot', selectedLiftSlot))
        .toString();
  }
}

class LiftBookFormBuilder
    implements Builder<LiftBookForm, LiftBookFormBuilder> {
  _$LiftBookForm _$v;

  int _currentStep;
  int get currentStep => _$this._currentStep;
  set currentStep(int currentStep) => _$this._currentStep = currentStep;

  bool _noCustomerRequired;
  bool get noCustomerRequired => _$this._noCustomerRequired;
  set noCustomerRequired(bool noCustomerRequired) =>
      _$this._noCustomerRequired = noCustomerRequired;

  ListBuilder<DateTime> _liftSlots;
  ListBuilder<DateTime> get liftSlots =>
      _$this._liftSlots ??= new ListBuilder<DateTime>();
  set liftSlots(ListBuilder<DateTime> liftSlots) =>
      _$this._liftSlots = liftSlots;

  DateTime _selectedLiftSlot;
  DateTime get selectedLiftSlot => _$this._selectedLiftSlot;
  set selectedLiftSlot(DateTime selectedLiftSlot) =>
      _$this._selectedLiftSlot = selectedLiftSlot;

  LiftBookFormBuilder();

  LiftBookFormBuilder get _$this {
    if (_$v != null) {
      _currentStep = _$v.currentStep;
      _noCustomerRequired = _$v.noCustomerRequired;
      _liftSlots = _$v.liftSlots?.toBuilder();
      _selectedLiftSlot = _$v.selectedLiftSlot;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LiftBookForm other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LiftBookForm;
  }

  @override
  void update(void Function(LiftBookFormBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LiftBookForm build() {
    _$LiftBookForm _$result;
    try {
      _$result = _$v ??
          new _$LiftBookForm._(
              currentStep: currentStep,
              noCustomerRequired: noCustomerRequired,
              liftSlots: _liftSlots?.build(),
              selectedLiftSlot: selectedLiftSlot);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'liftSlots';
        _liftSlots?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'LiftBookForm', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
