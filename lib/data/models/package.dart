import 'package:json_annotation/json_annotation.dart';

part 'package.g.dart';

@JsonSerializable()
class Package {
    int id;
    String name;
    String length;
    @JsonKey(name: 'frequency_weeks')
    int frequencyWeeks;
    int pickups;
    @JsonKey(name: 'unit_price')
    String unitPrice;

    Package({
        this.id,
        this.name,
        this.length,
        this.frequencyWeeks,
        this.pickups,
        this.unitPrice,
    });

    factory Package.fromJson(Map<String, dynamic> json) => _$PackageFromJson(json);
    Map<String, dynamic> toJson() => _$PackageToJson(this);
}
