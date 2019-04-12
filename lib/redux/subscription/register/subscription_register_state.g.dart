// GENERATED CODE - DO NOT MODIFY BY HAND

part of subscriptionRegisterState;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SubscriptionRegisterState> _$subscriptionRegisterStateSerializer =
    new _$SubscriptionRegisterStateSerializer();

class _$SubscriptionRegisterStateSerializer
    implements StructuredSerializer<SubscriptionRegisterState> {
  @override
  final Iterable<Type> types = const [
    SubscriptionRegisterState,
    _$SubscriptionRegisterState
  ];
  @override
  final String wireName = 'SubscriptionRegisterState';

  @override
  Iterable serialize(Serializers serializers, SubscriptionRegisterState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'isLoading',
      serializers.serialize(object.isLoading,
          specifiedType: const FullType(bool)),
    ];
    if (object.subscriptionRegister != null) {
      result
        ..add('subscriptionRegister')
        ..add(serializers.serialize(object.subscriptionRegister,
            specifiedType: const FullType(SubscriptionRegister)));
    }
    if (object.error != null) {
      result
        ..add('error')
        ..add(serializers.serialize(object.error,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  SubscriptionRegisterState deserialize(
      Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SubscriptionRegisterStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'isLoading':
          result.isLoading = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'subscriptionRegister':
          result.subscriptionRegister.replace(serializers.deserialize(value,
                  specifiedType: const FullType(SubscriptionRegister))
              as SubscriptionRegister);
          break;
        case 'error':
          result.error = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$SubscriptionRegisterState extends SubscriptionRegisterState {
  @override
  final bool isLoading;
  @override
  final SubscriptionRegister subscriptionRegister;
  @override
  final String error;

  factory _$SubscriptionRegisterState(
          [void updates(SubscriptionRegisterStateBuilder b)]) =>
      (new SubscriptionRegisterStateBuilder()..update(updates)).build();

  _$SubscriptionRegisterState._(
      {this.isLoading, this.subscriptionRegister, this.error})
      : super._() {
    if (isLoading == null) {
      throw new BuiltValueNullFieldError(
          'SubscriptionRegisterState', 'isLoading');
    }
  }

  @override
  SubscriptionRegisterState rebuild(
          void updates(SubscriptionRegisterStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SubscriptionRegisterStateBuilder toBuilder() =>
      new SubscriptionRegisterStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SubscriptionRegisterState &&
        isLoading == other.isLoading &&
        subscriptionRegister == other.subscriptionRegister &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, isLoading.hashCode), subscriptionRegister.hashCode),
        error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SubscriptionRegisterState')
          ..add('isLoading', isLoading)
          ..add('subscriptionRegister', subscriptionRegister)
          ..add('error', error))
        .toString();
  }
}

class SubscriptionRegisterStateBuilder
    implements
        Builder<SubscriptionRegisterState, SubscriptionRegisterStateBuilder> {
  _$SubscriptionRegisterState _$v;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  SubscriptionRegisterBuilder _subscriptionRegister;
  SubscriptionRegisterBuilder get subscriptionRegister =>
      _$this._subscriptionRegister ??= new SubscriptionRegisterBuilder();
  set subscriptionRegister(SubscriptionRegisterBuilder subscriptionRegister) =>
      _$this._subscriptionRegister = subscriptionRegister;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  SubscriptionRegisterStateBuilder();

  SubscriptionRegisterStateBuilder get _$this {
    if (_$v != null) {
      _isLoading = _$v.isLoading;
      _subscriptionRegister = _$v.subscriptionRegister?.toBuilder();
      _error = _$v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SubscriptionRegisterState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SubscriptionRegisterState;
  }

  @override
  void update(void updates(SubscriptionRegisterStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$SubscriptionRegisterState build() {
    _$SubscriptionRegisterState _$result;
    try {
      _$result = _$v ??
          new _$SubscriptionRegisterState._(
              isLoading: isLoading,
              subscriptionRegister: _subscriptionRegister?.build(),
              error: error);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'subscriptionRegister';
        _subscriptionRegister?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SubscriptionRegisterState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
