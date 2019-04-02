import 'package:flutter/material.dart';

import '../presentation/base_card.dart';
import '../utils/layout.dart';

class LocationCard extends StatelessWidget {
  final String address;
  final String postcode;
  final String city;

  LocationCard({this.address, this.postcode, this.city});

  @override
  Widget build(BuildContext context) {
    return BaseCard(
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
    );
  }
}