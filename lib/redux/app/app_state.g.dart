// GENERATED CODE - DO NOT MODIFY BY HAND

part of AppState;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AppState> _$appStateSerializer = new _$AppStateSerializer();

class _$AppStateSerializer implements StructuredSerializer<AppState> {
  @override
  final Iterable<Type> types = const [AppState, _$AppState];
  @override
  final String wireName = 'AppState';

  @override
  Iterable serialize(Serializers serializers, AppState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'authState',
      serializers.serialize(object.authState,
          specifiedType: const FullType(AuthState)),
      'navState',
      serializers.serialize(object.navState,
          specifiedType: const FullType(NavState)),
      'customerState',
      serializers.serialize(object.customerState,
          specifiedType: const FullType(CustomerState)),
      'subscriptionState',
      serializers.serialize(object.subscriptionState,
          specifiedType: const FullType(SubscriptionState)),
      'subscriptionFormState',
      serializers.serialize(object.subscriptionFormState,
          specifiedType: const FullType(SubscriptionFormState)),
      'pickupState',
      serializers.serialize(object.pickupState,
          specifiedType: const FullType(PickupState)),
      'dataState',
      serializers.serialize(object.dataState,
          specifiedType: const FullType(DataState)),
    ];

    return result;
  }

  @override
  AppState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AppStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'authState':
          result.authState.replace(serializers.deserialize(value,
              specifiedType: const FullType(AuthState)) as AuthState);
          break;
        case 'navState':
          result.navState.replace(serializers.deserialize(value,
              specifiedType: const FullType(NavState)) as NavState);
          break;
        case 'customerState':
          result.customerState.replace(serializers.deserialize(value,
              specifiedType: const FullType(CustomerState)) as CustomerState);
          break;
        case 'subscriptionState':
          result.subscriptionState.replace(serializers.deserialize(value,
                  specifiedType: const FullType(SubscriptionState))
              as SubscriptionState);
          break;
        case 'subscriptionFormState':
          result.subscriptionFormState.replace(serializers.deserialize(value,
                  specifiedType: const FullType(SubscriptionFormState))
              as SubscriptionFormState);
          break;
        case 'pickupState':
          result.pickupState.replace(serializers.deserialize(value,
              specifiedType: const FullType(PickupState)) as PickupState);
          break;
        case 'dataState':
          result.dataState.replace(serializers.deserialize(value,
              specifiedType: const FullType(DataState)) as DataState);
          break;
      }
    }

    return result.build();
  }
}

class _$AppState extends AppState {
  @override
  final AuthState authState;
  @override
  final NavState navState;
  @override
  final CustomerState customerState;
  @override
  final SubscriptionState subscriptionState;
  @override
  final SubscriptionFormState subscriptionFormState;
  @override
  final PickupState pickupState;
  @override
  final DataState dataState;

  factory _$AppState([void updates(AppStateBuilder b)]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._(
      {this.authState,
      this.navState,
      this.customerState,
      this.subscriptionState,
      this.subscriptionFormState,
      this.pickupState,
      this.dataState})
      : super._() {
    if (authState == null) {
      throw new BuiltValueNullFieldError('AppState', 'authState');
    }
    if (navState == null) {
      throw new BuiltValueNullFieldError('AppState', 'navState');
    }
    if (customerState == null) {
      throw new BuiltValueNullFieldError('AppState', 'customerState');
    }
    if (subscriptionState == null) {
      throw new BuiltValueNullFieldError('AppState', 'subscriptionState');
    }
    if (subscriptionFormState == null) {
      throw new BuiltValueNullFieldError('AppState', 'subscriptionFormState');
    }
    if (pickupState == null) {
      throw new BuiltValueNullFieldError('AppState', 'pickupState');
    }
    if (dataState == null) {
      throw new BuiltValueNullFieldError('AppState', 'dataState');
    }
  }

  @override
  AppState rebuild(void updates(AppStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        authState == other.authState &&
        navState == other.navState &&
        customerState == other.customerState &&
        subscriptionState == other.subscriptionState &&
        subscriptionFormState == other.subscriptionFormState &&
        pickupState == other.pickupState &&
        dataState == other.dataState;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, authState.hashCode), navState.hashCode),
                        customerState.hashCode),
                    subscriptionState.hashCode),
                subscriptionFormState.hashCode),
            pickupState.hashCode),
        dataState.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('authState', authState)
          ..add('navState', navState)
          ..add('customerState', customerState)
          ..add('subscriptionState', subscriptionState)
          ..add('subscriptionFormState', subscriptionFormState)
          ..add('pickupState', pickupState)
          ..add('dataState', dataState))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  AuthStateBuilder _authState;
  AuthStateBuilder get authState =>
      _$this._authState ??= new AuthStateBuilder();
  set authState(AuthStateBuilder authState) => _$this._authState = authState;

  NavStateBuilder _navState;
  NavStateBuilder get navState => _$this._navState ??= new NavStateBuilder();
  set navState(NavStateBuilder navState) => _$this._navState = navState;

  CustomerStateBuilder _customerState;
  CustomerStateBuilder get customerState =>
      _$this._customerState ??= new CustomerStateBuilder();
  set customerState(CustomerStateBuilder customerState) =>
      _$this._customerState = customerState;

  SubscriptionStateBuilder _subscriptionState;
  SubscriptionStateBuilder get subscriptionState =>
      _$this._subscriptionState ??= new SubscriptionStateBuilder();
  set subscriptionState(SubscriptionStateBuilder subscriptionState) =>
      _$this._subscriptionState = subscriptionState;

  SubscriptionFormStateBuilder _subscriptionFormState;
  SubscriptionFormStateBuilder get subscriptionFormState =>
      _$this._subscriptionFormState ??= new SubscriptionFormStateBuilder();
  set subscriptionFormState(
          SubscriptionFormStateBuilder subscriptionFormState) =>
      _$this._subscriptionFormState = subscriptionFormState;

  PickupStateBuilder _pickupState;
  PickupStateBuilder get pickupState =>
      _$this._pickupState ??= new PickupStateBuilder();
  set pickupState(PickupStateBuilder pickupState) =>
      _$this._pickupState = pickupState;

  DataStateBuilder _dataState;
  DataStateBuilder get dataState =>
      _$this._dataState ??= new DataStateBuilder();
  set dataState(DataStateBuilder dataState) => _$this._dataState = dataState;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _authState = _$v.authState?.toBuilder();
      _navState = _$v.navState?.toBuilder();
      _customerState = _$v.customerState?.toBuilder();
      _subscriptionState = _$v.subscriptionState?.toBuilder();
      _subscriptionFormState = _$v.subscriptionFormState?.toBuilder();
      _pickupState = _$v.pickupState?.toBuilder();
      _dataState = _$v.dataState?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AppState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AppState;
  }

  @override
  void update(void updates(AppStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(
              authState: authState.build(),
              navState: navState.build(),
              customerState: customerState.build(),
              subscriptionState: subscriptionState.build(),
              subscriptionFormState: subscriptionFormState.build(),
              pickupState: pickupState.build(),
              dataState: dataState.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'authState';
        authState.build();
        _$failedField = 'navState';
        navState.build();
        _$failedField = 'customerState';
        customerState.build();
        _$failedField = 'subscriptionState';
        subscriptionState.build();
        _$failedField = 'subscriptionFormState';
        subscriptionFormState.build();
        _$failedField = 'pickupState';
        pickupState.build();
        _$failedField = 'dataState';
        dataState.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AppState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
