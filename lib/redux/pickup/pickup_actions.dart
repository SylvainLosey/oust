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