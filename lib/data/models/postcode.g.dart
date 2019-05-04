// GENERATED CODE - DO NOT MODIFY BY HAND

part of postcode;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Postcode> _$postcodeSerializer = new _$PostcodeSerializer();

class _$PostcodeSerializer implements StructuredSerializer<Postcode> {
  @override
  final Iterable<Type> types = const [Postcode, _$Postcode];
  @override
  final String wireName = 'Postcode';

  @override
  Iterable serialize(Serializers serializers, Postcode object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'country',
      serializers.serialize(object.country,
          specifiedType: const FullType(String)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'lift_available',
      serializers.serialize(object.liftAvailable,
          specifiedType: const FullType(bool)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'postcode',
      serializers.serialize(object.postcode,
          specifiedType: const FullType(String)),
      'subscription_available',
      serializers.serialize(object.subscriptionAvailable,
          specifiedType: const FullType(bool)),
    ];
    if (object.state != null) {
      result
        ..add('state')
        ..add(serializers.serialize(object.state,
            specifiedType: const FullType(int)));
    }

    return result;
  }

  @override
  Postcode deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PostcodeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'country':
          result.country = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'lift_available':
          result.liftAvailable = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'postcode':
          result.postcode = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'state':
          result.state = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'subscription_available':
          result.subscriptionAvailable = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
      }
    }

    return result.build();
  }
}

class _$Postcode extends Postcode {
  @override
  final String country;
  @override
  final int id;
  @override
  final bool liftAvailable;
  @override
  final String name;
  @override
  final String postcode;
  @override
  final int state;
  @override
  final bool subscriptionAvailable;

  factory _$Postcode([void Function(PostcodeBuilder) updates]) =>
      (new PostcodeBuilder()..update(updates)).build();

  _$Postcode._(
      {this.country,
      this.id,
      this.liftAvailable,
      this.name,
      this.postcode,
      this.state,
      this.subscriptionAvailable})
      : super._() {
    if (country == null) {
      throw new BuiltValueNullFieldError('Postcode', 'country');
    }
    if (id == null) {
      throw new BuiltValueNullFieldError('Postcode', 'id');
    }
    if (liftAvailable == null) {
      throw new BuiltValueNullFieldError('Postcode', 'liftAvailable');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('Postcode', 'name');
    }
    if (postcode == null) {
      throw new BuiltValueNullFieldError('Postcode', 'postcode');
    }
    if (subscriptionAvailable == null) {
      throw new BuiltValueNullFieldError('Postcode', 'subscriptionAvailable');
    }
  }

  @override
  Postcode rebuild(void Function(PostcodeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PostcodeBuilder toBuilder() => new PostcodeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Postcode &&
        country == other.country &&
        id == other.id &&
        liftAvailable == other.liftAvailable &&
        name == other.name &&
        postcode == other.postcode &&
        state == other.state &&
        subscriptionAvailable == other.subscriptionAvailable;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, country.hashCode), id.hashCode),
                        liftAvailable.hashCode),
                    name.hashCode),
                postcode.hashCode),
            state.hashCode),
        subscriptionAvailable.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Postcode')
          ..add('country', country)
          ..add('id', id)
          ..add('liftAvailable', liftAvailable)
          ..add('name', name)
          ..add('postcode', postcode)
          ..add('state', state)
          ..add('subscriptionAvailable', subscriptionAvailable))
        .toString();
  }
}

class PostcodeBuilder implements Builder<Postcode, PostcodeBuilder> {
  _$Postcode _$v;

  String _country;
  String get country => _$this._country;
  set country(String country) => _$this._country = country;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  bool _liftAvailable;
  bool get liftAvailable => _$this._liftAvailable;
  set liftAvailable(bool liftAvailable) =>
      _$this._liftAvailable = liftAvailable;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _postcode;
  String get postcode => _$this._postcode;
  set postcode(String postcode) => _$this._postcode = postcode;

  int _state;
  int get state => _$this._state;
  set state(int state) => _$this._state = state;

  bool _subscriptionAvailable;
  bool get subscriptionAvailable => _$this._subscriptionAvailable;
  set subscriptionAvailable(bool subscriptionAvailable) =>
      _$this._subscriptionAvailable = subscriptionAvailable;

  PostcodeBuilder();

  PostcodeBuilder get _$this {
    if (_$v != null) {
      _country = _$v.country;
      _id = _$v.id;
      _liftAvailable = _$v.liftAvailable;
      _name = _$v.name;
      _postcode = _$v.postcode;
      _state = _$v.state;
      _subscriptionAvailable = _$v.subscriptionAvailable;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Postcode other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Postcode;
  }

  @override
  void update(void Function(PostcodeBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Postcode build() {
    final _$result = _$v ??
        new _$Postcode._(
            country: country,
            id: id,
            liftAvailable: liftAvailable,
            name: name,
            postcode: postcode,
            state: state,
            subscriptionAvailable: subscriptionAvailable);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
