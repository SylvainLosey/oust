import 'package:json_annotation/json_annotation.dart';

part 'subscription_form.g.dart';

@JsonSerializable()
class SubscriptionForm{
  int currentStep;
  int packageId;
  String firstName;
  String lastName;
  String address;
  int postcodeId;
  bool appRegistration;
  int smallBins;
  int bigBins;
  int accessType;
  String code;
  bool doorKey;
  String note;
  String phoneNumber;
  DateTime startDate;
  String email;
  String password;

  SubscriptionForm({
    this.currentStep,
    this.packageId,
    this.firstName,
    this.lastName,
    this.address,
    this.postcodeId,
    this.appRegistration,
    this.smallBins,
    this.bigBins,
    this.accessType,
    this.code,
    this.doorKey,
    this.note,
    this.phoneNumber,
    this.startDate,
    this.email,
    this.password,
  });

    factory SubscriptionForm.fromJson(Map<String, dynamic> json) => _$SubscriptionFormFromJson(json);
    Map<String, dynamic> toJson() => _$SubscriptionFormToJson(this);

    SubscriptionForm copyWith({
      int currentStep,
      int packageId,
      String firstName,
      String lastName,
      String address,
      int postcodeId,
      bool appRegistration,
      int smallBins,
      int bigBins,
      int accessType,
      String code,
      bool doorKey,
      String note,
      String phoneNumber,
      DateTime startDate,
      String email,
      String password,
    }) {
      return SubscriptionForm(
        currentStep: currentStep ?? this.currentStep,
        packageId: packageId ?? this.packageId,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        address: address ?? this.address,
        postcodeId: postcodeId ?? this.postcodeId,
        appRegistration: appRegistration ?? this.appRegistration,
        smallBins: smallBins ?? this.smallBins,
        bigBins: bigBins ?? this.bigBins,
        accessType: accessType ?? this.accessType,
        code: code ?? this.code,
        doorKey: doorKey ?? this.doorKey,
        note: note ?? this.note,
        phoneNumber: phoneNumber ?? this.phoneNumber, 
        startDate: startDate ?? this. startDate,
        email: email ?? this.email,
        password: password ?? this.password,
      );
    }
} 




