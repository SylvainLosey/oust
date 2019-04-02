import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../../data/models/pickup.dart';
import '../../data/models/subscription.dart';

part 'pickup_actions.g.dart';

@JsonSerializable()
class LoadPickupsAction {
  final Subscription subscription;

  LoadPickupsAction({@required this.subscription});
  Map<String, dynamic> toJson() => _$LoadPickupsActionToJson(this);
}

@JsonSerializable()
class LoadPickupsSuccess {
  final List<Pickup> pickups;

  LoadPickupsSuccess({@required this.pickups});
  Map<String, dynamic> toJson() => _$LoadPickupsSuccessToJson(this);
}

@JsonSerializable()
class LoadPickupsFailure {
  final String error;

  LoadPickupsFailure({@required this.error});
  Map<String, dynamic> toJson() => _$LoadPickupsFailureToJson(this);
}