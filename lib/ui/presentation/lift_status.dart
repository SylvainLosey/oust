import 'package:flutter/material.dart';

import '../../utils/layout.dart';

class LiftStatus extends StatelessWidget {
  final String status;

  LiftStatus({this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: Layout.of(context).gridUnit(0.5), vertical: 2),
        decoration: BoxDecoration(color: _getStatusColor(status), borderRadius: BorderRadius.all(Radius.circular(4))),
        child: Text(_getStatusText(status), style: Theme.of(context).textTheme.caption.copyWith(color: Colors.white)));
  }

  String _getStatusText(String status) {
    switch (status) {
      case 'CREATED':
        return 'En attente du prix';
      case 'PRICED':
        return 'Prix fixé';
      case 'ACCEPTED':
        return 'Accepté';
      case 'SCHEDULED':
        return 'Passage fixé';
      case 'COMPLETED':
        return 'Terminé';
      case 'REFUSED':
        return 'Refusé';
      case 'CANCELED':
        return 'Annulé';
      default:
        return 'status';
    }
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'CREATED':
        return Colors.red[300];
      case 'PRICED':
        return Colors.orange[300];
      case 'ACCEPTED':
        return Colors.yellow[300];
      case 'SCHEDULED':
        return Colors.lightGreenAccent;
      case 'COMPLETED':
        return Colors.green[300];
      case 'REFUSED':
        return Colors.grey[400];
      case 'CANCELED':
        return Colors.grey[400];
      default:
        return Colors.grey[400];
    }
  }
}
