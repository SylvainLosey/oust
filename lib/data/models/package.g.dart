// GENERATED CODE - DO NOT MODIFY BY HAND

part of package;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Package> _$packageSerializer = new _$PackageSerializer();

class _$PackageSerializer implements StructuredSerializer<Package> {
  @override
  final Iterable<Type> types = const [Package, _$Package];
  @override
  final String wireName = 'Package';

  @override
  Iterable serialize(Serializers serializers, Package object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'length',
      serializers.serialize(object.length,
          specifiedType: const FullType(String)),
      'frequency_weeks',
      serializers.serialize(object.frequencyWeeks,
          specifiedType: const FullType(int)),
      'pickups',
      serializers.serialize(object.pickups, specifiedType: const FullType(int)),
      'unit_price',
      serializers.serialize(object.unitPrice,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Package deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PackageBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'length':
          result.length = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'frequency_weeks':
          result.frequencyWeeks = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'pickups':
          result.pickups = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'unit_price':
          result.unitPrice = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$Package extends Package {
  @override
  final int id;
  @override
  final String name;
  @override
  final String length;
  @override
  final int frequencyWeeks;
  @override
  final int pickups;
  @override
  final String unitPrice;

  factory _$Package([void updates(PackageBuilder b)]) =>
      (new PackageBuilder()..update(updates)).build();

  _$Package._(
      {this.id,
      this.name,
      this.length,
      this.frequencyWeeks,
      this.pickups,
      this.unitPrice})
      : super._() {
    if (id == null) {
      throw new BuiltValueNullFieldError('Package', 'id');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('Package', 'name');
    }
    if (length == null) {
      throw new BuiltValueNullFieldError('Package', 'length');
    }
    if (frequencyWeeks == null) {
      throw new BuiltValueNullFieldError('Package', 'frequencyWeeks');
    }
    if (pickups == null) {
      throw new BuiltValueNullFieldError('Package', 'pickups');
    }
    if (unitPrice == null) {
      throw new BuiltValueNullFieldError('Package', 'unitPrice');
    }
  }

  @override
  Package rebuild(void updates(PackageBuilder b)) =>
      (toBuilder()..update(updates)).build();

  @override
  PackageBuilder toBuilder() => new PackageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Package &&
        id == other.id &&
        name == other.name &&
        length == other.length &&
        frequencyWeeks == other.frequencyWeeks &&
        pickups == other.pickups &&
        unitPrice == other.unitPrice;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, id.hashCode), name.hashCode), length.hashCode),
                frequencyWeeks.hashCode),
            pickups.hashCode),
        unitPrice.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Package')
          ..add('id', id)
          ..add('name', name)
          ..add('length', length)
          ..add('frequencyWeeks', frequencyWeeks)
          ..add('pickups', pickups)
          ..add('unitPrice', unitPrice))
        .toString();
  }
}

class PackageBuilder implements Builder<Package, PackageBuilder> {
  _$Package _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _length;
  String get length => _$this._length;
  set length(String length) => _$this._length = length;

  int _frequencyWeeks;
  int get frequencyWeeks => _$this._frequencyWeeks;
  set frequencyWeeks(int frequencyWeeks) =>
      _$this._frequencyWeeks = frequencyWeeks;

  int _pickups;
  int get pickups => _$this._pickups;
  set pickups(int pickups) => _$this._pickups = pickups;

  String _unitPrice;
  String get unitPrice => _$this._unitPrice;
  set unitPrice(String unitPrice) => _$this._unitPrice = unitPrice;

  PackageBuilder();

  PackageBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _name = _$v.name;
      _length = _$v.length;
      _frequencyWeeks = _$v.frequencyWeeks;
      _pickups = _$v.pickups;
      _unitPrice = _$v.unitPrice;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Package other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Package;
  }

  @override
  void update(void updates(PackageBuilder b)) {
    if (updates != null) updates(this);
  }

  @override
  _$Package build() {
    final _$result = _$v ??
        new _$Package._(
            id: id,
            name: name,
            length: length,
            frequencyWeeks: frequencyWeeks,
            pickups: pickups,
            unitPrice: unitPrice);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
