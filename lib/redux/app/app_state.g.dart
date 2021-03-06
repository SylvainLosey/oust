// GENERATED CODE - DO NOT MODIFY BY HAND

part of app_state;

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
      'customerState',
      serializers.serialize(object.customerState,
          specifiedType: const FullType(CustomerState)),
      'dataState',
      serializers.serialize(object.dataState,
          specifiedType: const FullType(DataState)),
      'navState',
      serializers.serialize(object.navState,
          specifiedType: const FullType(NavState)),
      'invoiceState',
      serializers.serialize(object.invoiceState,
          specifiedType: const FullType(InvoiceState)),
      'pickupState',
      serializers.serialize(object.pickupState,
          specifiedType: const FullType(PickupState)),
      'subscriptionFormState',
      serializers.serialize(object.subscriptionFormState,
          specifiedType: const FullType(SubscriptionFormState)),
      'subscriptionState',
      serializers.serialize(object.subscriptionState,
          specifiedType: const FullType(SubscriptionState)),
      'liftState',
      serializers.serialize(object.liftState,
          specifiedType: const FullType(LiftState)),
      'liftQuoteFormState',
      serializers.serialize(object.liftQuoteFormState,
          specifiedType: const FullType(LiftQuoteFormState)),
      'liftBookFormState',
      serializers.serialize(object.liftBookFormState,
          specifiedType: const FullType(LiftBookFormState)),
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
        case 'customerState':
          result.customerState.replace(serializers.deserialize(value,
              specifiedType: const FullType(CustomerState)) as CustomerState);
          break;
        case 'dataState':
          result.dataState.replace(serializers.deserialize(value,
              specifiedType: const FullType(DataState)) as DataState);
          break;
        case 'navState':
          result.navState.replace(serializers.deserialize(value,
              specifiedType: const FullType(NavState)) as NavState);
          break;
        case 'invoiceState':
          result.invoiceState.replace(serializers.deserialize(value,
              specifiedType: const FullType(InvoiceState)) as InvoiceState);
          break;
        case 'pickupState':
          result.pickupState.replace(serializers.deserialize(value,
              specifiedType: const FullType(PickupState)) as PickupState);
          break;
        case 'subscriptionFormState':
          result.subscriptionFormState.replace(serializers.deserialize(value,
                  specifiedType: const FullType(SubscriptionFormState))
              as SubscriptionFormState);
          break;
        case 'subscriptionState':
          result.subscriptionState.replace(serializers.deserialize(value,
                  specifiedType: const FullType(SubscriptionState))
              as SubscriptionState);
          break;
        case 'liftState':
          result.liftState.replace(serializers.deserialize(value,
              specifiedType: const FullType(LiftState)) as LiftState);
          break;
        case 'liftQuoteFormState':
          result.liftQuoteFormState.replace(serializers.deserialize(value,
                  specifiedType: const FullType(LiftQuoteFormState))
              as LiftQuoteFormState);
          break;
        case 'liftBookFormState':
          result.liftBookFormState.replace(serializers.deserialize(value,
                  specifiedType: const FullType(LiftBookFormState))
              as LiftBookFormState);
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
  final CustomerState customerState;
  @override
  final DataState dataState;
  @override
  final NavState navState;
  @override
  final InvoiceState invoiceState;
  @override
  final PickupState pickupState;
  @override
  final SubscriptionFormState subscriptionFormState;
  @override
  final SubscriptionState subscriptionState;
  @override
  final LiftState liftState;
  @override
  final LiftQuoteFormState liftQuoteFormState;
  @override
  final LiftBookFormState liftBookFormState;

  factory _$AppState([void Function(AppStateBuilder) updates]) =>
      (new AppStateBuilder()..update(updates)).build();

  _$AppState._(
      {this.authState,
      this.customerState,
      this.dataState,
      this.navState,
      this.invoiceState,
      this.pickupState,
      this.subscriptionFormState,
      this.subscriptionState,
      this.liftState,
      this.liftQuoteFormState,
      this.liftBookFormState})
      : super._() {
    if (authState == null) {
      throw new BuiltValueNullFieldError('AppState', 'authState');
    }
    if (customerState == null) {
      throw new BuiltValueNullFieldError('AppState', 'customerState');
    }
    if (dataState == null) {
      throw new BuiltValueNullFieldError('AppState', 'dataState');
    }
    if (navState == null) {
      throw new BuiltValueNullFieldError('AppState', 'navState');
    }
    if (invoiceState == null) {
      throw new BuiltValueNullFieldError('AppState', 'invoiceState');
    }
    if (pickupState == null) {
      throw new BuiltValueNullFieldError('AppState', 'pickupState');
    }
    if (subscriptionFormState == null) {
      throw new BuiltValueNullFieldError('AppState', 'subscriptionFormState');
    }
    if (subscriptionState == null) {
      throw new BuiltValueNullFieldError('AppState', 'subscriptionState');
    }
    if (liftState == null) {
      throw new BuiltValueNullFieldError('AppState', 'liftState');
    }
    if (liftQuoteFormState == null) {
      throw new BuiltValueNullFieldError('AppState', 'liftQuoteFormState');
    }
    if (liftBookFormState == null) {
      throw new BuiltValueNullFieldError('AppState', 'liftBookFormState');
    }
  }

  @override
  AppState rebuild(void Function(AppStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AppStateBuilder toBuilder() => new AppStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AppState &&
        authState == other.authState &&
        customerState == other.customerState &&
        dataState == other.dataState &&
        navState == other.navState &&
        invoiceState == other.invoiceState &&
        pickupState == other.pickupState &&
        subscriptionFormState == other.subscriptionFormState &&
        subscriptionState == other.subscriptionState &&
        liftState == other.liftState &&
        liftQuoteFormState == other.liftQuoteFormState &&
        liftBookFormState == other.liftBookFormState;
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
                                        $jc($jc(0, authState.hashCode),
                                            customerState.hashCode),
                                        dataState.hashCode),
                                    navState.hashCode),
                                invoiceState.hashCode),
                            pickupState.hashCode),
                        subscriptionFormState.hashCode),
                    subscriptionState.hashCode),
                liftState.hashCode),
            liftQuoteFormState.hashCode),
        liftBookFormState.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AppState')
          ..add('authState', authState)
          ..add('customerState', customerState)
          ..add('dataState', dataState)
          ..add('navState', navState)
          ..add('invoiceState', invoiceState)
          ..add('pickupState', pickupState)
          ..add('subscriptionFormState', subscriptionFormState)
          ..add('subscriptionState', subscriptionState)
          ..add('liftState', liftState)
          ..add('liftQuoteFormState', liftQuoteFormState)
          ..add('liftBookFormState', liftBookFormState))
        .toString();
  }
}

