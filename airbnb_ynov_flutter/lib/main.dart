import 'package:flutter/material.dart';

import 'package:airbnb_ynov_flutter/pages/home_page.dart';
import 'package:airbnb_ynov_flutter/pages/city_page.dart';
import 'package:airbnb_ynov_flutter/pages/housing_page.dart';
import 'package:airbnb_ynov_flutter/pages/details_page.dart';
import 'package:airbnb_ynov_flutter/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      darkTheme: ThemeData.dark(),

      onGenerateRoute: (settings){
        if(settings.name == ROUTE_HOUSING){
          return MaterialPageRoute(builder:(context) =>
              HousingPage(settings.arguments as String));
        }
      },
      initialRoute: ROUTE_HOME,
      routes: <String, WidgetBuilder>{
        ROUTE_HOME:(context) => HomePage(),
        ROUTE_CITY:(context) => CityPage(),
        ROUTE_DETAILS:(context) => DetailsPage(),
      },
    );
  }
}