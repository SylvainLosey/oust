// GENERATED CODE - DO NOT MODIFY BY HAND

part of consumer_subscription;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ConsumerSubscription> _$consumerSubscriptionSerializer =
    new _$ConsumerSubscriptionSerializer();

class _$ConsumerSubscriptionSerializer
    implements StructuredSerializer<ConsumerSubscription> {
  @override
  final Iterable<Type> types = const [
    ConsumerSubscription,
    _$ConsumerSubscription
  ];
  @override
  final String wireName = 'ConsumerSubscription';

  @override
  Iterable serialize(Serializers serializers, ConsumerSubscription object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.package != null) {
      result
        ..add('package')
        ..add(serializers.serialize(object.package,
            specifiedType: const FullType(int)));
    }
    if (object.subscription != null) {
      result
        ..add('subscription')
        ..add(serializers.serialize(object.subscription,
            specifiedType: const FullType(int)));
    }

    return result;
  }

  @override
  ConsumerSubscription deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ConsumerSubscriptionBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'package':
          result.package = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'subscription':
          result.subscription = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$ConsumerSubscription extends ConsumerSubscription {
  @override
  final int package;
  @override
  final int subscription;

  factory _$ConsumerSubscription(
          [void Function(ConsumerSubscriptionBuilder) updates]) =>
      (new ConsumerSubscriptionBuilder()..update(updates)).build();

  _$ConsumerSubscription._({this.package, this.subscription}) : super._();

  @override
  ConsumerSubscription rebuild(
          void Function(ConsumerSubscriptionBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConsumerSubscriptionBuilder toBuilder() =>
      new ConsumerSubscriptionBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConsumerSubscription &&
        package == other.package &&
        subscription == other.subscription;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, package.hashCode), subscription.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ConsumerSubscription')
          ..add('package', package)
          ..add('subscription', subscription))
        .toString();
  }
}

class ConsumerSubscriptionBuilder
    implements Builder<ConsumerSubscription, ConsumerSubscriptionBuilder> {
  _$ConsumerSubscription _$v;

  int _package;
  int get package => _$this._package;
  set package(int package) => _$this._package = package;

  int _subscription;
  int get subscription => _$this._subscription;
  set subscription(int subscription) => _$this._subscription = subscription;

  ConsumerSubscriptionBuilder();

  ConsumerSubscriptionBuilder get _$this {
    if (_$v != null) {
      _package = _$v.package;
      _subscription = _$v.subscription;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConsumerSubscription other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ConsumerSubscription;
  }

  @override
  void update(void Function(ConsumerSubscriptionBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ConsumerSubscription build() {
    final _$result = _$v ??
        new _$ConsumerSubscription._(
            package: package, subscription: subscription);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
