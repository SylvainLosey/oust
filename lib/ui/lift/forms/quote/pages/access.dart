// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter_redux/flutter_redux.dart';
// import 'package:redux/redux.dart';

// import '../../../../../redux/app/app_state.dart';
// import '../../../../../data/models/lift_quote_form.dart';
// import '../../../../../utils/layout.dart';
// import '../../../../presentation/layout/title_form_button_layout.dart';
// import '../../../../presentation/title_widget.dart';
// import '../../../../presentation/selectable.dart';
// import '../../../../presentation/form_wrapper.dart';
// import '../../../../../redux/lift/forms/quote/lift_quote_form_actions.dart';

// class LiftQuoteFormAccess extends StatelessWidget {
//   static int step = 2;

//   @override
//   Widget build(BuildContext context) {
//     return StoreConnector<AppState, _ViewModel>(
//       distinct: true,
//       converter: (Store<AppState> store) => _ViewModel.fromStore(store),
//       builder: (BuildContext context, _ViewModel viewModel) {
//         return FormWrapper(
//             child: AccessForm(viewModel), onExit: viewModel.exit, onPreviousStep: viewModel.previousStep);
//       },
//     );
//   }
// }

// class AccessForm extends StatelessWidget {
//   final _ViewModel viewModel;
//   AccessForm(this.viewModel);

//   @override
//   Widget build(BuildContext context) {
//     return TitleFormButton(
//       title: TitleWidget(
//           title: 'Accès aux objets',
//           subtitle: 'Est-ce que l’on peut passer durant une journée où une heure de passage est plus pratique ?'),
//       form: Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           SelectableItem(
//             title: 'Il faut que je sois là',
//             text: 'Les objets à débarasser sont à l’intérieur ou fermés à clés pas exemple',
//             onTap: () => _onTap(noCustomerRequired: false),
//             selected: viewModel.noCustomerRequired == false,
//           ),
//           Container(height: Layout.of(context).gridUnit(1)),
//           SelectableItem(
//             title: 'Je n’ai pas besoin d’être là',
//             text: 'Les objets à débarasser sont devant votre porte par exemple ',
//             onTap: () => _onTap(noCustomerRequired: true),
//             selected: viewModel.noCustomerRequired == true,
//           ),
//         ],
//       ),
//       button: RaisedButton(
//           child: Text('Continuer', style: Theme.of(context).textTheme.button.copyWith(color: Colors.white)),
//           onPressed: viewModel.noCustomerRequired != null ? viewModel.nextStep : null),
//     );
//   }

//   void _onTap({bool noCustomerRequired}) {
//     if (noCustomerRequired != viewModel.noCustomerRequired) {
//       viewModel.onChanged(viewModel.liftQuoteForm.rebuild((b) => b..noCustomerRequired = noCustomerRequired));
//     } else {
//       viewModel.onChanged(viewModel.liftQuoteForm.rebuild((b) => b..noCustomerRequired = null));
//     }
//   }
// }

// class _ViewModel {
//   final Function nextStep;
//   final Function previousStep;
//   final Function exit;
//   final Function onChanged;
//   final LiftQuoteForm liftQuoteForm;
//   final bool noCustomerRequired;

//   _ViewModel(
//       {this.nextStep, this.previousStep, this.exit, this.onChanged, this.liftQuoteForm, this.noCustomerRequired});

//   static _ViewModel fromStore(Store<AppState> store) {
//     return _ViewModel(
//         nextStep: () => store.dispatch(LiftQuoteFormNextStep(isAuthenticated: store.state.authState.isAuthenticated)),
//         previousStep: () => store.dispatch(LiftQuoteFormPreviousStep()),
//         exit: () => store.dispatch(LiftQuoteFormExit()),
//         onChanged: (LiftQuoteForm liftQuoteform) => store.dispatch(UpdateLiftQuoteForm(liftQuoteform)),
//         liftQuoteForm: store.state.liftQuoteFormState.liftQuoteForm,
//         noCustomerRequired: store.state.liftQuoteFormState.liftQuoteForm.noCustomerRequired);
//   }
// }
