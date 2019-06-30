import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:oust/redux/lift/lift_actions.dart';
import 'package:oust/ui/presentation/base_card.dart';
import 'package:oust/ui/presentation/main_app_bar.dart';
import 'package:oust/ui/presentation/safe_widget.dart';
import 'package:redux/redux.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:built_collection/built_collection.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../redux/app/app_state.dart';
import '../../redux/lift/forms/book/lift_book_form_actions.dart';
import '../../data/models/lift.dart';
import '../../data/models/lift_image.dart';
import '../../data/models/lift_event.dart';
import '../presentation/lift_status.dart';
import '../../utils/layout.dart';
import '../../utils/datetime.dart';

class LiftDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: (Store<AppState> store) => _ViewModel.fromStore(store),
      builder: (BuildContext context, _ViewModel viewModel) {
        return Scaffold(
            // appBar: MainAppBar(),
            body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 300,
                    child: Swiper(
                      itemCount: viewModel.images.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CachedNetworkImage(
                          imageUrl: viewModel.images[index].url,
                          placeholder: (context, url) => Container(decoration: BoxDecoration(color: Colors.grey[200])),
                          errorWidget: (context, url, error) => Icon(Icons.error),
                          fit: BoxFit.cover,
                        );
                      },
                      pagination: SwiperPagination(),
                      // control: SwiperControl(),
                    ),
                  ),
                  Positioned(top: 0, left: 0, right: 0, child: MainAppBar(color: Colors.transparent)),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(Layout.of(context).gridUnit(3)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                            DateFormat.yMMMd(Localizations.localeOf(context).toString()).format(viewModel.lift.created),
                            style: Theme.of(context)
                                .textTheme
                                .headline
                                .copyWith(color: Colors.grey[800], fontWeight: FontWeight.w500)),
                        LiftStatus(status: viewModel.lift.status)
                      ],
                    ),
                    Text(viewModel.lift.address,
                        style: Theme.of(context).textTheme.body2.copyWith(color: Colors.grey[600])),
                    if (viewModel.lift.status == 'CREATED') ...[
                      Container(height: Layout.of(context).gridUnit(4)),
                      BaseCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text('Prochaine étape',
                                style: Theme.of(context)
                                    .textTheme
                                    .subhead
                                    .copyWith(color: Colors.grey[800], fontWeight: FontWeight.w500)),
                            Container(height: Layout.of(context).gridUnit(1)),
                            Text(
                                "Nous allons te redire au plus vite combien coûterais l'élimination de ce que tu nous as envoyé. Tu recevras une notification quand tout sera prêt, normalement d'ici une heure.")
                          ],
                        ),
                      )
                    ],
                    if (viewModel.lift.status != 'CREATED') ...[
                      Container(height: Layout.of(context).gridUnit(3)),
                      Text('Informations', style: Theme.of(context).textTheme.subtitle),
                      Container(height: Layout.of(context).gridUnit(1)),
                      LiftPriceCard(
                          employees: viewModel.lift.estimatedEmployees,
                          duration: viewModel.lift.estimatedDuration,
                          price: viewModel.lift.estimatedPrice),
                      Container(height: Layout.of(context).gridUnit(1.5)),
                    ],
                    if (viewModel.lift.status == 'PRICED')
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          RaisedButton(
                              child: Container(
                                  width: 100,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Icons.clear, color: Colors.red),
                                      Container(width: Layout.of(context).gridUnit(1)),
                                      Text(
                                        'Refuser',
                                        style: Theme.of(context).textTheme.body1,
                                      ),
                                    ],
                                  )),
                              onPressed: viewModel.onRefuse,
                              color: Colors.white),
                          RaisedButton(
                            color: Colors.white,
                            child: Container(
                                width: 100,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.check, color: Colors.green),
                                    Container(width: Layout.of(context).gridUnit(1)),
                                    Text(
                                      'Accepter',
                                      style: Theme.of(context).textTheme.body1,
                                    ),
                                  ],
                                )),
                            onPressed: viewModel.onAccept,
                          )
                        ],
                      ),
                    if (viewModel.lift.status == 'ACCEPTED')
                      RaisedButton(
                        // color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(Icons.access_time, color: Colors.white, size: 18),
                            Container(width: Layout.of(context).gridUnit(1)),
                            Text(
                              'Fixer le rendez-vous',
                              style: Theme.of(context).textTheme.body1.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                        onPressed: viewModel.onAccept,
                      ),
                    if (viewModel.lift.status == 'SCHEDULED') ...[
                      Container(height: Layout.of(context).gridUnit(3)),
                      Text('Rendez-vous', style: Theme.of(context).textTheme.subtitle),
                      Container(height: Layout.of(context).gridUnit(1)),
                      BaseCard(
                          child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.access_time,
                            size: 18,
                            color: Colors.grey[800],
                          ),
                          Container(width: Layout.of(context).gridUnit(2)),
                          // TODO Find the good liftEvent to display, for now just shows the first one
                          Text(_formatPrice(lift: viewModel.lift, liftEvent: viewModel.liftEvents[0]))
                        ],
                      ))
                    ]
                  ],
                ),
              )
            ],
          ),
        ));
      },
    );
  }

  String _formatPrice({Lift lift, LiftEvent liftEvent}) {
    final String date = DateFormat.yMMMMEEEEd().format(liftEvent.start);
    final String start = DateFormat.jm().format(liftEvent.start);
    return capitalize('$date à $start');
  }
}

