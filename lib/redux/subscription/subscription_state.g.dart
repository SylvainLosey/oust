// GENERATED CODE - DO NOT MODIFY BY HAND

part of SubscriptionState;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SubscriptionState> _$subscriptionStateSerializer =
    new _$SubscriptionStateSerializer();

class _$SubscriptionStateSerializer
    implements StructuredSerializer<SubscriptionState> {
  @override
  final Iterable<Type> types = const [SubscriptionState, _$SubscriptionState];
  @override
  final String wireName = 'SubscriptionState';

  @override
  Iterable serialize(Serializers serializers, SubscriptionState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'fetchCount',
      serializers.serialize(object.fetchCount,
          specifiedType: const FullType(int)),
    ];
    if (object.consumerSubscription != null) {
      result
        ..add('consumerSubscription')
        ..add(serializers.serialize(object.consumerSubscription,
            specifiedType: const FullType(ConsumerSubscription)));
    }
    if (object.error != null) {
      result
        ..add('error')
        ..add(serializers.serialize(object.error,
            specifiedType: const FullType(String)));
    }
    if (object.subscription != null) {
      result
        ..add('subscription')
        ..add(serializers.serialize(object.subscription,
            specifiedType: const FullType(Subscription)));
    }

    return result;
  }

  @override
  SubscriptionState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SubscriptionStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'consumerSubscription':
          result.consumerSubscription.replace(serializers.deserialize(value,
                  specifiedType: const FullType(ConsumerSubscription))
              as ConsumerSubscription);
          break;
        case 'error':
          result.error = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'fetchCount':
          result.fetchCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'subscription':
          result.subscription.replace(serializers.deserialize(value,
              specifiedType: const FullType(Subscription)) as Subscription);
          break;
      }
    }

    return result.build();
  }
}

class _$SubscriptionState extends SubscriptionState {
  @override
  final ConsumerSubscription consumerSubscription;
  @override
  final String error;
  @override
  final int fetchCount;
  @override
  final Subscription subscription;

  factory _$SubscriptionState(
          [void Function(SubscriptionStateBuilder) updates]) =>
      (new SubscriptionStateBuilder()..update(updates)).build();

  _$SubscriptionState._(
      {this.consumerSubscription,
      this.error,
      this.fetchCount,
      this.subscription})
      : super._() {
    if (fetchCount == null) {
      throw new BuiltValueNullFieldError('SubscriptionState', 'fetchCount');
    }
  }

  @override
  SubscriptionState rebuild(void Function(SubscriptionStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubscriptionStateBuilder toBuilder() =>
      new SubscriptionStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SubscriptionState &&
        consumerSubscription == other.consumerSubscription &&
        error == other.error &&
        fetchCount == other.fetchCount &&
        subscription == other.subscription;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, consumerSubscription.hashCode), error.hashCode),
            fetchCount.hashCode),
        subscription.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SubscriptionState')
          ..add('consumerSubscription', consumerSubscription)
          ..add('error', error)
          ..add('fetchCount', fetchCount)
          ..add('subscription', subscription))
        .toString();
  }
}

class SubscriptionStateBuilder
    implements Builder<SubscriptionState, SubscriptionStateBuilder> {
  _$SubscriptionState _$v;

  ConsumerSubscriptionBuilder _consumerSubscription;
  ConsumerSubscriptionBuilder get consumerSubscription =>
      _$this._consumerSubscription ??= new ConsumerSubscriptionBuilder();
  set consumerSubscription(ConsumerSubscriptionBuilder consumerSubscription) =>
      _$this._consumerSubscription = consumerSubscription;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  int _fetchCount;
  int get fetchCount => _$this._fetchCount;
  set fetchCount(int fetchCount) => _$this._fetchCount = fetchCount;

  SubscriptionBuilder _subscription;
  SubscriptionBuilder get subscription =>
      _$this._subscription ??= new SubscriptionBuilder();
  set subscription(SubscriptionBuilder subscription) =>
      _$this._subscription = subscription;

  SubscriptionStateBuilder();

  SubscriptionStateBuilder get _$this {
    if (_$v != null) {
      _consumerSubscription = _$v.consumerSubscription?.toBuilder();
      _error = _$v.error;
      _fetchCount = _$v.fetchCount;
      _subscription = _$v.subscription?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SubscriptionState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SubscriptionState;
  }

  @override
  void update(void Function(SubscriptionStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SubscriptionState build() {
    _$SubscriptionState _$result;
    try {
      _$result = _$v ??
          new _$SubscriptionState._(
              consumerSubscription: _consumerSubscription?.build(),
              error: error,
              fetchCount: fetchCount,
              subscription: _subscription?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'consumerSubscription';
        _consumerSubscription?.build();

        _$failedField = 'subscription';
        _subscription?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SubscriptionState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
