import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:built_collection/built_collection.dart';

import '../../../redux/app/app_state.dart';
import '../../../data/models/subscription_form.dart';
import '../../../data/models/postcode.dart';
import '../../../utils/colors.dart';
import '../../../redux/subscription/form/subscription_form_actions.dart';
import '../../../utils/layout.dart';
import '../../presentation/layout/title_form_button_layout.dart';
import '../../presentation/main_app_bar.dart';
import '../../presentation/title_widget.dart';
import '../../presentation/base_card.dart';
import '../../presentation/selectable_item.dart';


class SubscriptionFormLocation extends StatelessWidget {
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
            body: LocationForm(viewModel),
          )
        );
      },
    );
  }
}



class LocationForm extends StatefulWidget {
  final _ViewModel viewModel;

  LocationForm(this.viewModel);

  @override
  State<StatefulWidget> createState() => LocationFormState();
}

class LocationFormState extends State<LocationForm> {
  String _location;
  int _selectedItem;

  List<String> _locationChoices = <String>[
    'Devant la porte d\'entrée',
    'Dans le jardin ou sur la terasse',
    'Devant ou dans le garage',
    'Devant ou dans la cave',
    'Devant ou dans un local / cabanon',
    'Autre',
  ];

  @override
  Widget build(BuildContext context) {
    return TitleFormButton(
      title: TitleWidget(
        title: 'Conteneurs',
        subtitle: 'Tu peux utiliser tes propres conteneurs si tu en as déjà. Sinon, nous pouvons t\'en fournir.'
      ),
      form: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(_locationChoices.length, (int index) {
          return SelectableItem(
            onTap: () => _onTap(selectedItem: index),
            text: _locationChoices[index],
            selected: _selectedItem == index,
          );
        },
      ),
        
      ),
      button: RaisedButton(
        child: Text('Continuer', style: Theme.of(context).textTheme.button.copyWith(color: Colors.white)),
        onPressed: null,
        // onPressed: _wantsContainers != null ? widget.viewModel.nextStep : null
      )
    );
  }

//   @override
//   void initState() {
//     _wantsContainers = widget.viewModel.subscriptionForm.wantsContainers;
//     super.initState();
//   }

  void _onTap({int selectedItem}) {
    if (_selectedItem == selectedItem) {
      setState(() {
        _selectedItem = null;
      });
    } else {
      setState(() {
        _selectedItem = selectedItem;
      });
    }
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
      nextStep: () => store.dispatch(SubscriptionFormNextStep()),
      previousStep: () => store.dispatch(SubscriptionFormPreviousStep()),
      exit: () => store.dispatch(SubscriptionFormExit()),
      onChanged: (SubscriptionForm subscriptionForm) => store.dispatch(UpdateSubscriptionForm(subscriptionForm))
    );
  }
}