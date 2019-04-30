import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../../../redux/app/app_state.dart';
import '../../../data/models/subscription_form.dart';
import '../../../utils/colors.dart';
import '../../../redux/subscription/form/subscription_form_actions.dart';
import '../../../utils/layout.dart';
import '../../presentation/layout/title_form_button_layout.dart';
import '../../presentation/main_app_bar.dart';
import '../../presentation/title_widget.dart';
import '../../presentation/base_card.dart';


class SubscriptionFormContainersYesNo extends StatelessWidget {
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
            body: DoYouWantContainers(viewModel),
          )
        );
      },
    );
  }
}



class DoYouWantContainers extends StatefulWidget {
  final _ViewModel viewModel;

  DoYouWantContainers(this.viewModel);

  @override
  State<StatefulWidget> createState() => DoYouWantContainersState();
}

class DoYouWantContainersState extends State<DoYouWantContainers> {
  bool _wantsContainers;

  @override
  Widget build(BuildContext context) {
    return TitleFormButton(
      title: TitleWidget(
        title: 'Conteneurs',
        subtitle: 'Tu peux utiliser tes propres conteneurs si tu en as déjà. Sinon, nous pouvons t\'en fournir.'
      ),
      form: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          GestureDetector(
            onTap: () => _onTap(choice: true),
            child: BaseCard(
              child: CardText(
                title: 'J\'aimerais des caisses de tri',
                text: 'Nous te les livrons avec le premier passage dès 15.00 CHF pièce.',
                color: _wantsContainers ?? false ? Colors.white : null
              ),
              color: _wantsContainers ?? false ? primaryColor : null
            ),
          ),
          Container(height: Layout.of(context).gridUnit(1)),
          GestureDetector(
            onTap: () => _onTap(choice: false),
            child: BaseCard(
              child: CardText(
                title: 'J\'ai tout ce qu\'il me faut', 
                text: 'Tant que tes déchets sont triés, tu peux utiliser tout type de conteneurs.',
                color: _wantsContainers ?? true ? null : Colors.white
              ),
              color: _wantsContainers ?? true ? null : primaryColor
            ),
          )
        ],
      ),
      button: RaisedButton(
        child: Text('Continuer', style: Theme.of(context).textTheme.button.copyWith(color: Colors.white)),
        onPressed: _wantsContainers != null ? () => widget.viewModel.nextStep(_wantsContainers) : null
      )
    );
  }

  @override
  void initState() {
    _wantsContainers = widget.viewModel.subscriptionForm.wantsContainers;
    super.initState();
  }

  void _onTap({bool choice}) {
    setState(() {
      if(_wantsContainers == choice) {
        _wantsContainers = null;
        widget.viewModel.onChanged(widget.viewModel.subscriptionForm.rebuild((SubscriptionFormBuilder b) => b..wantsContainers= null));
      } else {
        _wantsContainers = choice;
        widget.viewModel.onChanged(widget.viewModel.subscriptionForm.rebuild((SubscriptionFormBuilder b) => b..wantsContainers = choice));  
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
      nextStep: (bool _wantsContainers) {
        if (_wantsContainers) {
          store.dispatch(SubscriptionFormNextStep());
        } else {
          store.dispatch(SubscriptionFormNextStep(doesNotWantContainers: true));
        }
      },
      previousStep: () => store.dispatch(SubscriptionFormPreviousStep()),
      exit: () => store.dispatch(SubscriptionFormExit()),
      onChanged: (SubscriptionForm subscriptionForm) => store.dispatch(UpdateSubscriptionForm(subscriptionForm))
    );
  }
}