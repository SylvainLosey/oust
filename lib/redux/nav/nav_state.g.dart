// GENERATED CODE - DO NOT MODIFY BY HAND

part of NavState;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NavState> _$navStateSerializer = new _$NavStateSerializer();

class _$NavStateSerializer implements StructuredSerializer<NavState> {
  @override
  final Iterable<Type> types = const [NavState, _$NavState];
  @override
  final String wireName = 'NavState';

  @override
  Iterable serialize(Serializers serializers, NavState object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'selectedBottomNav',
      serializers.serialize(object.selectedBottomNav,
          specifiedType: const FullType(int)),
    ];

    return result;
  }

  @override
  NavState deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NavStateBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'selectedBottomNav':
          result.selectedBottomNav = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
      }
    }

    return result.build();
  }
}

class _$NavState extends NavState {
  @override
  final int selectedBottomNav;

  factory _$NavState([void Function(NavStateBuilder) updates]) =>
      (new NavStateBuilder()..update(updates)).build();

  _$NavState._({this.selectedBottomNav}) : super._() {
    if (selectedBottomNav == null) {
      throw new BuiltValueNullFieldError('NavState', 'selectedBottomNav');
    }
  }

  @override
  NavState rebuild(void Function(NavStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NavStateBuilder toBuilder() => new NavStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NavState && selectedBottomNav == other.selectedBottomNav;
  }

  @override
  int get hashCode {
    return $jf($jc(0, selectedBottomNav.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('NavState')
          ..add('selectedBottomNav', selectedBottomNav))
        .toString();
  }
}

class NavStateBuilder implements Builder<NavState, NavStateBuilder> {
  _$NavState _$v;

  int _selectedBottomNav;
  int get selectedBottomNav => _$this._selectedBottomNav;
  set selectedBottomNav(int selectedBottomNav) =>
      _$this._selectedBottomNav = selectedBottomNav;

  NavStateBuilder();

  NavStateBuilder get _$this {
    if (_$v != null) {
      _selectedBottomNav = _$v.selectedBottomNav;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NavState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$NavState;
  }

  @override
  void update(void Function(NavStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$NavState build() {
    final _$result =
        _$v ?? new _$NavState._(selectedBottomNav: selectedBottomNav);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
