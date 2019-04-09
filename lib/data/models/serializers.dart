import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import 'user.dart';
import 'customer.dart';
import 'subscription.dart';
import 'consumer_subscription.dart';
import 'package.dart';
import '../../redux/auth/auth_state.dart';
import '../../redux/customer/customer_state.dart';
import '../../redux/subscription/subscription_state.dart';

part 'serializers.g.dart';

@SerializersFor([
  User,
  Customer,
  Subscription,
  ConsumerSubscription,
  Package,
  // Packages,
  AuthState,
  CustomerState,
  SubscriptionState,
])
final Serializers serializers = (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();