// GENERATED CODE - DO NOT MODIFY BY HAND

part of lift_image;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LiftImage> _$liftImageSerializer = new _$LiftImageSerializer();

class _$LiftImageSerializer implements StructuredSerializer<LiftImage> {
  @override
  final Iterable<Type> types = const [LiftImage, _$LiftImage];
  @override
  final String wireName = 'LiftImage';

  @override
  Iterable serialize(Serializers serializers, LiftImage object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.lift != null) {
      result
        ..add('lift')
        ..add(serializers.serialize(object.lift,
            specifiedType: const FullType(int)));
    }
    if (object.uuid != null) {
      result
        ..add('uuid')
        ..add(serializers.serialize(object.uuid,
            specifiedType: const FullType(String)));
    }
    if (object.url != null) {
      result
        ..add('url')
        ..add(serializers.serialize(object.url,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  LiftImage deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LiftImageBuilder();

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
        case 'lift':
          result.lift = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'uuid':
          result.uuid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$LiftImage extends LiftImage {
  @override
  final int id;
  @override
  final int lift;
  @override
  final String uuid;
  @override
  final String url;
  @override
  final Asset image;

  factory _$LiftImage([void Function(LiftImageBuilder) updates]) =>
      (new LiftImageBuilder()..update(updates)).build();

  _$LiftImage._({this.id, this.lift, this.uuid, this.url, this.image})
      : super._();

  @override
  LiftImage rebuild(void Function(LiftImageBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LiftImageBuilder toBuilder() => new LiftImageBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LiftImage &&
        id == other.id &&
        lift == other.lift &&
        uuid == other.uuid &&
        url == other.url &&
        image == other.image;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, id.hashCode), lift.hashCode), uuid.hashCode),
            url.hashCode),
        image.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LiftImage')
          ..add('id', id)
          ..add('lift', lift)
          ..add('uuid', uuid)
          ..add('url', url)
          ..add('image', image))
        .toString();
  }
}

class LiftImageBuilder implements Builder<LiftImage, LiftImageBuilder> {
  _$LiftImage _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  int _lift;
  int get lift => _$this._lift;
  set lift(int lift) => _$this._lift = lift;

  String _uuid;
  String get uuid => _$this._uuid;
  set uuid(String uuid) => _$this._uuid = uuid;

  String _url;
  String get url => _$this._url;
  set url(String url) => _$this._url = url;

  Asset _image;
  Asset get image => _$this._image;
  set image(Asset image) => _$this._image = image;

  LiftImageBuilder();

  LiftImageBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _lift = _$v.lift;
      _uuid = _$v.uuid;
      _url = _$v.url;
      _image = _$v.image;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LiftImage other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LiftImage;
  }

  @override
  void update(void Function(LiftImageBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LiftImage build() {
    final _$result = _$v ??
        new _$LiftImage._(
            id: id, lift: lift, uuid: uuid, url: url, image: image);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
