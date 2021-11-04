import 'package:covid_app/screens/moreDetailScreen.dart';
import 'package:covid_app/widgets/appDrawer.dart';
import 'package:flutter/material.dart';

import 'package:covid_app/config/palatte.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  GlobalKey<ScaffoldState> globalKey;

  CustomAppBar(this.globalKey);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Palette.primaryColor,
      elevation: 0.0,
      leading: IconButton(
        icon: Icon(Icons.menu),
        iconSize: 28.0,
        onPressed: () {
          globalKey.currentState!.openDrawer();
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.notifications),
          iconSize: 28.0,
          onPressed: () {
            Navigator.of(context).pushNamed(MoreDetailScreen.routeName);
          },
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
      kToolbarHeight); //create a custom height for the new appbar
}
