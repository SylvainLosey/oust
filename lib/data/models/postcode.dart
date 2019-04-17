library postcode;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'postcode.g.dart';

abstract class Postcode implements Built<Postcode, PostcodeBuilder> {
  int get id;
  String get postcode;
  String get country;
  String get name;
  @BuiltValueField(wireName: 'subscription_available')
  bool get subscriptionAvailable;
  @BuiltValueField(wireName: 'lift_available')
  bool get liftAvailable;
  @nullable
  int get state;

  Postcode._();

  factory Postcode([updates(PostcodeBuilder b)]) = _$Postcode;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Postcode.serializer, this);
  }

  static Postcode fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(Postcode.serializer, jsonString);
  }

  static Serializer<Postcode> get serializer => _$postcodeSerializer;
  

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
