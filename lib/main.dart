import 'package:covid_app/data/covidData.dart';
import 'package:covid_app/screens/home_Screen.dart';
import 'package:covid_app/screens/information.dart';
import 'package:covid_app/screens/mapScreen.dart';
import 'package:covid_app/screens/moreDetailScreen.dart';
import 'package:covid_app/screens/screens.dart';
import 'package:covid_app/widgets/appDrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/bottom_nav_screen.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CovidData([]),
      child: MaterialApp(
        title: 'Covid-19 CareApp',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: BottomNavScreen(),
        routes: {
          MoreDetailScreen.routeName: (context) => MoreDetailScreen(),
          StatusScreen.routeName: (context) => StatusScreen(),
          MapScreen.routeName: (context) => MapScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
          InformationScreen.routeName: (context) => InformationScreen(),
          AppDrawer.routeName: (context) => AppDrawer(),
          BottomNavScreen.routeName: (context) => BottomNavScreen()
        },
      ),
    );
  }
}
