library subscriptionRegister;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'subscription_register.g.dart';

abstract class SubscriptionRegister implements Built<SubscriptionRegister, SubscriptionRegisterBuilder> {
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
  int get postcodeId;
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

  SubscriptionRegister._();

  factory SubscriptionRegister([void Function(SubscriptionRegisterBuilder) updates]) => _$SubscriptionRegister((b) => b
    ..currentStep = 1
  );

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(SubscriptionRegister.serializer, this);
  }

  static SubscriptionRegister fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(SubscriptionRegister.serializer, jsonString);
  }

  static Serializer<SubscriptionRegister> get serializer => _$subscriptionRegisterSerializer;
}