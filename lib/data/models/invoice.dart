library invoice;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'invoice.g.dart';

abstract class Invoice implements Built<Invoice, InvoiceBuilder> {

  @nullable
  @BuiltValueField(wireName: 'id')
  int get id;

  @nullable
  @BuiltValueField(wireName: 'invoice_date')
  String get invoiceDate;

  @nullable
  @BuiltValueField(wireName: 'header')
  String get header;

  @nullable
  @BuiltValueField(wireName: 'footer')
  String get footer;

  @nullable
  @BuiltValueField(wireName: 'status')
  int get status;

  @nullable
  @BuiltValueField(wireName: 'bexio_id')
  String get bexioId;

  @nullable
  @BuiltValueField(wireName: 'invoice_number')
  String get invoiceNumber;

  @nullable
  @BuiltValueField(wireName: 'created')
  String get created;

  @nullable
  @BuiltValueField(wireName: 'modified')
  String get modified;

  @nullable
  @BuiltValueField(wireName: 'customer')
  int get customer;

  Invoice._();

  factory Invoice([void Function(InvoiceBuilder) updates]) = _$Invoice;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Invoice.serializer, this);
  }

  static Invoice fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(Invoice.serializer, jsonString);
  }

  static Serializer<Invoice> get serializer => _$invoiceSerializer;
}