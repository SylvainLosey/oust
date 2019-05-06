import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:built_collection/built_collection.dart';

import '../../data/models/postcode.dart';
import '../../data/models/package.dart';

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

/// PACKAGES

@JsonSerializable()
class LoadPackagesRequest {
  LoadPackagesRequest();
  Map<String, dynamic> toJson() => _$LoadPackagesRequestToJson(this);
}

// @JsonSerializable()
class LoadPackagesSuccess {
  // @JsonKey(fromJson: Packages.fromJson)
  final BuiltList<Package> packages;

  LoadPackagesSuccess({@required this.packages});
  // Map<String, dynamic> toJson() => _$LoadPackagesSuccessToJson(this);
}

@JsonSerializable()
class LoadPackagesFailure {
  final String error;

  LoadPackagesFailure({@required this.error});
  Map<String, dynamic> toJson() => _$LoadPackagesFailureToJson(this);
}
