import 'package:json_annotation/json_annotation.dart';

part 'consumer_subscription.g.dart';

@JsonSerializable()
class ConsumerSubscription{
    int subscription;
    int package;

    ConsumerSubscription({
        this.subscription,
        this.package,
    });

    factory ConsumerSubscription.fromJson(Map<String, dynamic> json) => _$ConsumerSubscriptionFromJson(json);
    Map<String, dynamic> toJson() => _$ConsumerSubscriptionToJson(this);
}
