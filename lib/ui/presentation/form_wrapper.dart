import 'package:flutter/material.dart';

import 'main_app_bar.dart';

class FormWrapper extends StatelessWidget {
  final Function onExit;
  final Function onPreviousStep;
  final Widget child;

  FormWrapper({@required this.child, @required this.onExit, @required this.onPreviousStep});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          onPreviousStep();
          return false;
        },
        child: Scaffold(
            appBar: MainAppBar(onExit: onExit),

            // All this stuff is necessary to have SinglechildScrollView play nice with
            // the spacer in the TitleFormButton widget - see SingleChildScrollView official doc
            body: LayoutBuilder(builder: (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                  child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: viewportConstraints.maxHeight,
                      ),
                      child: IntrinsicHeight(child: child)));
            })));
  }
}
