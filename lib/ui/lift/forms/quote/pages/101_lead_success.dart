import 'package:flutter/material.dart';

import '../../../../presentation/success_page.dart';

class LiftQuoteFormLeadSuccess extends StatelessWidget {
  static int step = 101;

  @override
  Widget build(BuildContext context) {
    return SuccessPage(
        title: "C'est noté !", text: "Nous te recontacterons dès que nous pourrons venir chez toi", error: null);
  }
}
