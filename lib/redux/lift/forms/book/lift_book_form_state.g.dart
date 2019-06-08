// GENERATED CODE - DO NOT MODIFY BY HAND

part of lift_book_form_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LiftBookFormState> _$liftBookFormStateSerializer =
    new _$LiftBookFormStateSerializer();

class _$LiftBookFormStateSerializer
    implements StructuredSerializer<LiftBookFormState> {
  @override
  final Iterable<Type> types = const [LiftBookFormState, _$LiftBookFormState];
  @override
  final String wireName = 'LiftBookFormState';

  @override
  Iterable serialize(Serializers serializers, LiftBookFormState object,
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
    if (object.liftBookForm != null) {
      result
        ..add('liftBookForm')
        ..add(serializers.serialize(object.liftBookForm,
            specifiedType: const FullType(LiftBookForm)));
    }

    return result;
  }

  @override
  LiftBookFormState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LiftBookFormStateBuilder();

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
        case 'liftBookForm':
          result.liftBookForm.replace(serializers.deserialize(value,
              specifiedType: const FullType(LiftBookForm)) as LiftBookForm);
          break;
      }
    }

    return result.build();
  }
}

class _$LiftBookFormState extends LiftBookFormState {
  @override
  final String error;
  @override
  final bool isLoading;
  @override
  final LiftBookForm liftBookForm;

  factory _$LiftBookFormState(
          [void Function(LiftBookFormStateBuilder) updates]) =>
      (new LiftBookFormStateBuilder()..update(updates)).build();

  _$LiftBookFormState._({this.error, this.isLoading, this.liftBookForm})
      : super._();

  @override
  LiftBookFormState rebuild(void Function(LiftBookFormStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LiftBookFormStateBuilder toBuilder() =>
      new LiftBookFormStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LiftBookFormState &&
        error == other.error &&
        isLoading == other.isLoading &&
        liftBookForm == other.liftBookForm;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, error.hashCode), isLoading.hashCode),
        liftBookForm.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LiftBookFormState')
          ..add('error', error)
          ..add('isLoading', isLoading)
          ..add('liftBookForm', liftBookForm))
        .toString();
  }
}

class LiftBookFormStateBuilder
    implements Builder<LiftBookFormState, LiftBookFormStateBuilder> {
  _$LiftBookFormState _$v;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  LiftBookFormBuilder _liftBookForm;
  LiftBookFormBuilder get liftBookForm =>
      _$this._liftBookForm ??= new LiftBookFormBuilder();
  set liftBookForm(LiftBookFormBuilder liftBookForm) =>
      _$this._liftBookForm = liftBookForm;

  LiftBookFormStateBuilder();

  LiftBookFormStateBuilder get _$this {
    if (_$v != null) {
      _error = _$v.error;
      _isLoading = _$v.isLoading;
      _liftBookForm = _$v.liftBookForm?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LiftBookFormState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LiftBookFormState;
  }

  @override
  void update(void Function(LiftBookFormStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LiftBookFormState build() {
    _$LiftBookFormState _$result;
    try {
      _$result = _$v ??
          new _$LiftBookFormState._(
              error: error,
              isLoading: isLoading,
              liftBookForm: _liftBookForm?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'liftBookForm';
        _liftBookForm?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'LiftBookFormState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
