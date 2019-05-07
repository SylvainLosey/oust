import 'package:flutter/material.dart';
// import 'package:flare_flutter/flare_actor.dart';

import '../../../../utils/layout.dart';


class SubscriptionFormSubmit extends StatelessWidget {
  static int step = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Layout.of(context).gridUnit(5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                child: Container(),
                flex: 4,
              ),
              Row(
              children: <Widget>[
                // SizedBox(
                //   height: 80,
                //   width: 100,
                //   child: FlareActor(
                //     'assets/flare/success.flr', 
                //     animation: 'pop'
                //     )
                //   ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('C\'est noté!', style: Theme.of(context).textTheme.title),
                        Text('Nous te contacterons lorsque nous pourrons venir chez toi.')
                      ],
                    )
                  )
                ]
              ),
              Expanded(
                flex: 6,
                child: Container(),
              ),
              RaisedButton(
                child: Text('Terminer', style: Theme.of(context).textTheme.button.copyWith(color: Colors.white)),
                onPressed: () => Navigator.of(context).popUntil(ModalRoute.withName('/'))
              ),
            ],
          )
        )
      )
    );
  }
}
