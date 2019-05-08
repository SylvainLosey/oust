library invoice_item;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'invoice_item.g.dart';

abstract class InvoiceItem implements Built<InvoiceItem, InvoiceItemBuilder> {

  @nullable
  @BuiltValueField(wireName: 'id')
  int get id;

  @nullable
  @BuiltValueField(wireName: 'date')
  String get date;

  @nullable
  @BuiltValueField(wireName: 'address')
  String get address;

  @nullable
  @BuiltValueField(wireName: 'details')
  String get details;

  @nullable
  @BuiltValueField(wireName: 'number_of_employees')
  String get numberOfEmployees;

  @nullable
  @BuiltValueField(wireName: 'duration')
  String get duration;

  @nullable
  @BuiltValueField(wireName: 'unit_price')
  String get unitPrice;

  @nullable
  @BuiltValueField(wireName: 'amount')
  String get amount;

  @nullable
  @BuiltValueField(wireName: 'unit_id')
  int get unitId;

  @nullable
  @BuiltValueField(wireName: 'invoiced')
  bool get invoiced;

  @nullable
  @BuiltValueField(wireName: 'invoiced_date')
  String get invoicedDate;

  @nullable
  @BuiltValueField(wireName: 'bexio_id')
  String get bexioId;

  @nullable
  @BuiltValueField(wireName: 'created')
  String get created;

  @nullable
  @BuiltValueField(wireName: 'modified')
  String get modified;

  @nullable
  @BuiltValueField(wireName: 'name')
  String get name;

  @nullable
  @BuiltValueField(wireName: 'description')
  String get description;

  @nullable
  @BuiltValueField(wireName: 'paid_cash')
  bool get paidCash;

  @nullable
  @BuiltValueField(wireName: 'customer')
  int get customer;

  @nullable
  @BuiltValueField(wireName: 'subscription')
  int get subscription;

  @nullable
  @BuiltValueField(wireName: 'invoice')
  int get invoice;

  @nullable
  @BuiltValueField(wireName: 'product')
  int get product;

  @nullable
  @BuiltValueField(wireName: 'paid_to')
  String get paidTo;

  InvoiceItem._();

  factory InvoiceItem([void Function(InvoiceItemBuilder) updates]) = _$InvoiceItem;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(InvoiceItem.serializer, this);
  }

  static InvoiceItem fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(InvoiceItem.serializer, jsonString);
  }

  static Serializer<InvoiceItem> get serializer => _$invoiceItemSerializer;
}