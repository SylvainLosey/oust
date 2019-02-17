class Subscription {
    final int id;
    final String representation;
    final List<double> position;
    final String postcode;
    final String subscriptionType;
    final String status;
    final String baseDate;
    final int remainingPickups;
    final int pickupDay;
    final int averageQuantity;
    final String note;
    final bool otherSubscription;
    final String name;
    final String address;
    final String city;
    final bool greenWaste;
    final String created;
    final String modified;
    final int customer;
    final Package package;


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
        this.otherSubscription,
        this.name,
        this.address,
        this.city,
        this.greenWaste,
        this.created,
        this.modified,
        this.customer,
        this.package,
    });

    factory Subscription.fromJson(List<dynamic> json) => Subscription(
        id: json[0]['subscription']['id'],
        representation: json[0]['subscription']['representation'],
        position: List<double>.from(json[0]['subscription']['position'].map((dynamic x) => x.toDouble())),
        postcode: json[0]['subscription']['postcode'],
        subscriptionType: json[0]['subscription']['subscription_type'],
        status: json[0]['subscription']['status'],
        baseDate: json[0]['subscription']['base_date'],
        remainingPickups: json[0]['subscription']['remaining_pickups'],
        pickupDay: json[0]['subscription']['pickup_day'],
        averageQuantity: json[0]['subscription']['average_quantity'],
        note: json[0]['subscription']['note'],
        otherSubscription: json[0]['subscription']['other_subscription'],
        name: json[0]['subscription']['name'],
        address: json[0]['subscription']['address'],
        city: json[0]['subscription']['city'],
        greenWaste: json[0]['subscription']['green_waste'],
        created: json[0]['subscription']['created'],
        modified: json[0]['subscription']['modified'],
        customer: json[0]['subscription']['customer'],
        package: Package.fromJson(json[0]['package'])
    );

    Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'representation': representation,
        'position': List<dynamic>.from(position.map<double>((dynamic x) => x)),
        'postcode': postcode,
        'subscription_type': subscriptionType,
        'status': status,
        'base_date': baseDate,
        'remaining_pickups': remainingPickups,
        'pickup_day': pickupDay,
        'average_quantity': averageQuantity,
        'note': note,
        'other_subscription': otherSubscription,
        'name': name,
        'address': address,
        'city': city,
        'green_waste': greenWaste,
        'created': created,
        'modified': modified,
        'customer': customer,
    };
}

class Package {
    int id;
    String name;
    String length;
    int frequencyWeeks;
    int pickups;
    String unitPrice;

    Package({
        this.id,
        this.name,
        this.length,
        this.frequencyWeeks,
        this.pickups,
        this.unitPrice,
    });

    factory Package.fromJson(Map<String, dynamic> json) => Package(
        id: json['id'],
        name: json['name'],
        length: json['length'],
        frequencyWeeks: json['frequency_weeks'],
        pickups: json['pickups'],
        unitPrice: json['unit_price'],
    );

    Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'length': length,
        'frequency_weeks': frequencyWeeks,
        'pickups': pickups,
        'unit_price': unitPrice,
    };
}
