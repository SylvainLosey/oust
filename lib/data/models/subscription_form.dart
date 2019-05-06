library subscriptionForm;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'subscription_form.g.dart';

abstract class SubscriptionForm implements Built<SubscriptionForm, SubscriptionFormBuilder> {
  static Serializer<SubscriptionForm> get serializer => _$subscriptionFormSerializer;

  // TODO Check if updates parameter is necessary
  factory SubscriptionForm() => _$SubscriptionForm((SubscriptionFormBuilder b) => b
    ..currentStep = 0
    ..smallContainerQuantity = 0
    ..bigContainerQuantity = 0
    ..frequency = 2
  );

  SubscriptionForm._();

  int get currentStep;

  @nullable
  int get frequency;

  @nullable
  String get address;

  @nullable
  String get contactMethod;

  @nullable
  String get registrationMethod;

  @nullable
  String get paymentMethod;

  @nullable
  String get email;

  @nullable
  String get password;

  @nullable
  String get firstName;

  @nullable
  String get lastName;

  @nullable
  String get leadStatus;

  @nullable 
  String get location;

  @nullable
  String get phoneNumber;

  @nullable
  int get postcode;

  @nullable
  int get selectedLocationIndex;

  @nullable
  int get selectedPackage;
  
  @nullable
  int get smallContainerQuantity;

  @nullable
  int get bigContainerQuantity;

  @nullable
  bool get wantsContainers;

  @nullable
  DateTime get selectedStartDate;

  @nullable
  BuiltList<DateTime> get startDates;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(SubscriptionForm.serializer, this);
  }

  static SubscriptionForm fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(SubscriptionForm.serializer, jsonString);
  }
}