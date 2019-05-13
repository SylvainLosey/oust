import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:built_collection/built_collection.dart';

import '../../../../redux/app/app_state.dart';
import '../../../../data/models/subscription_form.dart';
import '../../../../redux/subscription/form/subscription_form_actions.dart';
import '../../../../utils/datetime.dart';
import '../../../presentation/layout/title_form_button_layout.dart';
import '../../../presentation/main_app_bar.dart';
import '../../../presentation/title_widget.dart';
import '../../../presentation/selectable.dart';


class SubscriptionFormStartDate extends StatelessWidget {
  static int step = 11;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        return WillPopScope(
          onWillPop: () async {
            viewModel.previousStep();
            return false;
          },
          child: Scaffold(
            appBar: MainAppBar(onExit: viewModel.exit),

            // All this stuff is necessary to have SinglechildScrollView play nice with 
            // the spacer in the TitleFormButton widget - see SingleChildScrollView official doc
            body: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints viewportConstraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: viewportConstraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: StartDateForm(viewModel),
                    )
                  )
                );
              }
            )
          )
        );
      }
    );
  }
}


class StartDateForm extends StatelessWidget {
  final _ViewModel viewModel;

  StartDateForm(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return TitleFormButton(
      title: TitleWidget(
        title: 'Premier passage',
        subtitle: 'Quand souhaites-tu que l\'on passe pour le première fois ?'
      ),
      form: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          if (viewModel.startDates == null)
            Center(child: Text('Bug'))
          else
            ...List.generate(viewModel.startDates.length, (int index) {
              return SelectableCheckbox(
                onTap: () => _onTap(selectedStartDate: viewModel.startDates[index]),
                text: dateToStringFrench(viewModel.startDates[index]),
                selected: viewModel.selectedStartDate == viewModel.startDates[index],
              );
          },
        ),
        ],
      ),
      button: RaisedButton(
        child: Text('Continuer', style: Theme.of(context).textTheme.button.copyWith(color: Colors.white)),
        onPressed: viewModel.selectedStartDate == null 
          ? null
          : viewModel.nextStep
      )
    );
  }

  void _onTap({DateTime selectedStartDate}) {
    if (selectedStartDate != viewModel.selectedStartDate) {
      viewModel.onChanged(viewModel.subscriptionForm.rebuild((SubscriptionFormBuilder b) => b
        ..selectedStartDate = selectedStartDate
      ));
    }
  }
}


class _ViewModel {
  final SubscriptionForm subscriptionForm;
  final BuiltList<DateTime> startDates;
  final DateTime selectedStartDate;
  final Function nextStep;
  final Function previousStep;
  final Function exit;
  final Function onChanged;

  _ViewModel({
    this.subscriptionForm,
    this.startDates,
    this.selectedStartDate,
    this.nextStep,
    this.previousStep,
    this.exit,
    this.onChanged
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      subscriptionForm: store.state.subscriptionFormState.subscriptionForm,
      startDates: store.state.subscriptionFormState.subscriptionForm.startDates,
      selectedStartDate: store.state.subscriptionFormState.subscriptionForm.selectedStartDate,
      nextStep: () => store.dispatch(SubscriptionFormNextStep()),
      previousStep: () => store.dispatch(SubscriptionFormPreviousStep()),
      exit: () => store.dispatch(SubscriptionFormExit()),
      onChanged: (SubscriptionForm subscriptionForm) => store.dispatch(UpdateSubscriptionForm(subscriptionForm))
    );
  }
}