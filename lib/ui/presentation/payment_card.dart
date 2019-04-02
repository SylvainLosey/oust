import 'package:flutter/material.dart';

import '../presentation/base_card.dart';
import '../../utils/layout.dart';

class PaymentCard extends StatelessWidget {
  final String paymentType;

  PaymentCard({this.paymentType});

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            paymentType,
            style: Theme.of(context).textTheme.body2
          ),
        ],
      ),
    );
  }
}