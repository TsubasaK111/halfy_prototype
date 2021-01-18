import 'package:flutter/material.dart';

import 'package:halfy_prototype/widgets/topZone.dart';
import 'package:halfy_prototype/widgets/bottomNavigation.dart';
import 'package:halfy_prototype/widgets/toolBar.dart';
import 'package:halfy_prototype/widgets/videoDescriptions.dart';

/// Empty page widget fo developers that want to follow along with the tutorial
/// on breaking down and implementing the Tik Tok UI (BLOG_LINK)
class TikTokPage extends StatelessWidget {
  static const String route = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('supz'),
        ),
        body: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            children: <Widget>[
              topZone,
              Expanded(
                  child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  videoDescriptions,
                  toolBar,
                ],
              )),
              new BottomNavigation(),
            ],
          ),
        ));
  }
}
