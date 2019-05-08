// GENERATED CODE - DO NOT MODIFY BY HAND

part of invoice;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Invoice> _$invoiceSerializer = new _$InvoiceSerializer();

class _$InvoiceSerializer implements StructuredSerializer<Invoice> {
  @override
  final Iterable<Type> types = const [Invoice, _$Invoice];
  @override
  final String wireName = 'Invoice';

  @override
  Iterable serialize(Serializers serializers, Invoice object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.invoiceDate != null) {
      result
        ..add('invoice_date')
        ..add(serializers.serialize(object.invoiceDate,
            specifiedType: const FullType(String)));
    }
    if (object.header != null) {
      result
        ..add('header')
        ..add(serializers.serialize(object.header,
            specifiedType: const FullType(String)));
    }
    if (object.footer != null) {
      result
        ..add('footer')
        ..add(serializers.serialize(object.footer,
            specifiedType: const FullType(String)));
    }
    if (object.status != null) {
      result
        ..add('status')
        ..add(serializers.serialize(object.status,
            specifiedType: const FullType(int)));
    }
    if (object.bexioId != null) {
      result
        ..add('bexio_id')
        ..add(serializers.serialize(object.bexioId,
            specifiedType: const FullType(String)));
    }
    if (object.invoiceNumber != null) {
      result
        ..add('invoice_number')
        ..add(serializers.serialize(object.invoiceNumber,
            specifiedType: const FullType(String)));
    }
    if (object.created != null) {
      result
        ..add('created')
        ..add(serializers.serialize(object.created,
            specifiedType: const FullType(String)));
    }
    if (object.modified != null) {
      result
        ..add('modified')
        ..add(serializers.serialize(object.modified,
            specifiedType: const FullType(String)));
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
  Invoice deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InvoiceBuilder();

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
        case 'invoice_date':
          result.invoiceDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'header':
          result.header = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'footer':
          result.footer = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'bexio_id':
          result.bexioId = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'invoice_number':
          result.invoiceNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'created':
          result.created = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'modified':
          result.modified = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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

class _$Invoice extends Invoice {
  @override
  final int id;
  @override
  final String invoiceDate;
  @override
  final String header;
  @override
  final String footer;
  @override
  final int status;
  @override
  final String bexioId;
  @override
  final String invoiceNumber;
  @override
  final String created;
  @override
  final String modified;
  @override
  final int customer;

  factory _$Invoice([void Function(InvoiceBuilder) updates]) =>
      (new InvoiceBuilder()..update(updates)).build();

  _$Invoice._(
      {this.id,
      this.invoiceDate,
      this.header,
      this.footer,
      this.status,
      this.bexioId,
      this.invoiceNumber,
      this.created,
      this.modified,
      this.customer})
      : super._();

  @override
  Invoice rebuild(void Function(InvoiceBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InvoiceBuilder toBuilder() => new InvoiceBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Invoice &&
        id == other.id &&
        invoiceDate == other.invoiceDate &&
        header == other.header &&
        footer == other.footer &&
        status == other.status &&
        bexioId == other.bexioId &&
        invoiceNumber == other.invoiceNumber &&
        created == other.created &&
        modified == other.modified &&
        customer == other.customer;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc($jc(0, id.hashCode),
                                        invoiceDate.hashCode),
                                    header.hashCode),
                                footer.hashCode),
                            status.hashCode),
                        bexioId.hashCode),
                    invoiceNumber.hashCode),
                created.hashCode),
            modified.hashCode),
        customer.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Invoice')
          ..add('id', id)
          ..add('invoiceDate', invoiceDate)
          ..add('header', header)
          ..add('footer', footer)
          ..add('status', status)
          ..add('bexioId', bexioId)
          ..add('invoiceNumber', invoiceNumber)
          ..add('created', created)
          ..add('modified', modified)
          ..add('customer', customer))
        .toString();
  }
}

class InvoiceBuilder implements Builder<Invoice, InvoiceBuilder> {
  _$Invoice _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _invoiceDate;
  String get invoiceDate => _$this._invoiceDate;
  set invoiceDate(String invoiceDate) => _$this._invoiceDate = invoiceDate;

  String _header;
  String get header => _$this._header;
  set header(String header) => _$this._header = header;

  String _footer;
  String get footer => _$this._footer;
  set footer(String footer) => _$this._footer = footer;

  int _status;
  int get status => _$this._status;
  set status(int status) => _$this._status = status;

  String _bexioId;
  String get bexioId => _$this._bexioId;
  set bexioId(String bexioId) => _$this._bexioId = bexioId;

  String _invoiceNumber;
  String get invoiceNumber => _$this._invoiceNumber;
  set invoiceNumber(String invoiceNumber) =>
      _$this._invoiceNumber = invoiceNumber;

  String _created;
  String get created => _$this._created;
  set created(String created) => _$this._created = created;

  String _modified;
  String get modified => _$this._modified;
  set modified(String modified) => _$this._modified = modified;

  int _customer;
  int get customer => _$this._customer;
  set customer(int customer) => _$this._customer = customer;

  InvoiceBuilder();

  InvoiceBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _invoiceDate = _$v.invoiceDate;
      _header = _$v.header;
      _footer = _$v.footer;
      _status = _$v.status;
      _bexioId = _$v.bexioId;
      _invoiceNumber = _$v.invoiceNumber;
      _created = _$v.created;
      _modified = _$v.modified;
      _customer = _$v.customer;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Invoice other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Invoice;
  }

  @override
  void update(void Function(InvoiceBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Invoice build() {
    final _$result = _$v ??
        new _$Invoice._(
            id: id,
            invoiceDate: invoiceDate,
            header: header,
            footer: footer,
            status: status,
            bexioId: bexioId,
            invoiceNumber: invoiceNumber,
            created: created,
            modified: modified,
            customer: customer);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
