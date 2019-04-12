library pickup;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'pickup.g.dart';

abstract class Pickup implements Built<Pickup, PickupBuilder> {
  int get id;
  @nullable
  String get representation;
  @nullable
  String get city;
  @nullable
  BuiltList<double> get position;
  @nullable
  @BuiltValueField(wireName: 'average_duration')
  @nullable
  int get averageDuration;
  @BuiltValueField(wireName: 'average_quantity')
  @nullable
  int get averageQuantity;
  @BuiltValueField(wireName: 'pickup_date')
  @nullable
  DateTime get pickupDate;
  @nullable
  String get duration;
  @nullable
  bool get completed;
  // @nullable
  // @BuiltValueField(wireName: 'completed_at')
  // DateTime get completedAt;
  @nullable
  @BuiltValueField(wireName: 'customer_unavailable')
  bool get customerUnavailable;
  @nullable
  String get note;
  int get subscription;

  Pickup._();

  factory Pickup([void Function(PickupBuilder) updates]) = _$Pickup;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Pickup.serializer, this);
  }

  static Pickup fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(Pickup.serializer, jsonString);
  }

  static Serializer<Pickup> get serializer => _$pickupSerializer;


  /// CLASS METHODS

  // Returns all future pickups
  static BuiltMap<int, Pickup> getFuturePickups(BuiltMap<int, Pickup> pickups) {
    final Map<int, Pickup> pickupsFromToday = <int, Pickup>{};

    pickups.forEach((int index, Pickup pickup) {
        if (pickup.pickupDate.difference(DateTime.now()) >= Duration(days:1)) {
          pickupsFromToday.addAll(<int, Pickup>{index: pickup});
        }
      }
    );

    return BuiltMap<int, Pickup>.from(pickupsFromToday);
  }

  // Returns the next Pickup
  static Pickup getNextPickup(BuiltMap<int, Pickup> pickups) {
    final BuiltMap<int, Pickup> pickupsFromToday = getFuturePickups(pickups);

    Pickup closestPickup;
    pickupsFromToday.forEach((int index, Pickup currentPickup) {
      closestPickup ??= currentPickup;
      closestPickup = currentPickup.pickupDate.isAfter(closestPickup.pickupDate) ? closestPickup : currentPickup;
    });

    return closestPickup;
  }
}