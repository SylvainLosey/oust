import 'package:flutter/material.dart';

import 'bottom_nav.dart';
import 'root_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: _createAppBar(),
      body: RootScreen(),
      bottomNavigationBar: BottomNav(),
    );
  }

  AppBar _createAppBar() {
    return AppBar(
      title: Text('Oust!'),
    );
  }
}