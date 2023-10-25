import 'package:flutter/material.dart';
import 'package:housing_society/pages_screen/home_page.dart';
import 'package:housing_society/pages_screen/profile_details.dart';
import 'package:housing_society/society_service/all_services.dart';

class BottomNavUser extends StatefulWidget {
  static const String routeName = 'bottom-user';
  const BottomNavUser({super.key});

  @override
  State<BottomNavUser> createState() => _BottomNavUserState();
}

class _BottomNavUserState extends State<BottomNavUser> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    ServicesScreen(),
    HomePage(),
    ProfileDetails(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.room_service),
              label: 'Services',
              backgroundColor: Colors.white),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.white,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
