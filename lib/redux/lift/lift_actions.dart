import 'dart:async';

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:built_collection/built_collection.dart';

import '../../data/models/lift.dart';
import '../../data/models/lift_image.dart';
import '../../data/models/customer.dart';

part 'lift_actions.g.dart';

@JsonSerializable()
class LoadLiftsRequest {
  @JsonKey(fromJson: Customer.fromJson)
  final Customer customer;

  LoadLiftsRequest({@required this.customer});
  Map<String, dynamic> toJson() => _$LoadLiftsRequestToJson(this);
}

// @JsonSerializable()
class LoadLiftsSuccess {
  final List<Lift> lifts;

  LoadLiftsSuccess({@required this.lifts});
  // Map<String, dynamic> toJson() => _$LoadLiftsSuccessToJson(this);
}

@JsonSerializable()
class LoadLiftsFailure {
  final String error;

  LoadLiftsFailure({@required this.error});
  Map<String, dynamic> toJson() => _$LoadLiftsFailureToJson(this);
}

@JsonSerializable()
class LoadLiftImagesRequest {
  @JsonKey(fromJson: Customer.fromJson)
  final Customer customer;

  LoadLiftImagesRequest({@required this.customer});
  Map<String, dynamic> toJson() => _$LoadLiftImagesRequestToJson(this);
}

// @JsonSerializable()
class LoadLiftImagesSuccess {
  final List<LiftImage> liftImages;

  LoadLiftImagesSuccess({@required this.liftImages});
  // Map<String, dynamic> toJson() => _$LoadLiftImagesSuccessToJson(this);
}

@JsonSerializable()
class LoadLiftImagesFailure {
  final String error;

  LoadLiftImagesFailure({@required this.error});
  Map<String, dynamic> toJson() => _$LoadLiftImagesFailureToJson(this);
}

@JsonSerializable()
class CreateLiftRequest {
  final int customerId;
  final int floor;
  final bool elevator;
  final String customerNote;
  @JsonKey(ignore: true)
  final Completer completer;

  CreateLiftRequest({this.customerId, this.floor, this.elevator, this.customerNote, this.completer});
  Map<String, dynamic> toJson() => _$CreateLiftRequestToJson(this);
}

@JsonSerializable()
class CreateLiftSuccess {
  Map<String, dynamic> toJson() => _$CreateLiftSuccessToJson(this);
}

@JsonSerializable()
class CreateLiftFailure {
  final String error;
  CreateLiftFailure({this.error});

  Map<String, dynamic> toJson() => _$CreateLiftFailureToJson(this);
}

@JsonSerializable()
class CreateLiftImageRequest {
  final int liftId;
  final String uuid;
  final String url;
  @JsonKey(ignore: true)
  final Completer completer;

  CreateLiftImageRequest({this.liftId, this.url, this.uuid, this.completer});
  Map<String, dynamic> toJson() => _$CreateLiftImageRequestToJson(this);
}

@JsonSerializable()
class CreateLiftImageSuccess {
  Map<String, dynamic> toJson() => _$CreateLiftImageSuccessToJson(this);
}

@JsonSerializable()
class CreateLiftImageFailure {
  final String error;
  CreateLiftImageFailure({this.error});

  Map<String, dynamic> toJson() => _$CreateLiftImageFailureToJson(this);
}