class LiftPriceCard extends StatelessWidget {
  final int employees;
  final int duration;
  final Decimal price;

  LiftPriceCard({this.employees, this.duration, this.price});

  @override
  Widget build(BuildContext context) {
    return BaseCard(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[Text('Nombre d\'employés'), Text(employees.toString())],
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[Text('Durée estimée'), Text(minToString(duration))],
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Prix estimé',
              style: Theme.of(context).textTheme.body1.copyWith(fontWeight: FontWeight.w600),
            ),
            Text('${price.toStringAsFixed(2)} CHF',
                style: Theme.of(context).textTheme.body1.copyWith(fontWeight: FontWeight.w600))
          ],
        ),
      ],
    ));
  }
}

class _ViewModel {
  final Lift lift;
  final List<LiftImage> images;
  final List<LiftEvent> liftEvents;
  final Function onRefuse;
  final Function onAccept;
  final int fetchCount;

  _ViewModel({this.lift, this.images, this.liftEvents, this.onRefuse, this.onAccept, this.fetchCount});

  static _ViewModel fromStore(Store<AppState> store) {
    List<dynamic> _filter(Lift lift, BuiltMap<int, dynamic> map) {
      final List<dynamic> elements = map.values.toList();
      elements.removeWhere((dynamic element) => element.lift != lift.id);
      return elements;
    }

    return _ViewModel(
        lift: store.state.liftState.lifts[store.state.liftState.selectedId],
        images:
            _filter(store.state.liftState.lifts[store.state.liftState.selectedId], store.state.liftState.liftImages),
        liftEvents:
            _filter(store.state.liftState.lifts[store.state.liftState.selectedId], store.state.liftState.liftEvents),
        onRefuse: () {
          final Lift lift =
              store.state.liftState.lifts[store.state.liftState.selectedId].rebuild((b) => b..status = 'REFUSED');
          store.dispatch(UpdateLiftRequest(lift: lift));
        },
        onAccept: () {
          final Lift lift =
              store.state.liftState.lifts[store.state.liftState.selectedId].rebuild((b) => b..status = 'ACCEPTED');
          store.dispatch(UpdateLiftRequest(lift: lift));
          store.dispatch(LiftBookFormStart());
        },
        fetchCount: store.state.liftState.fetchCount);
  }
}
