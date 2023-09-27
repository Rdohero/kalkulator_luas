import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:kalkulator_luas/History.dart';
import 'package:kalkulator_luas/Home.dart';
import 'package:kalkulator_luas/LogOutScreen.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({super.key});

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _index = 0;
  List<Widget> body = [
    Home(),
    History(),
    LogOuteScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: NavigationBar(
        backgroundColor: Color(0xFF152744),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        height: 60,
        indicatorColor: Color(0xFF2D657E),
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home_outlined, color: Colors.white,),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(Icons.update, color: Colors.white,),
            label: "History",
          ),
          NavigationDestination(
            icon: Icon(Icons.logout, color: Colors.white,),
            label: "Log Out",
          ),
        ],
        selectedIndex: _index,
        onDestinationSelected: (index) {
          setState(() {
            _index = index;
          });
        },
      ),
      body: body[_index],
    );
  }
}
