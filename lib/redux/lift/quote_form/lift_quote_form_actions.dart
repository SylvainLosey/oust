import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

import '../../../data/models/lift_quote_form.dart';

part 'lift_quote_form_actions.g.dart';

@JsonSerializable()
class AddLiftImage {
  @JsonKey(ignore: true)
  Asset image;
  String uuid;

  AddLiftImage({@required this.image, @required this.uuid});
  Map<String, dynamic> toJson() => _$AddLiftImageToJson(this);
}

@JsonSerializable()
class AddLiftImageSuccess {
  String uuid;
  String url;

  AddLiftImageSuccess({@required this.uuid, @required this.url});
  Map<String, dynamic> toJson() => _$AddLiftImageSuccessToJson(this);
}

@JsonSerializable()
class AddLiftImageFailure {
  String error;

  AddLiftImageFailure({@required this.error});
  Map<String, dynamic> toJson() => _$AddLiftImageFailureToJson(this);
}