import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:built_collection/built_collection.dart';
import 'package:intl/intl.dart';

import '../../../../../redux/app/app_state.dart';
import '../../../../../data/models/lift_book_form.dart';
import '../../../../../utils/layout.dart';
import '../../../../../utils/datetime.dart';
import '../../../../presentation/layout/title_form_button_layout.dart';
import '../../../../presentation/title_widget.dart';
import '../../../../presentation/selectable.dart';
import '../../../../presentation/main_app_bar.dart';
import '../../../../presentation/form_wrapper.dart';
import '../../../../../redux/lift/forms/book/lift_book_form_actions.dart';

class LiftBookFormSlotPicker extends StatelessWidget {
  static int step = 2;

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
              child: Scaffold(appBar: MainAppBar(onExit: viewModel.exit), body: SlotPickerForm(viewModel)));
        });
  }
}

class SlotPickerForm extends StatefulWidget {
  final _ViewModel viewModel;
  SlotPickerForm(this.viewModel);

  @override
  _SlotPickerFormState createState() => _SlotPickerFormState();
}

class _SlotPickerFormState extends State<SlotPickerForm> {
  List<DateTime> dates;
  int currentDate = 0;

  @override
  Widget build(BuildContext context) {
    final currentLiftSlots = getSlotsFromDate(widget.viewModel.liftSlots.toList(), dates[currentDate]);

    return TitleFormButton(
        title: TitleWidget(
            title: 'Date de passage', subtitle: 'Choisis quand est-ce que tu souhaite que l\'on passe chez toi.'),
        form: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: _previousDate,
                ),
                Container(width: Layout.of(context).gridUnit(1)),
                RaisedButton(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: Layout.of(context).gridUnit(1)),
                      child: Row(
                        children: <Widget>[
                          Text(weekdayAndDate(context, dates[currentDate]), style: Theme.of(context).textTheme.subhead),
                          Container(width: Layout.of(context).gridUnit(2)),
                          Icon(Icons.calendar_today, size: 16),
                        ],
                      ),
                    ),
                    onPressed: () => _selectDate(context),
                    color: Colors.white),
                Container(width: Layout.of(context).gridUnit(1)),
                IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: _nextDate,
                ),
              ],
            ),
            Container(height: Layout.of(context).gridUnit(3)),
            GridView.count(
                shrinkWrap: true,
                childAspectRatio: 1.65,
                mainAxisSpacing: 4,
                crossAxisCount: 4,
                children: List.generate(currentLiftSlots.length, (int index) {
                  final String time = DateFormat('kk:mm').format(currentLiftSlots[index]);
                  final bool selected = widget.viewModel.selectedLiftSlot == currentLiftSlots[index];
                  return SelectableItem(
                      child: Center(
                          child: Text(
                        time,
                        style: TextStyle(color: selected ? Colors.white : Colors.black),
                      )),
                      selected: selected,
                      onTap: () => _onTap(selectedLiftSlot: currentLiftSlots[index]));
                })),
          ],
        ),
        button: RaisedButton(
          child: Text('Continuer', style: Theme.of(context).textTheme.button.copyWith(color: Colors.white)),
          onPressed: () {},
        ));
  }

  void _nextDate() {
    if (currentDate <= dates.length) {
      setState(() {
        currentDate++;
      });
    }
  }

  void _previousDate() {
    if (currentDate >= 0) {
      setState(() {
        currentDate--;
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: dates[currentDate],
        firstDate: DateTime(2019),
        lastDate: DateTime(2050),
        selectableDayPredicate: (DateTime date) => dates.contains(date));

    if (picked != null && picked != dates[currentDate]) {
      setState(() {
        currentDate = dates.indexOf(picked);
      });
    }
  }

  List<DateTime> getSlotsFromDate(List<DateTime> timeSlots, DateTime date) {
    return timeSlots.where((DateTime timeSlot) => dateTimeToDate(timeSlot).isAtSameMomentAs(date)).toList();
  }

  void _onTap({DateTime selectedLiftSlot}) {
    if (selectedLiftSlot != widget.viewModel.selectedLiftSlot) {
      widget.viewModel.onChanged(widget.viewModel.liftBookForm.rebuild((b) => b..selectedLiftSlot = selectedLiftSlot));
    } else {
      widget.viewModel.onChanged(widget.viewModel.liftBookForm.rebuild((b) => b..selectedLiftSlot = null));
    }
  }

  @override
  void initState() {
    dates = toUniqueDates(widget.viewModel.liftSlots.toList());
    super.initState();
  }
}

class _ViewModel {
  final Function nextStep;
  final Function previousStep;
  final Function exit;
  final Function onChanged;
  final LiftBookForm liftBookForm;
  final bool noCustomerRequired;
  final BuiltList<DateTime> liftSlots;
  final DateTime selectedLiftSlot;

  _ViewModel(
      {this.nextStep,
      this.previousStep,
      this.exit,
      this.onChanged,
      this.liftBookForm,
      this.noCustomerRequired,
      this.liftSlots,
      this.selectedLiftSlot});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        nextStep: () => store.dispatch(LiftBookFormNextStep()),
        previousStep: () => store.dispatch(LiftBookFormPreviousStep()),
        exit: () => store.dispatch(LiftBookFormExit()),
        onChanged: (LiftBookForm liftBookform) => store.dispatch(UpdateLiftBookForm(liftBookform)),
        liftBookForm: store.state.liftBookFormState.liftBookForm,
        noCustomerRequired: store.state.liftBookFormState.liftBookForm.noCustomerRequired,
        liftSlots: store.state.liftBookFormState.liftBookForm.liftSlots,
        selectedLiftSlot: store.state.liftBookFormState.liftBookForm.selectedLiftSlot);
  }
}
