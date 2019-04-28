library NavState;

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../../data/models/serializers.dart';

part 'nav_state.g.dart';

abstract class NavState implements Built<NavState, NavStateBuilder> {
  static Serializer<NavState> get serializer => _$navStateSerializer;

  factory NavState() => _$NavState((NavStateBuilder b) => b
    ..selectedBottomNav = 0
  );

  NavState._();

  int get selectedBottomNav;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(NavState.serializer, this);
  }

  static NavState fromJson(Map<String, dynamic> jsonString) {
    return serializers.deserializeWith(NavState.serializer, jsonString);
  }
}