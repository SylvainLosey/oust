import 'package:redux/redux.dart';
import 'package:built_collection/built_collection.dart';

import '../customer/customer_actions.dart';
import '../subscription/subscription_actions.dart';
import '../pickup/pickup_actions.dart';
import '../subscription/form/subscription_form_actions.dart';
import '../data/data_actions.dart';
import 'app_state.dart';
import '../../data/models/customer.dart';
import '../../data/models/pickup.dart';
import '../../data/models/subscription.dart';
import '../../data/models/consumer_subscription.dart';
import '../../data/models/package.dart';
import '../../data/models/postcode.dart';
import '../../data/models/serializers.dart';
import '../../data/repository.dart';


class AppMiddleware {
  final Repository repository;

  const AppMiddleware({this.repository = const Repository()});

  List<Middleware<AppState>> createAppMiddleware() {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, dynamic>(_logAction),
      TypedMiddleware<AppState, LoadCustomerRequest>(_loadCustomer),
      TypedMiddleware<AppState, LoadSubscriptionRequest>(_loadSubscription),
      TypedMiddleware<AppState, LoadConsumerSubscriptionRequest>(_loadConsumerSubscription),
      TypedMiddleware<AppState, LoadPackagesRequest>(_loadPackages),
      TypedMiddleware<AppState, LoadPickupsRequest>(_loadPickups),
      TypedMiddleware<AppState, LoadPostcodesRequest>(_loadPostcodes),
      TypedMiddleware<AppState, PostLeadRequest>(_postLead),
    ];
  }

  void _logAction(Store<AppState> store, dynamic action, NextDispatcher next) {
    print(action);
    next(action);
  }

  void _loadCustomer(Store<AppState> store, LoadCustomerRequest action, NextDispatcher next) async{
    next(action);

    try {
      final List<dynamic> customerData = await repository.fetchCustomer(action.user.id);
      final Customer customer = serializers.deserializeWith(Customer.serializer, customerData[0]);

      store.dispatch(LoadCustomerSuccess(customer: customer));
      store.dispatch(LoadSubscriptionRequest(customer: customer));
      store.dispatch(LoadConsumerSubscriptionRequest(customer: customer));

    } catch (e) {
      store.dispatch(LoadCustomerFailure(error: e.toString()));
    }
  }

  void _loadSubscription(Store<AppState> store, LoadSubscriptionRequest action, NextDispatcher next) async{
    next(action);

    try {
      final List<dynamic> subscriptionData = await repository.fetchSubscription(action.customer.id);
      final Subscription subscription = Subscription.fromJson(subscriptionData[0]);
      store.dispatch(LoadSubscriptionSuccess(subscription: subscription));
      store.dispatch(LoadPickupsRequest(subscription: subscription));
    } catch (e) {
      store.dispatch(LoadSubscriptionFailure(error: e.toString()));
    }
  }

  void _loadConsumerSubscription(Store<AppState> store, LoadConsumerSubscriptionRequest action, NextDispatcher next) async{
    next(action);

    try {
      final List<dynamic> consumerSubscriptionData = await repository.fetchConsumerSubscription(action.customer.id);
      final ConsumerSubscription consumerSubscription = ConsumerSubscription.fromJson(consumerSubscriptionData[0]);
      store.dispatch(LoadConsumerSubscriptionSuccess(consumerSubscription: consumerSubscription));
    } catch (e) {
      store.dispatch(LoadConsumerSubscriptionFailure(error: e.toString()));
    }
  }

  void _loadPackages(Store<AppState> store, LoadPackagesRequest action, NextDispatcher next) async{
    next(action);

    try {
      final List<dynamic> packagesData = await repository.fetchPackages();
      final BuiltList<Package> packages = BuiltList<Package>.from(packagesData.map((e) => serializers.deserializeWith(Package.serializer, e)));
      store.dispatch(LoadPackagesSuccess(packages: packages));
    } catch (e) {
      store.dispatch(LoadPackagesFailure(error: e.toString()));
    }
  }

  void _loadPickups(Store<AppState> store, LoadPickupsRequest action, NextDispatcher next) async{
    next(action);

    try {
      final List<dynamic> pickupsData = await repository.fetchPickups(action.subscription.id);
      store.dispatch(LoadPickupsSuccess(pickups: List<Pickup>.from(pickupsData.map<dynamic>((dynamic x) => Pickup.fromJson(x)))));
    } catch (e) {
      store.dispatch(LoadPickupsFailure(error: e.toString()));
    }
  }


  void _loadPostcodes(Store<AppState> store, LoadPostcodesRequest action, NextDispatcher next) async{
    next(action);

    try {
      final List<dynamic> data = await repository.fetchPostcodes();
      final List<Postcode> postcodes = List<Postcode>.from(data.map<dynamic>((dynamic x) => Postcode.fromJson(x)));
      store.dispatch(LoadPostcodesSuccess(postcodes: postcodes));
    } catch (e) {
      store.dispatch(LoadPostcodesFailure(error: e.toString()));
    }
  }

  void _postLead(Store<AppState> store, PostLeadRequest action, NextDispatcher next) async{
    next(action);

    try {
      final response = await repository.postLead(
        firstName: action.subscriptionForm.firstName,
        lastName: action.subscriptionForm.lastName,
        address: action.subscriptionForm.address,
        postcode: action.subscriptionForm.postcode,
        email: action.subscriptionForm.email
      );

      // Navifate to succes page then delete form data
      store.dispatch(SubscriptionFormNextStep());
      store.dispatch(PostLeadSuccess());
    } catch (e) {
      store.dispatch(PostLeadFailure(error: e.toString()));
    }
  }
}