import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:oust/redux/lift/lift_actions.dart';
import 'package:redux/redux.dart';
import 'package:built_collection/built_collection.dart';

import '../presentation/error_text.dart';
import '../presentation/loading.dart';
import '../presentation/lift_card.dart';
import '../../utils/layout.dart';
import '../../redux/app/app_state.dart';
import '../../redux/lift/forms/quote/lift_quote_form_actions.dart';
import '../../redux/lift/lift_state.dart';
import '../../data/models/lift.dart';
import '../../data/models/lift_image.dart';

class LiftHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        if (viewModel.liftState.fetchCount > 0) {
          return Loading();
        }

        if (viewModel.liftState.error != null) {
          return ErrorText(error: viewModel.liftState.error);
        }

        final List keys = viewModel.lifts.keys.toList().reversed.toList();

        return SafeArea(
          child: Padding(
              padding: EdgeInsets.all(Layout.of(context).gridUnit(1)),
              child: Column(
                children: <Widget>[
                  Container(height: Layout.of(context).gridUnit(3)),
                  Row(
                    children: <Widget>[
                      Text('Passages uniques',
                          style: Theme.of(context).textTheme.headline.copyWith(fontWeight: FontWeight.w600)),
                      Spacer(),
                      OutlineButton(child: Text('Nouveau'), onPressed: viewModel.newLift),
                      Container(width: Layout.of(context).gridUnit(1))
                    ],
                  ),
                  Container(height: Layout.of(context).gridUnit(3)),
                  Expanded(
                    child: ListView.builder(
                        // reverse: true,
                        itemCount: viewModel.lifts.length,
                        itemBuilder: (BuildContext context, int index) {
                          final Lift lift = viewModel.lifts[keys[index]];

                          return LiftCard(
                              lift: lift,
                              image: _getFirstImage(lift: lift, images: viewModel.liftImages),
                              onPressed: () => viewModel.viewLiftDetail(lift.id));
                        }),
                  )
                ],
              )),
        );
      },
    );
  }

  LiftImage _getFirstImage({Lift lift, BuiltMap<int, LiftImage> images}) {
    for (LiftImage image in images.values) {
      if (image.lift == lift.id) {
        return image;
      }
    }

    return null;
  }
}

class _ViewModel {
  final LiftState liftState;
  final BuiltMap<int, Lift> lifts;
  final BuiltMap<int, LiftImage> liftImages;
  final Function newLift;
  final Function viewLiftDetail;

  _ViewModel({this.liftState, this.lifts, this.liftImages, this.newLift, this.viewLiftDetail});

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
        liftState: store.state.liftState,
        lifts: store.state.liftState.lifts,
        liftImages: store.state.liftState.liftImages,
        newLift: () => store.dispatch(LiftQuoteFormStart()),
        viewLiftDetail: (int liftId) => store.dispatch(ViewLiftDetail(liftId: liftId)));
  }
}
