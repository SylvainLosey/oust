library invoice_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../data/models/invoice.dart';
import '../../data/models/serializers.dart';
import '../../data/models/invoice_item.dart';

part 'invoice_state.g.dart';

abstract class InvoiceState implements Built<InvoiceState, InvoiceStateBuilder> {
  static Serializer<InvoiceState> get serializer => _$invoiceStateSerializer;
  factory InvoiceState() => _$InvoiceState((InvoiceStateBuilder b) => b
    ..fetchCount = 0
  );
  InvoiceState._();

  @nullable
  String get error;

  int get fetchCount;

  @nullable
  BuiltMap<int, Invoice> get invoices;

  @nullable
  BuiltMap<int, InvoiceItem> get invoiceItems;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(InvoiceState.serializer, this);
  }

  static InvoiceState fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(InvoiceState.serializer, jsonString);
  }
}