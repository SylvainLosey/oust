import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../../data/models/postcode.dart';

part 'data_actions.g.dart';

@JsonSerializable()
class LoadPostcodesRequest {

  LoadPostcodesRequest();
  Map<String, dynamic> toJson() => _$LoadPostcodesRequestToJson(this);
}

class LoadPostcodesSuccess {
  final List<Postcode> postcodes;

  LoadPostcodesSuccess({@required this.postcodes});
}

@JsonSerializable()
class LoadPostcodesFailure {
  final String error;

  LoadPostcodesFailure({@required this.error});
  Map<String, dynamic> toJson() => _$LoadPostcodesFailureToJson(this);
}