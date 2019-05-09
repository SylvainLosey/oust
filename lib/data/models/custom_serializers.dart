import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:decimal/decimal.dart';

/// A Serializer which for date without time specified.
class DateSerializer implements PrimitiveSerializer<DateTime> {
  final bool structured = false;
  @override
  final Iterable<Type> types = BuiltList<Type>(<Type>[DateTime]);
  @override
  final String wireName = 'DateTime';

  @override
  DateTime deserialize(Serializers serializers, Object serialized, {FullType specifiedType = FullType.unspecified}) {
    return DateTime.parse(serialized as String);
  }

  @override
  Object serialize(Serializers serializers, DateTime dateTime, {FullType specifiedType = FullType.unspecified}) {
    return dateTime.toString().substring(0,10);
  }
}

class DecimalSerializer implements PrimitiveSerializer<Decimal> {
  @override
  final Iterable<Type> types = BuiltList<Type>(<Type>[Decimal]);
  @override
  final String wireName = 'Decimal';

  @override
  Decimal deserialize(Serializers serializers, Object serialized, {FullType specifiedType = FullType.unspecified}) {
    return Decimal.parse(serialized as String);
  }

  @override
  Object serialize(Serializers serializers, Decimal decimal, {FullType specifiedType = FullType.unspecified}) {
    return decimal.toStringAsFixed(2);
  }
}