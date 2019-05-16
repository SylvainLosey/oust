import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:oust/redux/app/app_state.dart';
import 'package:oust/redux/auth/auth_state.dart';
import 'package:oust/redux/customer/customer_state.dart';
import 'package:oust/redux/data/data_state.dart';
import 'package:oust/redux/nav/nav_state.dart';
import 'package:oust/redux/pickup/pickup_state.dart';
import 'package:oust/redux/subscription/form/subscription_form_state.dart';
import 'package:oust/redux/subscription/subscription_state.dart';
import 'package:oust/redux/invoice/invoice_state.dart';
import 'package:oust/redux/lift/lift_state.dart';
import 'package:oust/redux/lift/quote_form/lift_quote_form_state.dart';

import 'consumer_subscription.dart';
import 'customer.dart';
import 'email.dart';
import 'custom_serializers.dart';
import 'package.dart';
import 'pickup.dart';
import 'postcode.dart';
import 'phone_number.dart';
import 'subscription.dart';
import 'subscription_form.dart';
import 'user.dart';
import 'invoice.dart';
import 'invoice_item.dart';
import 'lift_image.dart';
import 'lift_quote_form.dart';

part 'serializers.g.dart';

@SerializersFor([
  User,
  Customer,
  Subscription,
  ConsumerSubscription,
  Package,
  Pickup,
  Email,
  PhoneNumber,
  SubscriptionForm,
  Postcode,
  Invoice,
  InvoiceItem,
  LiftImage,
  LiftQuoteForm,
  AuthState,
  CustomerState,
  SubscriptionState,
  PickupState,
  SubscriptionFormState,
  NavState,
  DataState,
  AppState,
  LiftState,
  LiftQuoteFormState,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..add(DateSerializer())
      ..add(DecimalSerializer())
      ..addPlugin(StandardJsonPlugin()))
    .build();
