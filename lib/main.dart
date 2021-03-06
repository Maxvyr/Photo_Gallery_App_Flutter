import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'controller/routes.dart';
import 'controller/color.dart';
import 'controller/constants.dart';
import 'view/home_page.dart';

void main() {
  //Mode Portrait only
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: titleApp,
      theme: ThemeData(
        primarySwatch: indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: homeRoute,
      routes: {
        homeRoute: (context) => MyHomePage(
              title: titleApp,
            ),
      },
    );
  }
}
