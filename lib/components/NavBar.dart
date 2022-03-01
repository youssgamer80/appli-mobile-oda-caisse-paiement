import 'package:flutter/material.dart';
import 'package:oda_cagnotte/components/DashboardHome.dart';
import 'package:oda_cagnotte/components/motifscreen.dart';
import 'package:oda_cagnotte/screens/academicien_list_view.dart';
import 'package:oda_cagnotte/screens/payement_list_view.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  var _currentIndex = 0;
  List _screens = [
    DashboardHome(),
    Scaffold(
        body: Container(
      margin: EdgeInsets.symmetric(vertical: 52, horizontal: 20),
      child: Align(
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            Text(
              "STATISTIQUES",
              style: TextStyle(
                color: Color(0xFF000000),
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
    )),
    PayementListView(),
    Scaffold(
        body: Container(
      margin: EdgeInsets.symmetric(vertical: 52, horizontal: 20),
      child: Align(
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            Text(
              "CLASSEMENTS",
              style: TextStyle(
                color: Color(0xFF000000),
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
          ],
        ),
      ),
    )),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          /// Dashboard
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Dashboard"),
            selectedColor: Colors.purple,
          ),

          /// Stats
          SalomonBottomBarItem(
            icon: Icon(Icons.stacked_bar_chart),
            title: Text("Stats"),
            selectedColor: Colors.pink,
          ),

          /// Paiements
          SalomonBottomBarItem(
            icon: Icon(Icons.credit_card_outlined),
            title: Text("Paiements"),
            selectedColor: Colors.orange,
          ),

          /// Classements
          SalomonBottomBarItem(
            icon: Icon(Icons.list_outlined),
            title: Text("Classements"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}
