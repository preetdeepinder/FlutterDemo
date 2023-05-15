import 'dart:html';

import 'package:flutter/material.dart';
import 'package:virk_tiles/screens/homepage.dart';
import 'package:virk_tiles/screens/aboutuspage.dart';
import 'package:virk_tiles/screens/eventspage.dart';

/*class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return DesktopNavbar();
        } else if (constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
          return DesktopNavbar();
        } else {
          return MobileNavbar();
        }
      },
    );
  }
}*/

class NavBar extends StatelessWidget {
  final ValueChanged<int> itemTapped;
  final int currentIndex;
  final List<NavBarItemData> items;

  NavBar(
      {required this.items, required this.itemTapped, this.currentIndex = 0});

  NavBarItemData? get selectedItem =>
      currentIndex >= 0 && currentIndex < items.length
          ? items[currentIndex]
          : null;

  @override
  Widget build(BuildContext context) {
    List<Widget> buttonWidgets = items.map((item) {
      return MaterialButton(
          color: Color.fromARGB(255, 247, 241, 243),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          onPressed: () {
            var index = items.indexOf(item);
            itemTapped(index);
          });
    }).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text(
              "Virk Paradise Farms",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30),
            ),
            Row(
              children: buttonWidgets,
              /*<Widget>[
                MaterialButton(
                  color: Colors.pink,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EventsPage()),
                    );
                  },
                  child: const Text(
                    "Home",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                /*const Text(
                  "Home",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  width: 30,
                ),*/
                const Text(
                  "About Us",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  width: 30,
                ),
                const Text(
                  "Events",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  width: 30,
                ),
                const Text(
                  "Our Services",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  width: 30,
                ),
                MaterialButton(
                  color: Colors.pink,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AboutUsPage()),
                    );
                  },
                  child: const Text(
                    "Shop Online",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],*/
            )
          ],
        ),
      ),
    );
  }
}

/*class MobileNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Container(
        child: Column(children: <Widget>[
          const Text(
            "Virk Paradise Farms",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Home",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "About Us",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "Our Services",
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "Shop Online",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}*/
class NavBarItemData {
  final String title;
  final Color selectedColor;
  final double width;

  NavBarItemData(this.title, this.width, this.selectedColor);
}
