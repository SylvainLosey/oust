import 'package:redux/redux.dart';

import 'subscription_form_actions.dart';
import '../../app/app_state.dart';
import '../../../data/repository.dart';

class SubscriptionFormMiddleware {
  final Repository repository;
  const SubscriptionFormMiddleware({this.repository = const Repository()});

  List<Middleware<AppState>> createSubscriptionFormMiddleware() {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, PostLeadRequest>(_postLead),
      TypedMiddleware<AppState, LoadStartDatesRequest>(_loadStartDates),
    ];
  }

  void _postLead(Store<AppState> store, PostLeadRequest action, NextDispatcher next) async {
    next(action);

    try {
      await repository.postLead(
        firstName: action.subscriptionForm.firstName,
        lastName: action.subscriptionForm.lastName,
        address: action.subscriptionForm.address,
        postcode: action.subscriptionForm.postcode,
        email: action.subscriptionForm.email,
        phoneNumber: action.subscriptionForm.phoneNumber,
        contactMethod: action.subscriptionForm.contactMethod,
        status: action.subscriptionForm.leadStatus,
      );

      // Navifate to succes page then delete form data
      store.dispatch(SubscriptionFormNextStep());
      store.dispatch(PostLeadSuccess());
    } catch (e) {
      store.dispatch(PostLeadFailure(error: e.toString()));
    }
  }

  void _loadStartDates(Store<AppState> store, LoadStartDatesRequest action, NextDispatcher next) async {
    next(action);

    try {
      final dynamic data = await repository.fetchStartDates(
        address: action.address,
        postcode: action.postcode,
        frequency: action.frequency
      );
      final List<DateTime> startDates = List<DateTime>.from(data['dates'].map<dynamic>((dynamic x) => DateTime.parse(x)));
      store.dispatch(LoadStartDatesSuccess(startDates: startDates));
    } catch (e) {
      store.dispatch(LoadStartDatesFailure(error: e.toString()));
    }
  }
}