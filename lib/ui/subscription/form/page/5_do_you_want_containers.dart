import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../../../redux/app/app_state.dart';
import '../../../../data/models/subscription_form.dart';
import '../../../../redux/subscription/form/subscription_form_actions.dart';
import '../../../../utils/layout.dart';
import '../../../presentation/layout/title_form_button_layout.dart';
import '../../../presentation/main_app_bar.dart';
import '../../../presentation/title_widget.dart';
import '../../../presentation/selectable.dart';
import '../../../presentation/form_wrapper.dart';

class SubscriptionFormContainersYesNo extends StatelessWidget {
  static int step = 7;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        return FormWrapper(
            child: DoYouWantContainers(viewModel), onExit: viewModel.exit, onPreviousStep: viewModel.previousStep);
      },
    );
  }
}

class DoYouWantContainers extends StatelessWidget {
  final _ViewModel viewModel;

  DoYouWantContainers(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return TitleFormButton(
        title: TitleWidget(
            title: 'Conteneurs',
            subtitle: 'Tu peux utiliser tes propres conteneurs si tu en as déjà. Sinon, nous pouvons t\'en fournir.'),
        form: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SelectableItem(
              onTap: () => _onTap(choice: true),
              title: 'J\'aimerais des caisses de tri',
              text: 'Nous te les livrons avec le premier passage dès 15.00 CHF pièce.',
              selected: viewModel.wantsContainers ?? false ? true : false,
            ),
            Container(height: Layout.of(context).gridUnit(1)),
            SelectableItem(
              onTap: () => _onTap(choice: false),
              title: 'J\'ai tout ce qu\'il me faut',
              text: 'Tant que tes déchets sont triés, tu peux utiliser tout type de conteneurs.',
              selected: viewModel.wantsContainers ?? true ? false : true,
            ),
          ],
        ),
        button: RaisedButton(
            child: Text('Continuer', style: Theme.of(context).textTheme.button.copyWith(color: Colors.white)),
            onPressed: viewModel.wantsContainers != null ? () => viewModel.nextStep(viewModel.wantsContainers) : null));
  }

  void _onTap({bool choice}) {
    if (choice != viewModel.wantsContainers) {
      viewModel
          .onChanged(viewModel.subscriptionForm.rebuild((SubscriptionFormBuilder b) => b..wantsContainers = choice));
    } else {
      viewModel.onChanged(viewModel.subscriptionForm.rebuild((SubscriptionFormBuilder b) => b..wantsContainers = null));
    }
  }
}

class _ViewModel {
  final SubscriptionForm subscriptionForm;
  final bool wantsContainers;
  final Function nextStep;
  final Function previousStep;
  final Function exit;
  final Function onChanged;

  _ViewModel(
      {this.subscriptionForm, this.wantsContainers, this.nextStep, this.previousStep, this.exit, this.onChanged});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        subscriptionForm: store.state.subscriptionFormState.subscriptionForm,
        wantsContainers: store.state.subscriptionFormState.subscriptionForm.wantsContainers,
        nextStep: (bool _wantsContainers) {
          if (_wantsContainers) {
            store.dispatch(SubscriptionFormNextStep());
          } else {
            store.dispatch(SubscriptionFormNextStep(doesNotWantContainers: true));
          }
        },
        previousStep: () => store.dispatch(SubscriptionFormPreviousStep()),
        exit: () => store.dispatch(SubscriptionFormExit()),
        onChanged: (SubscriptionForm subscriptionForm) => store.dispatch(UpdateSubscriptionForm(subscriptionForm)));
  }
}
