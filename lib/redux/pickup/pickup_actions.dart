import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../../data/models/pickup.dart';
import '../../data/models/subscription.dart';

part 'pickup_actions.g.dart';

@JsonSerializable()
class LoadPickupsRequest {
  @JsonKey(fromJson: Subscription.fromJson)
  final Subscription subscription;

  LoadPickupsRequest({@required this.subscription});
  Map<String, dynamic> toJson() => _$LoadPickupsRequestToJson(this);
}

// @JsonSerializable()
class LoadPickupsSuccess {
  final List<Pickup> pickups;

  LoadPickupsSuccess({@required this.pickups});
  // Map<String, dynamic> toJson() => _$LoadPickupsSuccessToJson(this);
}

@JsonSerializable()
class LoadPickupsFailure {
  final String error;

  LoadPickupsFailure({@required this.error});
  Map<String, dynamic> toJson() => _$LoadPickupsFailureToJson(this);
}


@JsonSerializable()
class UpdatePickupRequest {
  @JsonKey(fromJson: Pickup.fromJson)
  final Pickup pickup;

  UpdatePickupRequest({@required this.pickup});
  Map<String, dynamic> toJson() => _$UpdatePickupRequestToJson(this);
}

@JsonSerializable()
class UpdatePickupSuccess {

  Map<String, dynamic> toJson() => _$UpdatePickupSuccessToJson(this);
}

@JsonSerializable()
class UpdatePickupFailure {
  final String error;

  UpdatePickupFailure({@required this.error});
  Map<String, dynamic> toJson() => _$UpdatePickupFailureToJson(this);
}

@JsonSerializable()
class DeletePickupRequest {
  @JsonKey(fromJson: Pickup.fromJson)
  final Pickup pickup;

  DeletePickupRequest({@required this.pickup});
  Map<String, dynamic> toJson() => _$DeletePickupRequestToJson(this);
}

@JsonSerializable()
class DeletePickupSuccess {

  Map<String, dynamic> toJson() => _$DeletePickupSuccessToJson(this);
}

@JsonSerializable()
class DeletePickupFailure {
  final String error;

  DeletePickupFailure({@required this.error});
  Map<String, dynamic> toJson() => _$DeletePickupFailureToJson(this);
}



@JsonSerializable()
class PushBackPickupRequest {
  @JsonKey(fromJson: Pickup.fromJson)
  final Pickup pickup;

  PushBackPickupRequest({this.pickup});
  Map<String, dynamic> toJson() => _$PushBackPickupRequestToJson(this);
}

@JsonSerializable()
class PushBackPickupSuccess{

  Map<String, dynamic> toJson() => _$PushBackPickupSuccessToJson(this);
}

@JsonSerializable()
class PushBackPickupFailure{
  final String error;

  PushBackPickupFailure({this.error});
  Map<String, dynamic> toJson() => _$PushBackPickupFailureToJson(this);
}

