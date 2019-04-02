import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../../data/models/pickup.dart';
import '../../data/models/subscription.dart';

part 'pickup_state.g.dart';

@JsonSerializable()
@immutable
class PickupState {
  final bool isLoading;
  final List<Pickup> pickups;
  final String error;

  PickupState({
    @required this.isLoading,
    @required this.pickups,
    @required this.error,
  });

  factory PickupState.fromJson(Map<String, dynamic> json) => _$PickupStateFromJson(json);
  Map<String, dynamic> toJson() => _$PickupStateToJson(this);

  factory PickupState.initial() {
    return PickupState(
      isLoading: true,
      pickups: null,
      error: null,
    );
  }

  PickupState copyWith({
    bool isLoading,
    List<Pickup> pickups,
    String error
  }) {
    return PickupState(
      isLoading: isLoading ?? this.isLoading,
      pickups: pickups ?? this.pickups,
      error: error ?? this.error,
    );
  }
}