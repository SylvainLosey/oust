// GENERATED CODE - DO NOT MODIFY BY HAND

part of subscriptionFormState;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SubscriptionFormState> _$subscriptionFormStateSerializer =
    new _$SubscriptionFormStateSerializer();

class _$SubscriptionFormStateSerializer
    implements StructuredSerializer<SubscriptionFormState> {
  @override
  final Iterable<Type> types = const [
    SubscriptionFormState,
    _$SubscriptionFormState
  ];
  @override
  final String wireName = 'SubscriptionFormState';

  @override
  Iterable serialize(Serializers serializers, SubscriptionFormState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'isLoading',
      serializers.serialize(object.isLoading,
          specifiedType: const FullType(bool)),
    ];
    if (object.error != null) {
      result
        ..add('error')
        ..add(serializers.serialize(object.error,
            specifiedType: const FullType(String)));
    }
    if (object.subscriptionForm != null) {
      result
        ..add('subscriptionForm')
        ..add(serializers.serialize(object.subscriptionForm,
            specifiedType: const FullType(SubscriptionForm)));
    }

    return result;
  }

  @override
  SubscriptionFormState deserialize(
      Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SubscriptionFormStateBuilder();

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
        case 'subscriptionForm':
          result.subscriptionForm.replace(serializers.deserialize(value,
                  specifiedType: const FullType(SubscriptionForm))
              as SubscriptionForm);
          break;
      }
    }

    return result.build();
  }
}

class _$SubscriptionFormState extends SubscriptionFormState {
  @override
  final String error;
  @override
  final bool isLoading;
  @override
  final SubscriptionForm subscriptionForm;

  factory _$SubscriptionFormState(
          [void Function(SubscriptionFormStateBuilder) updates]) =>
      (new SubscriptionFormStateBuilder()..update(updates)).build();

  _$SubscriptionFormState._({this.error, this.isLoading, this.subscriptionForm})
      : super._() {
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('SubscriptionFormState', 'isLoading');
    }
  }

  @override
  SubscriptionFormState rebuild(
          void Function(SubscriptionFormStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubscriptionFormStateBuilder toBuilder() =>
      new SubscriptionFormStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SubscriptionFormState &&
        error == other.error &&
        isLoading == other.isLoading &&
        subscriptionForm == other.subscriptionForm;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, error.hashCode), isLoading.hashCode),
        subscriptionForm.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SubscriptionFormState')
          ..add('error', error)
          ..add('isLoading', isLoading)
          ..add('subscriptionForm', subscriptionForm))
        .toString();
  }
}

class SubscriptionFormStateBuilder
    implements Builder<SubscriptionFormState, SubscriptionFormStateBuilder> {
  _$SubscriptionFormState _$v;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  SubscriptionFormBuilder _subscriptionForm;
  SubscriptionFormBuilder get subscriptionForm =>
      _$this._subscriptionForm ??= new SubscriptionFormBuilder();
  set subscriptionForm(SubscriptionFormBuilder subscriptionForm) =>
      _$this._subscriptionForm = subscriptionForm;

  SubscriptionFormStateBuilder();

  SubscriptionFormStateBuilder get _$this {
    if (_$v != null) {
      _error = _$v.error;
      _isLoading = _$v.isLoading;
      _subscriptionForm = _$v.subscriptionForm?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SubscriptionFormState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SubscriptionFormState;
  }

  @override
  void update(void Function(SubscriptionFormStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SubscriptionFormState build() {
    _$SubscriptionFormState _$result;
    try {
      _$result = _$v ??
          new _$SubscriptionFormState._(
              error: error,
              isLoading: isLoading,
              subscriptionForm: _subscriptionForm?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'subscriptionForm';
        _subscriptionForm?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SubscriptionFormState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
