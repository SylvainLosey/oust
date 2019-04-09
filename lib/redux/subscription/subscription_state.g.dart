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
    if (object.subscription != null) {
      result
        ..add('subscription')
        ..add(serializers.serialize(object.subscription,
            specifiedType: const FullType(Subscription)));
    }
    if (object.consumerSubscription != null) {
      result
        ..add('consumerSubscription')
        ..add(serializers.serialize(object.consumerSubscription,
            specifiedType: const FullType(ConsumerSubscription)));
    }
    if (object.packages != null) {
      result
        ..add('packages')
        ..add(serializers.serialize(object.packages,
            specifiedType: const FullType(BuiltMap,
                const [const FullType(int), const FullType(Package)])));
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
  SubscriptionState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SubscriptionStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'fetchCount':
          result.fetchCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'subscription':
          result.subscription.replace(serializers.deserialize(value,
              specifiedType: const FullType(Subscription)) as Subscription);
          break;
        case 'consumerSubscription':
          result.consumerSubscription.replace(serializers.deserialize(value,
                  specifiedType: const FullType(ConsumerSubscription))
              as ConsumerSubscription);
          break;
        case 'packages':
          result.packages.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(int),
                const FullType(Package)
              ])) as BuiltMap);
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

class _$SubscriptionState extends SubscriptionState {
  @override
  final int fetchCount;
  @override
  final Subscription subscription;
  @override
  final ConsumerSubscription consumerSubscription;
  @override
  final BuiltMap<int, Package> packages;
  @override
  final String error;

  factory _$SubscriptionState([void updates(SubscriptionStateBuilder b)]) =>
      (new SubscriptionStateBuilder()..update(updates)).build();

  _$SubscriptionState._(
      {this.fetchCount,
      this.subscription,
      this.consumerSubscription,
      this.packages,
      this.error})
      : super._() {
    if (fetchCount == null) {
      throw new BuiltValueNullFieldError('SubscriptionState', 'fetchCount');
    }
  }

  @override
  SubscriptionState rebuild(void updates(SubscriptionStateBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  SubscriptionStateBuilder toBuilder() =>
      new SubscriptionStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SubscriptionState &&
        fetchCount == other.fetchCount &&
        subscription == other.subscription &&
        consumerSubscription == other.consumerSubscription &&
        packages == other.packages &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, fetchCount.hashCode), subscription.hashCode),
                consumerSubscription.hashCode),
            packages.hashCode),
        error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SubscriptionState')
          ..add('fetchCount', fetchCount)
          ..add('subscription', subscription)
          ..add('consumerSubscription', consumerSubscription)
          ..add('packages', packages)
          ..add('error', error))
        .toString();
  }
}

class SubscriptionStateBuilder
    implements Builder<SubscriptionState, SubscriptionStateBuilder> {
  _$SubscriptionState _$v;

  int _fetchCount;
  int get fetchCount => _$this._fetchCount;
  set fetchCount(int fetchCount) => _$this._fetchCount = fetchCount;

  SubscriptionBuilder _subscription;
  SubscriptionBuilder get subscription =>
      _$this._subscription ??= new SubscriptionBuilder();
  set subscription(SubscriptionBuilder subscription) =>
      _$this._subscription = subscription;

  ConsumerSubscriptionBuilder _consumerSubscription;
  ConsumerSubscriptionBuilder get consumerSubscription =>
      _$this._consumerSubscription ??= new ConsumerSubscriptionBuilder();
  set consumerSubscription(ConsumerSubscriptionBuilder consumerSubscription) =>
      _$this._consumerSubscription = consumerSubscription;

  MapBuilder<int, Package> _packages;
  MapBuilder<int, Package> get packages =>
      _$this._packages ??= new MapBuilder<int, Package>();
  set packages(MapBuilder<int, Package> packages) =>
      _$this._packages = packages;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  SubscriptionStateBuilder();

  SubscriptionStateBuilder get _$this {
    if (_$v != null) {
      _fetchCount = _$v.fetchCount;
      _subscription = _$v.subscription?.toBuilder();
      _consumerSubscription = _$v.consumerSubscription?.toBuilder();
      _packages = _$v.packages?.toBuilder();
      _error = _$v.error;
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
  void update(void updates(SubscriptionStateBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$SubscriptionState build() {
    _$SubscriptionState _$result;
    try {
      _$result = _$v ??
          new _$SubscriptionState._(
              fetchCount: fetchCount,
              subscription: _subscription?.build(),
              consumerSubscription: _consumerSubscription?.build(),
              packages: _packages?.build(),
              error: error);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'subscription';
        _subscription?.build();
        _$failedField = 'consumerSubscription';
        _consumerSubscription?.build();
        _$failedField = 'packages';
        _packages?.build();
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
