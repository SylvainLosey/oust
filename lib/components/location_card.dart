import 'package:flutter/material.dart';

import '../components/base_card.dart';
import '../presentation/layout.dart';

class LocationCard extends StatelessWidget {
  final String address;
  final String postcode;
  final String city;

  LocationCard({this.address, this.postcode, this.city});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: LayoutContainer.of(context).matGridUnit(scale: 3)),
      child: BaseCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              address,
            ),
            Text(
              postcode + ' ' + city,
            ),
          ],
        ),
      )
    );
  }
}