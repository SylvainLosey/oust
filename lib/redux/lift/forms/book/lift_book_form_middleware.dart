import 'dart:async';

import 'package:oust/redux/lift/lift_actions.dart';
import 'package:redux/redux.dart';
import 'package:flutter/services.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'lift_book_form_actions.dart';
import '../../../auth/auth_actions.dart';
import '../../../customer/customer_actions.dart';
import '../../../app/app_state.dart';
import '../../../../data/models/lift_book_form.dart';
import '../../../../data/models/lift_image.dart';

import '../../../../data/repository.dart';

class LiftBookFormMiddleware {
  final Repository repository;
  const LiftBookFormMiddleware(this.repository);

  List<Middleware<AppState>> createLiftBookFormMiddleware() {
    return <Middleware<AppState>>[];
  }
}
