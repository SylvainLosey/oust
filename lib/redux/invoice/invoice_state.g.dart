// GENERATED CODE - DO NOT MODIFY BY HAND

part of invoice_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<InvoiceState> _$invoiceStateSerializer =
    new _$InvoiceStateSerializer();

class _$InvoiceStateSerializer implements StructuredSerializer<InvoiceState> {
  @override
  final Iterable<Type> types = const [InvoiceState, _$InvoiceState];
  @override
  final String wireName = 'InvoiceState';

  @override
  Iterable serialize(Serializers serializers, InvoiceState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'fetchCount',
      serializers.serialize(object.fetchCount,
          specifiedType: const FullType(int)),
    ];
    if (object.error != null) {
      result
        ..add('error')
        ..add(serializers.serialize(object.error,
            specifiedType: const FullType(String)));
    }
    if (object.invoices != null) {
      result
        ..add('invoices')
        ..add(serializers.serialize(object.invoices,
            specifiedType: const FullType(BuiltMap,
                const [const FullType(int), const FullType(Invoice)])));
    }
    if (object.invoiceItems != null) {
      result
        ..add('invoiceItems')
        ..add(serializers.serialize(object.invoiceItems,
            specifiedType: const FullType(BuiltMap,
                const [const FullType(int), const FullType(InvoiceItem)])));
    }

    return result;
  }

  @override
  InvoiceState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new InvoiceStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'error':
          result.error = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'fetchCount':
          result.fetchCount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'invoices':
          result.invoices.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(int),
                const FullType(Invoice)
              ])) as BuiltMap);
          break;
        case 'invoiceItems':
          result.invoiceItems.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap, const [
                const FullType(int),
                const FullType(InvoiceItem)
              ])) as BuiltMap);
          break;
      }
    }

    return result.build();
  }
}

class _$InvoiceState extends InvoiceState {
  @override
  final String error;
  @override
  final int fetchCount;
  @override
  final BuiltMap<int, Invoice> invoices;
  @override
  final BuiltMap<int, InvoiceItem> invoiceItems;

  factory _$InvoiceState([void Function(InvoiceStateBuilder) updates]) =>
      (new InvoiceStateBuilder()..update(updates)).build();

  _$InvoiceState._(
      {this.error, this.fetchCount, this.invoices, this.invoiceItems})
      : super._() {
    if (fetchCount == null) {
      throw new BuiltValueNullFieldError('InvoiceState', 'fetchCount');
    }
  }

  @override
  InvoiceState rebuild(void Function(InvoiceStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  InvoiceStateBuilder toBuilder() => new InvoiceStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is InvoiceState &&
        error == other.error &&
        fetchCount == other.fetchCount &&
        invoices == other.invoices &&
        invoiceItems == other.invoiceItems;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, error.hashCode), fetchCount.hashCode),
            invoices.hashCode),
        invoiceItems.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('InvoiceState')
          ..add('error', error)
          ..add('fetchCount', fetchCount)
          ..add('invoices', invoices)
          ..add('invoiceItems', invoiceItems))
        .toString();
  }
}

class InvoiceStateBuilder
    implements Builder<InvoiceState, InvoiceStateBuilder> {
  _$InvoiceState _$v;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  int _fetchCount;
  int get fetchCount => _$this._fetchCount;
  set fetchCount(int fetchCount) => _$this._fetchCount = fetchCount;

  MapBuilder<int, Invoice> _invoices;
  MapBuilder<int, Invoice> get invoices =>
      _$this._invoices ??= new MapBuilder<int, Invoice>();
  set invoices(MapBuilder<int, Invoice> invoices) =>
      _$this._invoices = invoices;

  MapBuilder<int, InvoiceItem> _invoiceItems;
  MapBuilder<int, InvoiceItem> get invoiceItems =>
      _$this._invoiceItems ??= new MapBuilder<int, InvoiceItem>();
  set invoiceItems(MapBuilder<int, InvoiceItem> invoiceItems) =>
      _$this._invoiceItems = invoiceItems;

  InvoiceStateBuilder();

  InvoiceStateBuilder get _$this {
    if (_$v != null) {
      _error = _$v.error;
      _fetchCount = _$v.fetchCount;
      _invoices = _$v.invoices?.toBuilder();
      _invoiceItems = _$v.invoiceItems?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(InvoiceState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$InvoiceState;
  }

  @override
  void update(void Function(InvoiceStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$InvoiceState build() {
    _$InvoiceState _$result;
    try {
      _$result = _$v ??
          new _$InvoiceState._(
              error: error,
              fetchCount: fetchCount,
              invoices: _invoices?.build(),
              invoiceItems: _invoiceItems?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'invoices';
        _invoices?.build();
        _$failedField = 'invoiceItems';
        _invoiceItems?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'InvoiceState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
