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
import '../../data/models/lift.dart';
import '../../data/models/lift_image.dart';
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
            body: Column(
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
                      Text(DateFormat.yMMMd(Localizations.localeOf(context).toString()).format(viewModel.lift.created),
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
                    Container(height: Layout.of(context).gridUnit(3)),
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
                    LiftPriceCard(
                        employees: viewModel.lift.estimatedEmployees,
                        duration: viewModel.lift.estimatedDuration,
                        price: viewModel.lift.estimatedPrice),
                    Container(height: Layout.of(context).gridUnit(3)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton(
                            child: Container(
                                width: 100,
                                child: Center(
                                    child: viewModel.fetchCount > 0
                                        ? SpinKitThreeBounce(color: Colors.white)
                                        : Text(
                                            'Refuser',
                                            style: Theme.of(context).textTheme.body1.copyWith(color: Colors.white),
                                          ))),
                            onPressed: viewModel.onRefuse,
                            color: Colors.red[400]),
                        RaisedButton(
                          color: Colors.lightGreen[600],
                          child: Container(
                            width: 100,
                            child: Center(
                              child: Text(
                                'Accepter',
                                style: Theme.of(context).textTheme.body1.copyWith(color: Colors.white),
                              ),
                            ),
                          ),
                          onPressed: () {},
                        )
                      ],
                    )
                  ]
                ],
              ),
            )
          ],
        ));
      },
    );
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
  final Function onRefuse;
  final int fetchCount;

  _ViewModel({this.lift, this.images, this.onRefuse, this.fetchCount});

  static _ViewModel fromStore(Store<AppState> store) {
    List<LiftImage> _getLiftImages(Lift lift, BuiltMap<int, LiftImage> liftImages) {
      final List<LiftImage> images = liftImages.values.toList();
      images.removeWhere((LiftImage image) => image.lift != lift.id);
      return images;
    }

    return _ViewModel(
        lift: store.state.liftState.lifts[store.state.liftState.selectedId],
        images: _getLiftImages(
            store.state.liftState.lifts[store.state.liftState.selectedId], store.state.liftState.liftImages),
        onRefuse: () =>
            store.dispatch(RefuseLiftRequest(lift: store.state.liftState.lifts[store.state.liftState.selectedId])),
        fetchCount: store.state.liftState.fetchCount);
  }
}
