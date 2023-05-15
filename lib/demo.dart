import 'dart:math';

import 'package:flutter/material.dart';
import 'screens/homepage.dart';
import 'screens/aboutuspage.dart';
import 'screens/eventspage.dart';
import 'navbar.dart';

class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  List<NavBarItemData> _navBarItems = [];
  int _selectedNavIndex = 0;

  List<Widget> _viewsByIndex = [];

  @override
  void initState() {
    _navBarItems = [
      NavBarItemData("Home", 110, Colors.white),
      NavBarItemData("About Us", 110, Color(0xff01b87d)),
      NavBarItemData("Events", 110, Color(0xff01b87d)),
      NavBarItemData("Our Services", 110, Color(0xff01b87d)),
      NavBarItemData("Shop Online", 110, Color(0xff01b87d)),
    ];

    _viewsByIndex = <Widget>[
      HomePage(),
      EventsPage(),
      HomePage(),
      AboutUsPage(),
      HomePage(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext) {
    //Display the correct child view for the current index

    return Scaffold(
        backgroundColor: Color(0xffE6E6E6),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color.fromRGBO(195, 20, 50, 1.0),
                  Color.fromRGBO(36, 11, 54, 1.0)
                ]),
          ),
          child: SingleChildScrollView(
              child: Column(children: <Widget>[
            NavBar(
              items: _navBarItems,
              itemTapped: _handleNavBtnTapped,
              currentIndex: _selectedNavIndex,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
              child: _viewsByIndex[
                  min(_selectedNavIndex, _viewsByIndex.length - 1)],
            ),
          ])),
        ));
  }

  void _handleNavBtnTapped(int index) {
    //Save the new index and trigger a rebuild
    setState(() {
      //This will be passed into the NavBar and change it's selected state, also controls the active content page
      _selectedNavIndex = index;
    });
  }
}
