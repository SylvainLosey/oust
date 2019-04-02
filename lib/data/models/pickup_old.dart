// To parse this JSON data, do
//
//     final pickup = pickupFromJson(jsonString);

// List<Pickup> pickupFromJson(String str) {
//     final jsonData = json.decode(str);
//     return  List<Pickup>.from(jsonData.map((x) => Pickup.fromJson(x)));
// }

// String pickupToJson(List<Pickup> data) {
//     final dyn =  List<dynamic>.from(data.map((x) => x.toJson()));
//     return json.encode(dyn);
// }
import '../../utils/datetime_utils.dart';

class Pickup {
    int id;
    String representation;
    String city;
    List<double> position;
    int averageDuration;
    int averageQuantity;
    DateTime pickupDate;
    dynamic duration;
    bool completed;
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

    factory Pickup.fromJson(Map<String, dynamic> json) =>  Pickup(
        id: json['id'],
        representation: json['representation'],
        city: json['city'],
        position: List<double>.from(json['position'].map((dynamic x) => x.toDouble())),
        averageDuration: json['average_duration'],
        averageQuantity: json['average_quantity'],
        pickupDate: DateTime.parse(json['pickup_date']),
        duration: json['duration'],
        completed: json['completed'],
        customerUnavailable: json['customer_unavailable'],
        note: json['note'],
        subscription: json['subscription'],
    );

    Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'representation': representation,
        'city': city,
        'position':  List<dynamic>.from(position.map<double>((dynamic x) => x)),
        'average_duration': averageDuration,
        'average_quantity': averageQuantity,
        'pickup_date': dateToString(pickupDate),
        'duration': duration,
        'completed': completed,
        'customer_unavailable': customerUnavailable,
        'note': note,
        'subscription': subscription,
    };
}