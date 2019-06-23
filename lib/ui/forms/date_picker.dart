import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:built_collection/built_collection.dart';

import '../../utils/datetime.dart';
import '../presentation/layout/title_form_button_layout.dart';
import '../presentation/title_widget.dart';
import '../presentation/selectable.dart';

class DatePickerForm extends StatelessWidget {
  final DatePickerVM viewModel;

  DatePickerForm(this.viewModel);

  @override
  Widget build(BuildContext context) {
    return TitleFormButton(
        title: TitleWidget(
            title: 'Premier passage', subtitle: 'Quand souhaites-tu que l\'on passe pour le première fois ?'),
        form: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (viewModel.startDates == null)
              Center(child: Text('Bug'))
            else
              ...List.generate(
                viewModel.startDates.length,
                (int index) {
                  return SelectableCheckbox(
                    onTap: () => _onTap(selectedStartDate: viewModel.startDates[index]),
                    text: weekdayAndDate(context, viewModel.startDates[index]),
                    selected: viewModel.selectedStartDate == viewModel.startDates[index],
                  );
                },
              ),
          ],
        ),
        button: RaisedButton(
            child: Text('Continuer', style: Theme.of(context).textTheme.button.copyWith(color: Colors.white)),
            onPressed: viewModel.selectedStartDate == null ? null : viewModel.nextStep));
  }

  void _onTap({DateTime selectedStartDate}) {
    if (selectedStartDate != viewModel.selectedStartDate) {
      viewModel.onChanged(viewModel.form.rebuild((b) => b..selectedStartDate = selectedStartDate));
    }
  }
}

abstract class DatePickerVM {
  final dynamic form;
  final BuiltList<DateTime> startDates;
  final DateTime selectedStartDate;
  final Function nextStep;
  final Function previousStep;
  final Function exit;
  final Function onChanged;

  DatePickerVM(
      {this.form,
      this.startDates,
      this.selectedStartDate,
      this.nextStep,
      this.previousStep,
      this.exit,
      this.onChanged});
}
