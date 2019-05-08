// GENERATED CODE - DO NOT MODIFY BY HAND

part of invoice_item;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<InvoiceItem> _$invoiceItemSerializer = new _$InvoiceItemSerializer();

class _$InvoiceItemSerializer implements StructuredSerializer<InvoiceItem> {
  @override
  final Iterable<Type> types = const [InvoiceItem, _$InvoiceItem];
  @override
  final String wireName = 'InvoiceItem';

  @override
  Iterable serialize(Serializers serializers, InvoiceItem object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.id != null) {
      result
        ..add('id')
        ..add(serializers.serialize(object.id,
            specifiedType: const FullType(int)));
    }
    if (object.date != null) {
      result
        ..add('date')
        ..add(serializers.serialize(object.date,
            specifiedType: const FullType(String)));
    }
    if (object.address != null) {
      result
        ..add('address')
        ..add(serializers.serialize(object.address,
            specifiedType: const FullType(String)));
    }
    if (object.details != null) {
      result
        ..add('details')
        ..add(serializers.serialize(object.details,
            specifiedType: const FullType(String)));
    }
    if (object.numberOfEmployees != null) {
      result
        ..add('number_of_employees')
        ..add(serializers.serialize(object.numberOfEmployees,
            specifiedType: const FullType(String)));
    }
    if (object.duration != null) {
      result
        ..add('duration')
        ..add(serializers.serialize(object.duration,
            specifiedType: const FullType(String)));
    }
    if (object.unitPrice != null) {
      result
        ..add('unit_price')
        ..add(serializers.serialize(object.unitPrice,
            specifiedType: const FullType(String)));
    }
    if (object.amount != null) {
      result
        ..add('amount')
        ..add(serializers.serialize(object.amount,
            specifiedType: const FullType(String)));
    }
    if (object.unitId != null) {
      result
        ..add('unit_id')
        ..add(serializers.serialize(object.unitId,
            specifiedType: const FullType(int)));
    }
    if (object.invoiced != null) {
      result
        ..add('invoiced')
        ..add(serializers.serialize(object.invoiced,
            specifiedType: const FullType(bool)));
    }
    if (object.invoicedDate != null) {
      result
        ..add('invoiced_date')
        ..add(serializers.serialize(object.invoicedDate,
            specifiedType: const FullType(String)));
    }
    if (object.bexioId != null) {
      result
        ..add('bexio_id')
        ..add(serializers.serialize(object.bexioId,
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
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    if (object.paidCash != null) {
      result
        ..add('paid_cash')
        ..add(serializers.serialize(object.paidCash,
            specifiedType: const FullType(bool)));
    }
    if (object.customer != null) {
      result
        ..add('customer')
        ..add(serializers.serialize(object.customer,
            specifiedType: const FullType(int)));
    }
    if (object.subscription != null) {
      result
        ..add('subscription')
        ..add(serializers.serialize(object.subscription,
            specifiedType: const FullType(int)));
    }
    if (object.invoice != null) {
      result
        ..add('invoice')
        ..add(serializers.serialize(object.invoice,
            specifiedType: const FullType(int)));
    }
    if (object.product != null) {
      result
        ..add('product')
        ..add(serializers.serialize(object.product,
            specifiedType: const FullType(int)));
    }
    if (object.paidTo != null) {
      result
        ..add('paid_to')
        ..add(serializers.serialize(object.paidTo,
            specifiedType: const FullType(String)));
    }

    return result;
  }

  @override
  InvoiceItem deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InvoiceItemBuilder();

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
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'address':
          result.address = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'details':
          result.details = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'number_of_employees':
          result.numberOfEmployees = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'duration':
          result.duration = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'unit_price':
          result.unitPrice = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'unit_id':
          result.unitId = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'invoiced':
          result.invoiced = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'invoiced_date':
          result.invoicedDate = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'bexio_id':
          result.bexioId = serializers.deserialize(value,
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
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'paid_cash':
          result.paidCash = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'customer':
          result.customer = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'subscription':
          result.subscription = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'invoice':
          result.invoice = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'product':
          result.product = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'paid_to':
          result.paidTo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$InvoiceItem extends InvoiceItem {
  @override
  final int id;
  @override
  final String date;
  @override
  final String address;
  @override
  final String details;
  @override
  final String numberOfEmployees;
  @override
  final String duration;
  @override
  final String unitPrice;
  @override
  final String amount;
  @override
  final int unitId;
  @override
  final bool invoiced;
  @override
  final String invoicedDate;
  @override
  final String bexioId;
  @override
  final String created;
  @override
  final String modified;
  @override
  final String name;
  @override
  final String description;
  @override
  final bool paidCash;
  @override
  final int customer;
  @override
  final int subscription;
  @override
  final int invoice;
  @override
  final int product;
  @override
  final String paidTo;

  factory _$InvoiceItem([void Function(InvoiceItemBuilder) updates]) =>
      (new InvoiceItemBuilder()..update(updates)).build();

  _$InvoiceItem._(
      {this.id,
      this.date,
      this.address,
      this.details,
      this.numberOfEmployees,
      this.duration,
      this.unitPrice,
      this.amount,
      this.unitId,
      this.invoiced,
      this.invoicedDate,
      this.bexioId,
      this.created,
      this.modified,
      this.name,
      this.description,
      this.paidCash,
      this.customer,
      this.subscription,
      this.invoice,
      this.product,
      this.paidTo})
      : super._();

  @override
  InvoiceItem rebuild(void Function(InvoiceItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InvoiceItemBuilder toBuilder() => new InvoiceItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InvoiceItem &&
        id == other.id &&
        date == other.date &&
        address == other.address &&
        details == other.details &&
        numberOfEmployees == other.numberOfEmployees &&
        duration == other.duration &&
        unitPrice == other.unitPrice &&
        amount == other.amount &&
        unitId == other.unitId &&
        invoiced == other.invoiced &&
        invoicedDate == other.invoicedDate &&
        bexioId == other.bexioId &&
        created == other.created &&
        modified == other.modified &&
        name == other.name &&
        description == other.description &&
        paidCash == other.paidCash &&
        customer == other.customer &&
        subscription == other.subscription &&
        invoice == other.invoice &&
        product == other.product &&
        paidTo == other.paidTo;
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
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        $jc(
                                                                            $jc($jc($jc($jc(0, id.hashCode), date.hashCode), address.hashCode),
                                                                                details.hashCode),
                                                                            numberOfEmployees.hashCode),
                                                                        duration.hashCode),
                                                                    unitPrice.hashCode),
                                                                amount.hashCode),
                                                            unitId.hashCode),
                                                        invoiced.hashCode),
                                                    invoicedDate.hashCode),
                                                bexioId.hashCode),
                                            created.hashCode),
                                        modified.hashCode),
                                    name.hashCode),
                                description.hashCode),
                            paidCash.hashCode),
                        customer.hashCode),
                    subscription.hashCode),
                invoice.hashCode),
            product.hashCode),
        paidTo.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('InvoiceItem')
          ..add('id', id)
          ..add('date', date)
          ..add('address', address)
          ..add('details', details)
          ..add('numberOfEmployees', numberOfEmployees)
          ..add('duration', duration)
          ..add('unitPrice', unitPrice)
          ..add('amount', amount)
          ..add('unitId', unitId)
          ..add('invoiced', invoiced)
          ..add('invoicedDate', invoicedDate)
          ..add('bexioId', bexioId)
          ..add('created', created)
          ..add('modified', modified)
          ..add('name', name)
          ..add('description', description)
          ..add('paidCash', paidCash)
          ..add('customer', customer)
          ..add('subscription', subscription)
          ..add('invoice', invoice)
          ..add('product', product)
          ..add('paidTo', paidTo))
        .toString();
  }
}

