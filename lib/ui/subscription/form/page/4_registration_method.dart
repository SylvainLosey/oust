import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../../../redux/app/app_state.dart';
import '../../../../data/models/subscription_form.dart';
import '../../../../utils/colors.dart';
import '../../../../redux/subscription/form/subscription_form_actions.dart';
import '../../../../utils/layout.dart';
import '../../../presentation/layout/title_form_button_layout.dart';
import '../../../presentation/main_app_bar.dart';
import '../../../presentation/title_widget.dart';
import '../../../presentation/base_card.dart';


class SubscriptionFormMethod extends StatelessWidget {
  static int step = 6;

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
            body: MethodForm(viewModel),
          )
        );
      },
    );
  }
}



class MethodForm extends StatefulWidget {
  final _ViewModel viewModel;

  MethodForm(this.viewModel);

  @override
  State<StatefulWidget> createState() => MethodFormState();
}

class MethodFormState extends State<MethodForm> {
  String _selectedMethod;

  @override
  Widget build(BuildContext context) {
    return TitleFormButton(
      title: TitleWidget(
        title: 'Méthode d\'inscription',
        subtitle: 'Comment souhaites-tu créer ton abonnement?'
      ),
      form: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          GestureDetector(
            onTap: () => _onTap(method: 'app'),
            child: BaseCard(
              child: CardText(
                title: 'M\'inscrire tout de suite',
                text: 'Terminer l\'inscription depuis l\'application en quelques minutes.',
                color: _selectedMethod == 'app' ? Colors.white : null
              ),
              color: _selectedMethod == 'app' ? primaryColor : null
            ),
          ),
          Container(height: Layout.of(context).gridUnit(1)),
          GestureDetector(
            onTap: () => _onTap(method: 'rdv'),
            child: BaseCard(
              child: CardText(
                title: 'Fixer un rendez-vous', 
                text: 'Convenir d\'un rendez-vous à ton domicile. Idéal si tu as des demandes spéciales.',
                color: _selectedMethod == 'rdv' ? Colors.white : null
              ),
              color: _selectedMethod == 'rdv' ? primaryColor : null
            ),
          )
        ],
      ),
      button: RaisedButton(
        child: Text('Continuer', style: Theme.of(context).textTheme.button.copyWith(color: Colors.white)),
        onPressed: _selectedMethod != null ? () => widget.viewModel.nextStep(_selectedMethod) : null
      )
    );
  }

  @override
  void initState() {
    _selectedMethod = widget.viewModel.subscriptionForm.registrationMethod;
    super.initState();
  }

  void _onTap({String method}) {
    setState(() {
      if(_selectedMethod == method) {
        _selectedMethod = null;
        widget.viewModel.onChanged(widget.viewModel.subscriptionForm.rebuild((SubscriptionFormBuilder b) => b..registrationMethod= null));
      } else {
        _selectedMethod = method;
        widget.viewModel.onChanged(widget.viewModel.subscriptionForm.rebuild((SubscriptionFormBuilder b) => b..registrationMethod = method));  
      }
    });
  }
}



class _ViewModel {
  final SubscriptionForm subscriptionForm;
  final Function nextStep;
  final Function previousStep;
  final Function exit;
  final Function onChanged;

  _ViewModel({
    this.subscriptionForm,
    this.nextStep,
    this.previousStep,
    this.exit,
    this.onChanged
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      subscriptionForm: store.state.subscriptionFormState.subscriptionForm,
      nextStep: (String selectedMethod) {
        if (selectedMethod == 'app') {
          store.dispatch(SubscriptionFormNextStep());
        } else if (selectedMethod == 'rdv') {
          store.dispatch(SubscriptionFormNextStep(customerRequestsAppointment: true));
        }

        // Dispatch action here a bit after the address if the user changes his mind
        store.dispatch(LoadStartDatesRequest(
          address: store.state.subscriptionFormState.subscriptionForm.address,
          postcode: store.state.subscriptionFormState.subscriptionForm.postcode,
          frequency: store.state.subscriptionFormState.subscriptionForm.frequency,
        ));
      },
      previousStep: () => store.dispatch(SubscriptionFormPreviousStep()),
      exit: () => store.dispatch(SubscriptionFormExit()),
      onChanged: (SubscriptionForm subscriptionForm) => store.dispatch(UpdateSubscriptionForm(subscriptionForm))
    );
  }
}