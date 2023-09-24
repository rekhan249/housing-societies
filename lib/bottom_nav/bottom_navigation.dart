import 'package:flutter/material.dart';
import 'package:housing_society/administer/admin_panel.dart';
import 'package:housing_society/pages_screen/home_page.dart';
import 'package:housing_society/pages_screen/profile_details.dart';
import 'package:housing_society/pages_screen/setting_page.dart';
import 'package:housing_society/society_service/all_services.dart';

class BottomNavSocities extends StatefulWidget {
  const BottomNavSocities({super.key});

  @override
  State<BottomNavSocities> createState() => _BottomNavSocitiesState();
}

class _BottomNavSocitiesState extends State<BottomNavSocities> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ServicesScreen(),
    ProfileDetails(),
    SettingScreen(),
    AdminPanel()
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
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color.fromARGB(255, 185, 10, 86),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.room_service),
            label: 'Services',
            backgroundColor: Color.fromARGB(255, 185, 10, 86),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Color.fromARGB(255, 185, 10, 86),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Color.fromARGB(255, 185, 10, 86),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.admin_panel_settings),
            label: 'Admin Panel',
            backgroundColor: Color.fromARGB(255, 185, 10, 86),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
