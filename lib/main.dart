import 'package:canteen_app/messFeedback.dart';
import 'package:canteen_app/history.dart';
import 'package:canteen_app/home.dart';
import 'package:canteen_app/models.dart';
import 'package:canteen_app/requests.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  MenuFull menuFull = await MenuRequests.getMenus();
  runApp(MyApp(
    menuFull: menuFull,
  ));
}

class MyApp extends StatelessWidget {
  final MenuFull menuFull;
  MyApp({this.menuFull});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Canteen App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Navigator());
  }
}

class Navigator extends StatefulWidget {
  @override
  _NavigatorState createState() => _NavigatorState();
}

class _NavigatorState extends State<Navigator> {
  int currInd = 2;
  final List<Widget> children = [
    Text("DEF"),
    History(),
    Home(),
    MessFeedback(),
    Text("MNO")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: children[currInd]),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.brown[100],
        buttonBackgroundColor: Colors.grey[300],
        backgroundColor: Colors.transparent,
        animationDuration: Duration(milliseconds: 300),
        height: 50,
        items: <Widget>[
          Icon(
            Icons.search,
            size: 30,
            color: Colors.orange,
          ),
          Icon(
            Icons.crop_square,
            size: 30,
            color: Colors.orange,
          ),
          Icon(
            Icons.home,
            size: 30,
            color: Colors.orange,
          ),
          Icon(
            Icons.favorite_border,
            size: 30,
            color: Colors.orange,
          ),
          Icon(
            Icons.person_outline,
            size: 30,
            color: Colors.orange,
          )
        ],
        index: 2,
        onTap: (index) {
          setState(() {
            this.currInd = index;
          });
        },
      ),
    );
  }
}
