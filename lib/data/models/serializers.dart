import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';

import 'user.dart';
import 'customer.dart';
import 'subscription.dart';
import 'consumer_subscription.dart';
import 'package.dart';
import 'pickup.dart';
import 'subscription_form.dart';
import 'postcode.dart';
import 'date_serializer.dart';

// Do not use relative imports here - weird bug otherwise
import 'package:oust/redux/auth/auth_state.dart';
import 'package:oust/redux/customer/customer_state.dart';
import 'package:oust/redux/subscription/subscription_state.dart';
import 'package:oust/redux/pickup/pickup_state.dart';
import 'package:oust/redux/subscription/form/subscription_form_state.dart';
import 'package:oust/redux/nav/nav_state.dart';
import 'package:oust/redux/app/app_state.dart';
import 'package:oust/redux/data/data_state.dart';

part 'serializers.g.dart';

@SerializersFor([
  User,
  Customer,
  Subscription,
  ConsumerSubscription,
  Package,
  Pickup,
  SubscriptionForm,
  Postcode,
  AuthState,
  CustomerState,
  SubscriptionState,
  PickupState,
  SubscriptionFormState,
  NavState,
  DataState,
  AppState,
])



final Serializers serializers = (_$serializers.toBuilder()..add(DateSerializer())..addPlugin(StandardJsonPlugin())).build();