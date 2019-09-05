import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:redux/redux.dart';
import 'package:built_collection/built_collection.dart';
import 'package:intl/intl.dart';

import '../../../../../redux/app/app_state.dart';
import '../../../../../data/models/lift_book_form.dart';
import '../../../../../utils/layout.dart';
import '../../../../../utils/datetime.dart';
import '../../../../../utils/colors.dart';
import '../../../../presentation/layout/title_form_button_layout.dart';
import '../../../../presentation/title_widget.dart';
import '../../../../presentation/selectable.dart';
import '../../../../presentation/main_app_bar.dart';
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

class SlotPickerForm extends StatelessWidget {
  final _ViewModel viewModel;
  SlotPickerForm(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return TitleFormButton(
        title: TitleWidget(title: 'Date de passage', subtitle: 'Choisis la date et l\'heure qui te convient le mieux.'),
        form: viewModel.liftSlots == null ? SpinKitThreeBounce(color: primaryColor, size: 24) : SlotPicker(viewModel),
        button: RaisedButton(
          child: Text('Continuer', style: Theme.of(context).textTheme.button.copyWith(color: Colors.white)),
          onPressed: viewModel.selectedLiftSlot == null ? null : viewModel.nextStep,
        ));
  }
}

class SlotPicker extends StatefulWidget {
  final _ViewModel viewModel;
  SlotPicker(this.viewModel);

  @override
  _SlotPickerState createState() => _SlotPickerState();
}

class _SlotPickerState extends State<SlotPicker> {
  List<DateTime> dates;
  int currentDate = 0;

  @override
  Widget build(BuildContext context) {
    final currentLiftSlots = getSlotsFromDate(timeSlots: widget.viewModel.liftSlots.toList(), date: dates[currentDate]);

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DateNavigationButton(
                direction: Direction.previous,
                active: currentDate > 0,
                onPressed: _previousDate,
                dates: dates,
                currentDate: currentDate),
            Container(width: Layout.of(context).gridUnit(0.5)),
            RaisedButton(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: Layout.of(context).gridUnit(1)),
                  child: Row(
                    children: <Widget>[
                      Text(capitalize(DateFormat.MMMMEEEEd().format(dates[currentDate])),
                          style: Theme.of(context).textTheme.subhead),
                      Container(width: Layout.of(context).gridUnit(2)),
                      Icon(Icons.calendar_today, size: 16),
                    ],
                  ),
                ),
                onPressed: () => _selectDate(context),
                color: Colors.white),
            Container(width: Layout.of(context).gridUnit(0.5)),
            DateNavigationButton(
                direction: Direction.next,
                active: currentDate < dates.length - 1,
                onPressed: _nextDate,
                dates: dates,
                currentDate: currentDate),
          ],
        ),
        Container(height: Layout.of(context).gridUnit(3)),
        GridView.count(
            shrinkWrap: true,
            childAspectRatio: 1.5,
            mainAxisSpacing: 4,
            crossAxisCount: 4,
            children: List.generate(currentLiftSlots.length, (int index) {
              final String time = DateFormat('kk:mm').format(currentLiftSlots[index].toLocal());
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
    );
  }

  void _nextDate() {
    setState(() {
      currentDate++;
    });
  }

  void _previousDate() {
    setState(() {
      currentDate--;
    });
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

  List<DateTime> getSlotsFromDate({List<DateTime> timeSlots, DateTime date}) {
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

enum Direction { previous, next }

class DateNavigationButton extends StatelessWidget {
  final bool active;
  final Function onPressed;
  final Direction direction;
  final List<DateTime> dates;
  final int currentDate;

  DateNavigationButton({this.active, this.onPressed, this.direction, this.dates, this.currentDate});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        IconButton(
          icon: Icon(direction == Direction.previous ? Icons.arrow_back : Icons.arrow_forward,
              color: active ? Colors.grey[800] : Colors.grey[300]),
          onPressed: active ? onPressed : null,
        ),
        if (active)
          Text(
              DateFormat.MMMd()
                  .format(direction == Direction.previous ? dates[currentDate - 1] : dates[currentDate + 1]),
              style: TextStyle(color: Colors.grey[800], fontSize: 12))
      ],
    );
  }
}

class _ViewModel {
  final Function nextStep;
  final Function previousStep;
  final Function exit;
  final Function onChanged;
  final LiftBookForm liftBookForm;
  final bool flexible;
  final BuiltList<DateTime> liftSlots;
  final DateTime selectedLiftSlot;

  _ViewModel(
      {this.nextStep,
      this.previousStep,
      this.exit,
      this.onChanged,
      this.liftBookForm,
      this.flexible,
      this.liftSlots,
      this.selectedLiftSlot});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        nextStep: () => store.dispatch(LiftBookFormNextStep()),
        previousStep: () => store.dispatch(LiftBookFormPreviousStep()),
        exit: () => store.dispatch(LiftBookFormExit()),
        onChanged: (LiftBookForm liftBookform) => store.dispatch(UpdateLiftBookForm(liftBookform)),
        liftBookForm: store.state.liftBookFormState.liftBookForm,
        flexible: store.state.liftBookFormState.liftBookForm.flexible,
        liftSlots: store.state.liftBookFormState.liftBookForm.liftSlots,
        selectedLiftSlot: store.state.liftBookFormState.liftBookForm.selectedLiftSlot);
  }
}
