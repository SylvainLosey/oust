library NavState;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../data/models/serializers.dart';

part 'nav_state.g.dart';

abstract class NavState implements Built<NavState, NavStateBuilder> {
  int get selectedBottomNav;

  NavState._();

  factory NavState([void Function(NavStateBuilder) updates]) => _$NavState((b) => b
    ..selectedBottomNav = 0
  );

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(NavState.serializer, this);
  }

  static NavState fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(NavState.serializer, jsonString);
  }

  static Serializer<NavState> get serializer => _$navStateSerializer;
}