library pickup;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'pickup.g.dart';

abstract class Pickup implements Built<Pickup, PickupBuilder> {
  static Serializer<Pickup> get serializer => _$pickupSerializer;
  factory Pickup([void Function(PickupBuilder) updates]) = _$Pickup;
  Pickup._();

  @nullable
  @BuiltValueField(wireName: 'average_duration')
  int get averageDuration;

  @BuiltValueField(wireName: 'average_quantity')
  @nullable
  int get averageQuantity;

  @nullable
  String get city;

  @nullable
  bool get completed;

  @nullable
  @BuiltValueField(wireName: 'customer_unavailable')
  bool get customerUnavailable;

  @nullable
  String get duration;

  int get id;

  @nullable
  String get note;

  @BuiltValueField(wireName: 'pickup_date')
  @nullable
  DateTime get pickupDate;

  @nullable
  BuiltList<double> get position;

  @nullable
  String get representation;

  int get subscription;

  @nullable
  @BuiltValueField(wireName: 'customer_note')
  String get customerNote;

  @nullable
  @BuiltValueField(wireName: 'is_invoiced')
  bool get isInvoiced;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Pickup.serializer, this);
  }

  static Pickup fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(Pickup.serializer, jsonString);
  }

  /// CLASS METHODS

  // Returns all future pickups
  static BuiltMap<int, Pickup> getFuturePickups(BuiltMap<int, Pickup> pickups) {
    final Map<int, Pickup> pickupsFromToday = <int, Pickup>{};

    pickups.forEach((int index, Pickup pickup) {
      if (pickup.pickupDate.difference(DateTime.now()) >= Duration(days: 1)) {
        pickupsFromToday.addAll(<int, Pickup>{index: pickup});
      }
    });

    return BuiltMap<int, Pickup>.from(pickupsFromToday);
  }

  // Returns the next Pickup
  static Pickup getNextPickup(BuiltMap<int, Pickup> pickups) {
    final BuiltMap<int, Pickup> pickupsFromToday = getFuturePickups(pickups);

    Pickup closestPickup;
    pickupsFromToday.forEach((int index, Pickup currentPickup) {
      closestPickup ??= currentPickup;
      closestPickup = currentPickup.pickupDate.isAfter(closestPickup.pickupDate)
          ? closestPickup
          : currentPickup;
    });

    return closestPickup;
  }
}
