import 'package:json_annotation/json_annotation.dart';

part 'subscription.g.dart';

@JsonSerializable()
class Subscription {
    int id;
    String representation;
    List<double> position;
    @JsonKey(name: 'subscription_type')
    String subscriptionType;
    String status;
    @JsonKey(name: 'base_date')
    String baseDate;
    @JsonKey(name: 'remaining_pickups')
    int remainingPickups;
    @JsonKey(name: 'pickup_day')
    int pickupDay;
    @JsonKey(name: 'average_quantity')
    int averageQuantity;
    String note;
    String name;
    String address;
    String city;
    int postcode;
    int customer;

    Subscription({
        this.id,
        this.representation,
        this.position,
        this.postcode,
        this.subscriptionType,
        this.status,
        this.baseDate,
        this.remainingPickups,
        this.pickupDay,
        this.averageQuantity,
        this.note,
        this.name,
        this.address,
        this.city,
        this.customer,
    });

    factory Subscription.fromJson(Map<String, dynamic> json) => _$SubscriptionFromJson(json);
    Map<String, dynamic> toJson() => _$SubscriptionToJson(this);
}

