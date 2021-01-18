import 'package:flutter/material.dart';

import 'package:halfy_prototype/pages/tiktokPage.dart';
import 'package:halfy_prototype/pages/mapPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TikTokUI',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white24,
        )
      ),
      initialRoute: MapPage.route,
      routes: <String, WidgetBuilder>{
        TikTokPage.route: (context) => TikTokPage(),
        MapPage.route: (context) => MapPage(),
      }
    );
  }
}
