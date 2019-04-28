library subscriptionForm;

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
  );

  SubscriptionForm._();

  @nullable
  String get address;

  @nullable
  int get bigContainerQuantity;

  @nullable
  String get contactMethod;

  int get currentStep;

  @nullable
  String get email;

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
  String get registrationMethod;



  @nullable
  int get selectedLocationIndex;

  @nullable
  int get smallContainerQuantity;

  @nullable
  bool get wantsContainers;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(SubscriptionForm.serializer, this);
  }

  static SubscriptionForm fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(SubscriptionForm.serializer, jsonString);
  }
}