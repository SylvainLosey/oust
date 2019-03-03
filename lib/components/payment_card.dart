import 'package:flutter/material.dart';

import '../components/base_card.dart';
import '../presentation/layout.dart';

class PaymentCard extends StatelessWidget {
  final String paymentType;

  PaymentCard({this.paymentType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: LayoutContainer.of(context).matGridUnit(scale: 3)),
      child: BaseCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              paymentType,
              style: Theme.of(context).textTheme.body2
            ),
          ],
        ),
      )
    );
  }
}