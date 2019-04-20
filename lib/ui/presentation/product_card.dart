import 'package:flutter/material.dart';

import 'base_card.dart';
import '../../utils/layout.dart';


class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final String quantity;
  final Function increment;
  final Function decrement;

  ProductCard({this.image, this.title, this.subtitle, this.quantity, this.increment, this.decrement});

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset(image, width: 100),
                Text(title, style: Theme.of(context).textTheme.subtitle),
                Text(subtitle)
              ],
            )
          ),
          Container(
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.remove),
                  iconSize: 18,
                  onPressed: increment
                ),
                Container(
                  padding: EdgeInsets.all(Layout.of(context).gridUnit(1)),
                  child: Text(
                    quantity,
                    style: Theme.of(context).textTheme.subtitle
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  iconSize: 18,
                  onPressed: decrement
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}