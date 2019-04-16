library subscriptionForm;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'subscription_form.g.dart';

abstract class SubscriptionForm implements Built<SubscriptionForm, SubscriptionFormBuilder> {
  int get currentStep;
  @nullable
  int get packageId;
  @nullable
  String get firstName;
  @nullable
  String get lastName;
  @nullable
  String get address;
  @nullable
  int get postcode;
  @nullable
  bool get appRegistration;
  @nullable
  int get smallBins;
  @nullable
  int get bigBins;
  @nullable
  int get accessType;
  @nullable
  String get code;
  @nullable
  bool get doorKey;
  @nullable
  String get note;
  @nullable
  String get phoneNumber;
  @nullable
  DateTime get startDate;
  @nullable
  String get email;
  @nullable
  String get password;

  SubscriptionForm._();

  factory SubscriptionForm([void Function(SubscriptionFormBuilder) updates]) => _$SubscriptionForm((b) => b
    ..currentStep = 0
  );

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(SubscriptionForm.serializer, this);
  }

  static SubscriptionForm fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(SubscriptionForm.serializer, jsonString);
  }

  static Serializer<SubscriptionForm> get serializer => _$subscriptionFormSerializer;
}