library lift_image;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

import 'serializers.dart';

part 'lift_image.g.dart';

abstract class LiftImage implements Built<LiftImage, LiftImageBuilder> {
  @nullable
  int get id;

  @nullable
  int get lift;

  @nullable
  String get uuid;

  @nullable
  String get url;

  @nullable
  @BuiltValueField(serialize: false)
  Asset get image;

  LiftImage._();

  factory LiftImage([void Function(LiftImageBuilder) updates]) = _$LiftImage;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(LiftImage.serializer, this);
  }

  static LiftImage fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(LiftImage.serializer, jsonString);
  }

  static Serializer<LiftImage> get serializer => _$liftImageSerializer;
}