class AppStateBuilder implements Builder<AppState, AppStateBuilder> {
  _$AppState _$v;

  AuthStateBuilder _authState;
  AuthStateBuilder get authState =>
      _$this._authState ??= new AuthStateBuilder();
  set authState(AuthStateBuilder authState) => _$this._authState = authState;

  CustomerStateBuilder _customerState;
  CustomerStateBuilder get customerState =>
      _$this._customerState ??= new CustomerStateBuilder();
  set customerState(CustomerStateBuilder customerState) =>
      _$this._customerState = customerState;

  DataStateBuilder _dataState;
  DataStateBuilder get dataState =>
      _$this._dataState ??= new DataStateBuilder();
  set dataState(DataStateBuilder dataState) => _$this._dataState = dataState;

  NavStateBuilder _navState;
  NavStateBuilder get navState => _$this._navState ??= new NavStateBuilder();
  set navState(NavStateBuilder navState) => _$this._navState = navState;

  InvoiceStateBuilder _invoiceState;
  InvoiceStateBuilder get invoiceState =>
      _$this._invoiceState ??= new InvoiceStateBuilder();
  set invoiceState(InvoiceStateBuilder invoiceState) =>
      _$this._invoiceState = invoiceState;

  PickupStateBuilder _pickupState;
  PickupStateBuilder get pickupState =>
      _$this._pickupState ??= new PickupStateBuilder();
  set pickupState(PickupStateBuilder pickupState) =>
      _$this._pickupState = pickupState;

