import 'package:flutter/material.dart';
import 'package:housing_society/pages_screen/home_page.dart';

class BottomNavSocities extends StatefulWidget {
  const BottomNavSocities({super.key});

  @override
  State<BottomNavSocities> createState() => _BottomNavSocitiesState();
}

class _BottomNavSocitiesState extends State<BottomNavSocities> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    HomePage(),
    HomePage(),
    HomePage(),
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
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
