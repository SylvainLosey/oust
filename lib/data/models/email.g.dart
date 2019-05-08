// GENERATED CODE - DO NOT MODIFY BY HAND

part of email;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Email> _$emailSerializer = new _$EmailSerializer();

class _$EmailSerializer implements StructuredSerializer<Email> {
  @override
  final Iterable<Type> types = const [Email, _$Email];
  @override
  final String wireName = 'Email';

  @override
  Iterable serialize(Serializers serializers, Email object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.email != null) {
      result
        ..add('email')
        ..add(serializers.serialize(object.email,
            specifiedType: const FullType(String)));
    }
    if (object.usedForInvoices != null) {
      result
        ..add('used_for_invoices')
        ..add(serializers.serialize(object.usedForInvoices,
            specifiedType: const FullType(bool)));
    }
    if (object.customer != null) {
      result
        ..add('customer')
        ..add(serializers.serialize(object.customer,
            specifiedType: const FullType(int)));
    }

    return result;
  }

  @override
  Email deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new EmailBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'used_for_invoices':
          result.usedForInvoices = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'customer':
          result.customer = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$Email extends Email {
  @override
  final int id;
  @override
  final String email;
  @override
  final bool usedForInvoices;
  @override
  final int customer;

  factory _$Email([void Function(EmailBuilder) updates]) =>
      (new EmailBuilder()..update(updates)).build();

  _$Email._({this.id, this.email, this.usedForInvoices, this.customer})
      : super._();

  @override
  Email rebuild(void Function(EmailBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  EmailBuilder toBuilder() => new EmailBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Email &&
        id == other.id &&
        email == other.email &&
        usedForInvoices == other.usedForInvoices &&
        customer == other.customer;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, id.hashCode), email.hashCode), usedForInvoices.hashCode),
        customer.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Email')
          ..add('id', id)
          ..add('email', email)
          ..add('usedForInvoices', usedForInvoices)
          ..add('customer', customer))
        .toString();
  }
}

class EmailBuilder implements Builder<Email, EmailBuilder> {
  _$Email _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _email;
  String get email => _$this._email;
  set email(String email) => _$this._email = email;

  bool _usedForInvoices;
  bool get usedForInvoices => _$this._usedForInvoices;
  set usedForInvoices(bool usedForInvoices) =>
      _$this._usedForInvoices = usedForInvoices;

  int _customer;
  int get customer => _$this._customer;
  set customer(int customer) => _$this._customer = customer;

  EmailBuilder();

  EmailBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _email = _$v.email;
      _usedForInvoices = _$v.usedForInvoices;
      _customer = _$v.customer;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Email other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Email;
  }

  @override
  void update(void Function(EmailBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Email build() {
    final _$result = _$v ??
        new _$Email._(
            id: id,
            email: email,
            usedForInvoices: usedForInvoices,
            customer: customer);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
