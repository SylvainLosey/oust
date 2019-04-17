import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Function onExit;

  MainAppBar({this.onExit});

  @override
  Widget build(BuildContext context) {
    final List<Widget> actions = <Widget>[];
    if (onExit != null) {
      actions.add(
        IconButton(
          icon: Icon(Icons.close, size: 30,),
          onPressed: onExit
        )
      );
    }

    return AppBar(
      actions: actions,
      brightness: Brightness.light,
      iconTheme: IconThemeData(
        color: Colors.black
      ),
      backgroundColor: backgroundColor,
      elevation: 0.0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}