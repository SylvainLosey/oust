import 'package:flutter/material.dart';

import 'base_card.dart';
import '../../utils/layout.dart';
import '../../utils/colors.dart';

class SelectableItem extends StatelessWidget {
  final Widget child;
  final String text;
  final Function onTap;
  final bool selected;

  SelectableItem({this.child, this.text, this.onTap, this.selected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: BaseCard(
        child: Row(
          children: <Widget>[
            if (selected)
              Icon(Icons.check_circle_outline, color: primaryColor)
            else
              Icon(Icons.radio_button_unchecked, color: Colors.grey[600]),
              
            Container(width: Layout.of(context).gridUnit(1.5)),

            if (child != null)
              child
            else
              Text(text)
          ],
        )
      ),
    );
  }
}