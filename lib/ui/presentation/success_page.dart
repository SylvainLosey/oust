import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

import '../../utils/layout.dart';
import 'error_text.dart';

class SuccessPage extends StatelessWidget {
  final String title;
  final String text;
  final String error;

  SuccessPage({this.title, this.text, this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: Layout.of(context).gridUnit(5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Spacer(flex: 4),
                    if (error != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text('Oups !', style: Theme.of(context).textTheme.title),
                          Text(
                            'Il semble qu\'une erreur se soit produite durant ton inscription. Contacte-nous au 079 476 87 07 ou à info@oust.ch pour que nous arrangions tout ça',
                            textAlign: TextAlign.center,
                          ),
                          Container(height: Layout.of(context).gridUnit(10)),
                          Text('Message d\'erreur'),
                          ErrorText(
                            error: error,
                          )
                        ],
                      )
                    else
                      Row(children: <Widget>[
                        SizedBox(
                            height: 80, width: 100, child: FlareActor('assets/flare/success.flr', animation: 'pop')),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[Text(title, style: Theme.of(context).textTheme.title), Text(text)],
                        ))
                      ]),
                    Spacer(flex: 6),
                    RaisedButton(
                        child:
                            Text('Terminer', style: Theme.of(context).textTheme.button.copyWith(color: Colors.white)),
                        onPressed: () => Navigator.of(context).popUntil(ModalRoute.withName('/'))),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  ],
                ))));
  }
}
