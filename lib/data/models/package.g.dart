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
      'frequency_weeks',
      serializers.serialize(object.frequencyWeeks,
          specifiedType: const FullType(int)),
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(int)),
      'length',
      serializers.serialize(object.length,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'pickups',
      serializers.serialize(object.pickups, specifiedType: const FullType(int)),
      'base_package',
      serializers.serialize(object.basePackage,
          specifiedType: const FullType(bool)),
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
        case 'frequency_weeks':
          result.frequencyWeeks = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'length':
          result.length = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'pickups':
          result.pickups = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'base_package':
          result.basePackage = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
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
  final int frequencyWeeks;
  @override
  final int id;
  @override
  final String length;
  @override
  final String name;
  @override
  final int pickups;
  @override
  final bool basePackage;
  @override
  final String unitPrice;

  factory _$Package([void Function(PackageBuilder) updates]) =>
      (new PackageBuilder()..update(updates)).build();

  _$Package._(
      {this.frequencyWeeks,
      this.id,
      this.length,
      this.name,
      this.pickups,
      this.basePackage,
      this.unitPrice})
      : super._() {
    if (frequencyWeeks == null) {
      throw new BuiltValueNullFieldError('Package', 'frequencyWeeks');
    }
    if (id == null) {
      throw new BuiltValueNullFieldError('Package', 'id');
    }
    if (length == null) {
      throw new BuiltValueNullFieldError('Package', 'length');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('Package', 'name');
    }
    if (pickups == null) {
      throw new BuiltValueNullFieldError('Package', 'pickups');
    }
    if (basePackage == null) {
      throw new BuiltValueNullFieldError('Package', 'basePackage');
    }
    if (unitPrice == null) {
      throw new BuiltValueNullFieldError('Package', 'unitPrice');
    }
  }

  @override
  Package rebuild(void Function(PackageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PackageBuilder toBuilder() => new PackageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Package &&
        frequencyWeeks == other.frequencyWeeks &&
        id == other.id &&
        length == other.length &&
        name == other.name &&
        pickups == other.pickups &&
        basePackage == other.basePackage &&
        unitPrice == other.unitPrice;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc($jc($jc(0, frequencyWeeks.hashCode), id.hashCode),
                        length.hashCode),
                    name.hashCode),
                pickups.hashCode),
            basePackage.hashCode),
        unitPrice.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Package')
          ..add('frequencyWeeks', frequencyWeeks)
          ..add('id', id)
          ..add('length', length)
          ..add('name', name)
          ..add('pickups', pickups)
          ..add('basePackage', basePackage)
          ..add('unitPrice', unitPrice))
        .toString();
  }
}

class PackageBuilder implements Builder<Package, PackageBuilder> {
  _$Package _$v;

  int _frequencyWeeks;
  int get frequencyWeeks => _$this._frequencyWeeks;
  set frequencyWeeks(int frequencyWeeks) =>
      _$this._frequencyWeeks = frequencyWeeks;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _length;
  String get length => _$this._length;
  set length(String length) => _$this._length = length;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  int _pickups;
  int get pickups => _$this._pickups;
  set pickups(int pickups) => _$this._pickups = pickups;

  bool _basePackage;
  bool get basePackage => _$this._basePackage;
  set basePackage(bool basePackage) => _$this._basePackage = basePackage;

  String _unitPrice;
  String get unitPrice => _$this._unitPrice;
  set unitPrice(String unitPrice) => _$this._unitPrice = unitPrice;

  PackageBuilder();

  PackageBuilder get _$this {
    if (_$v != null) {
      _frequencyWeeks = _$v.frequencyWeeks;
      _id = _$v.id;
      _length = _$v.length;
      _name = _$v.name;
      _pickups = _$v.pickups;
      _basePackage = _$v.basePackage;
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
  void update(void Function(PackageBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Package build() {
    final _$result = _$v ??
        new _$Package._(
            frequencyWeeks: frequencyWeeks,
            id: id,
            length: length,
            name: name,
            pickups: pickups,
            basePackage: basePackage,
            unitPrice: unitPrice);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