class InvoiceItemBuilder implements Builder<InvoiceItem, InvoiceItemBuilder> {
  _$InvoiceItem _$v;

  int _id;
  int get id => _$this._id;
  set id(int id) => _$this._id = id;

  String _date;
  String get date => _$this._date;
  set date(String date) => _$this._date = date;

  String _address;
  String get address => _$this._address;
  set address(String address) => _$this._address = address;

  String _details;
  String get details => _$this._details;
  set details(String details) => _$this._details = details;

  String _numberOfEmployees;
  String get numberOfEmployees => _$this._numberOfEmployees;
  set numberOfEmployees(String numberOfEmployees) =>
      _$this._numberOfEmployees = numberOfEmployees;

  String _duration;
  String get duration => _$this._duration;
  set duration(String duration) => _$this._duration = duration;

  String _unitPrice;
  String get unitPrice => _$this._unitPrice;
  set unitPrice(String unitPrice) => _$this._unitPrice = unitPrice;

  String _amount;
  String get amount => _$this._amount;
  set amount(String amount) => _$this._amount = amount;

  int _unitId;
  int get unitId => _$this._unitId;
  set unitId(int unitId) => _$this._unitId = unitId;

  bool _invoiced;
  bool get invoiced => _$this._invoiced;
  set invoiced(bool invoiced) => _$this._invoiced = invoiced;

