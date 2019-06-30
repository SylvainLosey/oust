import 'package:flutter/material.dart';

import '../../../presentation/success_page.dart';

class SubscriptionFormAppointmentSuccess extends StatelessWidget {
  static int step = 201;

  @override
  Widget build(BuildContext context) {
    return SuccessPage(title: 'C\'est noté!', text: 'Nous te contacterons tout bientôt.', error: null);
  }
}
