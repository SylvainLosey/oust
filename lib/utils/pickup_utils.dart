import '../data/models/pickup.dart';

class PickupUtils {

  // Returns a List of Pickups set today or in the future
  static List<Pickup> getPickupsFromToday(List<Pickup> pickups) {
    final List<Pickup> pickupsFromToday = <Pickup>[];

    for (Pickup pickup in pickups) {
      // Returns true if pickup is today or in the future, false otherwise
      if (pickup.pickupDate.difference(DateTime.now()) >= Duration(days:1)) {
        pickupsFromToday.add(pickup);
      }
    }

    // By default API sorts pickup by pickupDate, if behavior changes sort list here.
    return pickupsFromToday;
  }


  // Returns the next scheduled Pickup 
  static Pickup getNextPickup(List<Pickup> pickups) {
    final List<Pickup> pickupsFromToday = getPickupsFromToday(pickups);
    return pickupsFromToday[0];
  }
}