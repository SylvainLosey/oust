import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'user.dart';
import '../../redux/auth/auth_state.dart';

part 'serializers.g.dart';

@SerializersFor([
  User,
  AuthState
])
final Serializers serializers = (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();