  SubscriptionFormStateBuilder _subscriptionFormState;
  SubscriptionFormStateBuilder get subscriptionFormState =>
      _$this._subscriptionFormState ??= new SubscriptionFormStateBuilder();
  set subscriptionFormState(
          SubscriptionFormStateBuilder subscriptionFormState) =>
      _$this._subscriptionFormState = subscriptionFormState;

  SubscriptionStateBuilder _subscriptionState;
  SubscriptionStateBuilder get subscriptionState =>
      _$this._subscriptionState ??= new SubscriptionStateBuilder();
  set subscriptionState(SubscriptionStateBuilder subscriptionState) =>
      _$this._subscriptionState = subscriptionState;

  LiftStateBuilder _liftState;
  LiftStateBuilder get liftState =>
      _$this._liftState ??= new LiftStateBuilder();
  set liftState(LiftStateBuilder liftState) => _$this._liftState = liftState;

  LiftQuoteFormStateBuilder _liftQuoteFormState;
  LiftQuoteFormStateBuilder get liftQuoteFormState =>
      _$this._liftQuoteFormState ??= new LiftQuoteFormStateBuilder();
  set liftQuoteFormState(LiftQuoteFormStateBuilder liftQuoteFormState) =>
      _$this._liftQuoteFormState = liftQuoteFormState;

  LiftBookFormStateBuilder _liftBookFormState;
  LiftBookFormStateBuilder get liftBookFormState =>
      _$this._liftBookFormState ??= new LiftBookFormStateBuilder();
  set liftBookFormState(LiftBookFormStateBuilder liftBookFormState) =>
      _$this._liftBookFormState = liftBookFormState;

  AppStateBuilder();

  AppStateBuilder get _$this {
    if (_$v != null) {
      _authState = _$v.authState?.toBuilder();
      _customerState = _$v.customerState?.toBuilder();
      _dataState = _$v.dataState?.toBuilder();
      _navState = _$v.navState?.toBuilder();
      _invoiceState = _$v.invoiceState?.toBuilder();
      _pickupState = _$v.pickupState?.toBuilder();
      _subscriptionFormState = _$v.subscriptionFormState?.toBuilder();
      _subscriptionState = _$v.subscriptionState?.toBuilder();
      _liftState = _$v.liftState?.toBuilder();
      _liftQuoteFormState = _$v.liftQuoteFormState?.toBuilder();
      _liftBookFormState = _$v.liftBookFormState?.toBuilder();
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
  void update(void Function(AppStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AppState build() {
    _$AppState _$result;
    try {
      _$result = _$v ??
          new _$AppState._(
              authState: authState.build(),
              customerState: customerState.build(),
              dataState: dataState.build(),
              navState: navState.build(),
              invoiceState: invoiceState.build(),
              pickupState: pickupState.build(),
              subscriptionFormState: subscriptionFormState.build(),
              subscriptionState: subscriptionState.build(),
              liftState: liftState.build(),
              liftQuoteFormState: liftQuoteFormState.build(),
              liftBookFormState: liftBookFormState.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'authState';
        authState.build();
        _$failedField = 'customerState';
        customerState.build();
        _$failedField = 'dataState';
        dataState.build();
        _$failedField = 'navState';
        navState.build();
        _$failedField = 'invoiceState';
        invoiceState.build();
        _$failedField = 'pickupState';
        pickupState.build();
        _$failedField = 'subscriptionFormState';
        subscriptionFormState.build();
        _$failedField = 'subscriptionState';
        subscriptionState.build();
        _$failedField = 'liftState';
        liftState.build();
        _$failedField = 'liftQuoteFormState';
        liftQuoteFormState.build();
        _$failedField = 'liftBookFormState';
        liftBookFormState.build();
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
