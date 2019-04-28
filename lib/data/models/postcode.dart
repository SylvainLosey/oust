library postcode;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'postcode.g.dart';

abstract class Postcode implements Built<Postcode, PostcodeBuilder> {
  static Serializer<Postcode> get serializer => _$postcodeSerializer;
  factory Postcode([updates(PostcodeBuilder b)]) = _$Postcode;
  Postcode._();
  
  String get country;
  int get id;
  @BuiltValueField(wireName: 'lift_available')
  bool get liftAvailable;
  String get name;

  String get postcode;

  @nullable
  int get state;

  @BuiltValueField(wireName: 'subscription_available')
  bool get subscriptionAvailable;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Postcode.serializer, this);
  }

  static Postcode fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(Postcode.serializer, jsonString);
  }
  

  // CLASS METHODS

  static List<Postcode> getSuggestions(String pattern, Map<int, Postcode> postcodes) {
    final List<Postcode> results = <Postcode>[];
    final List<String> searchTerms = pattern.split(' ');

    // Go through each swiss postcode
    for (Postcode postcode in postcodes.values) {
      if (postcode.country != 'CH') continue;
      
      // Check if every search term is a match to either the postcode or the town
      bool matchUntilNow = true;
      for (String searchTerm in searchTerms) {
        if (matchUntilNow) {
          matchUntilNow = postcode.postcode.startsWith(searchTerm) || postcode.name.toLowerCase().startsWith(searchTerm.toLowerCase());
        }
      }
      
      if (matchUntilNow) {
        results.add(postcode);
      }

      if (results != null && results.length > 10) {
        break;
      }
      
    }

    return results;
  }
}
