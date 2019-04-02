import 'package:json_annotation/json_annotation.dart';

part 'pickup.g.dart';

@JsonSerializable()
class Pickup {
    int id;
    String representation;
    String city;
    List<double> position;
    @JsonKey(name: 'customer_duration')
    int averageDuration;
    @JsonKey(name: 'customer_quantity')
    int averageQuantity;
    @JsonKey(name: 'pickup_date')
    DateTime pickupDate;
    dynamic duration;
    bool completed;
    @JsonKey(name: 'customer_unvavailable')
    bool customerUnavailable;
    String note;
    int subscription;

    Pickup({
        this.id,
        this.representation,
        this.city,
        this.position,
        this.averageDuration,
        this.averageQuantity,
        this.pickupDate,
        this.duration,
        this.completed,
        this.customerUnavailable,
        this.note,
        this.subscription,
    });

    factory Pickup.fromJson(Map<String, dynamic> json) => _$PickupFromJson(json);
    Map<String, dynamic> toJson() => _$PickupToJson(this);
}
