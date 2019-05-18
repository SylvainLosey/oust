// GENERATED CODE - DO NOT MODIFY BY HAND

part of lift_quote_form_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LiftQuoteFormState> _$liftQuoteFormStateSerializer =
    new _$LiftQuoteFormStateSerializer();

class _$LiftQuoteFormStateSerializer
    implements StructuredSerializer<LiftQuoteFormState> {
  @override
  final Iterable<Type> types = const [LiftQuoteFormState, _$LiftQuoteFormState];
  @override
  final String wireName = 'LiftQuoteFormState';

  @override
  Iterable serialize(Serializers serializers, LiftQuoteFormState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.error != null) {
      result
        ..add('error')
        ..add(serializers.serialize(object.error,
            specifiedType: const FullType(String)));
    }
    if (object.isLoading != null) {
      result
        ..add('isLoading')
        ..add(serializers.serialize(object.isLoading,
            specifiedType: const FullType(bool)));
    }
    if (object.liftQuoteForm != null) {
      result
        ..add('liftQuoteForm')
        ..add(serializers.serialize(object.liftQuoteForm,
            specifiedType: const FullType(LiftQuoteForm)));
    }

    return result;
  }

  @override
  LiftQuoteFormState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LiftQuoteFormStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'error':
          result.error = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'isLoading':
          result.isLoading = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'liftQuoteForm':
          result.liftQuoteForm.replace(serializers.deserialize(value,
              specifiedType: const FullType(LiftQuoteForm)) as LiftQuoteForm);
          break;
      }
    }

    return result.build();
  }
}

class _$LiftQuoteFormState extends LiftQuoteFormState {
  @override
  final String error;
  @override
  final bool isLoading;
  @override
  final LiftQuoteForm liftQuoteForm;

  factory _$LiftQuoteFormState(
          [void Function(LiftQuoteFormStateBuilder) updates]) =>
      (new LiftQuoteFormStateBuilder()..update(updates)).build();

  _$LiftQuoteFormState._({this.error, this.isLoading, this.liftQuoteForm})
      : super._();

  @override
  LiftQuoteFormState rebuild(
          void Function(LiftQuoteFormStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LiftQuoteFormStateBuilder toBuilder() =>
      new LiftQuoteFormStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LiftQuoteFormState &&
        error == other.error &&
        isLoading == other.isLoading &&
        liftQuoteForm == other.liftQuoteForm;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, error.hashCode), isLoading.hashCode),
        liftQuoteForm.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LiftQuoteFormState')
          ..add('error', error)
          ..add('isLoading', isLoading)
          ..add('liftQuoteForm', liftQuoteForm))
        .toString();
  }
}

class LiftQuoteFormStateBuilder
    implements Builder<LiftQuoteFormState, LiftQuoteFormStateBuilder> {
  _$LiftQuoteFormState _$v;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  LiftQuoteFormBuilder _liftQuoteForm;
  LiftQuoteFormBuilder get liftQuoteForm =>
      _$this._liftQuoteForm ??= new LiftQuoteFormBuilder();
  set liftQuoteForm(LiftQuoteFormBuilder liftQuoteForm) =>
      _$this._liftQuoteForm = liftQuoteForm;

  LiftQuoteFormStateBuilder();

  LiftQuoteFormStateBuilder get _$this {
    if (_$v != null) {
      _error = _$v.error;
      _isLoading = _$v.isLoading;
      _liftQuoteForm = _$v.liftQuoteForm?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LiftQuoteFormState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LiftQuoteFormState;
  }

  @override
  void update(void Function(LiftQuoteFormStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LiftQuoteFormState build() {
    _$LiftQuoteFormState _$result;
    try {
      _$result = _$v ??
          new _$LiftQuoteFormState._(
              error: error,
              isLoading: isLoading,
              liftQuoteForm: _liftQuoteForm?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'liftQuoteForm';
        _liftQuoteForm?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'LiftQuoteFormState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