  String _invoicedDate;
  String get invoicedDate => _$this._invoicedDate;
  set invoicedDate(String invoicedDate) => _$this._invoicedDate = invoicedDate;

  String _bexioId;
  String get bexioId => _$this._bexioId;
  set bexioId(String bexioId) => _$this._bexioId = bexioId;

  String _created;
  String get created => _$this._created;
  set created(String created) => _$this._created = created;

  String _modified;
  String get modified => _$this._modified;
  set modified(String modified) => _$this._modified = modified;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  bool _paidCash;
  bool get paidCash => _$this._paidCash;
  set paidCash(bool paidCash) => _$this._paidCash = paidCash;

  int _customer;
  int get customer => _$this._customer;
  set customer(int customer) => _$this._customer = customer;

  int _subscription;
  int get subscription => _$this._subscription;
  set subscription(int subscription) => _$this._subscription = subscription;

  int _invoice;
  int get invoice => _$this._invoice;
  set invoice(int invoice) => _$this._invoice = invoice;

  int _product;
  int get product => _$this._product;
  set product(int product) => _$this._product = product;

  String _paidTo;
  String get paidTo => _$this._paidTo;
  set paidTo(String paidTo) => _$this._paidTo = paidTo;

  InvoiceItemBuilder();

  InvoiceItemBuilder get _$this {
    if (_$v != null) {
      _id = _$v.id;
      _date = _$v.date;
      _address = _$v.address;
      _details = _$v.details;
      _numberOfEmployees = _$v.numberOfEmployees;
      _duration = _$v.duration;
      _unitPrice = _$v.unitPrice;
      _amount = _$v.amount;
      _unitId = _$v.unitId;
      _invoiced = _$v.invoiced;
      _invoicedDate = _$v.invoicedDate;
      _bexioId = _$v.bexioId;
      _created = _$v.created;
      _modified = _$v.modified;
      _name = _$v.name;
      _description = _$v.description;
      _paidCash = _$v.paidCash;
      _customer = _$v.customer;
      _subscription = _$v.subscription;
      _invoice = _$v.invoice;
      _product = _$v.product;
      _paidTo = _$v.paidTo;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InvoiceItem other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$InvoiceItem;
  }

  @override
  void update(void Function(InvoiceItemBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$InvoiceItem build() {
    final _$result = _$v ??
        new _$InvoiceItem._(
            id: id,
            date: date,
            address: address,
            details: details,
            numberOfEmployees: numberOfEmployees,
            duration: duration,
            unitPrice: unitPrice,
            amount: amount,
            unitId: unitId,
            invoiced: invoiced,
            invoicedDate: invoicedDate,
            bexioId: bexioId,
            created: created,
            modified: modified,
            name: name,
            description: description,
            paidCash: paidCash,
            customer: customer,
            subscription: subscription,
            invoice: invoice,
            product: product,
            paidTo: paidTo);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
