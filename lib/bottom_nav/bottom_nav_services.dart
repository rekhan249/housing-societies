import 'package:flutter/material.dart';
import 'package:housing_society/administer/add_services.dart';
import 'package:housing_society/administer/admin_panel.dart';
import 'package:housing_society/administer/delete_services.dart';
import 'package:housing_society/pages_screen/home_page.dart';
import 'package:housing_society/society_service/all_services.dart';

class BottomNavServices extends StatefulWidget {
  static const String routeName = 'bottom-service';
  const BottomNavServices({super.key});

  @override
  State<BottomNavServices> createState() => _BottomNavServicesState();
}

class _BottomNavServicesState extends State<BottomNavServices> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    ServicesScreen(),
    AdminPanel(),
    HomePage(),
    AddServices(),
    DeletedServices()
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
            backgroundColor: Color.fromARGB(255, 185, 10, 86),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.admin_panel_settings),
            label: 'Admin Panel',
            backgroundColor: Color.fromARGB(255, 185, 10, 86),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color.fromARGB(255, 185, 10, 86),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_outlined),
            label: 'Add Services',
            backgroundColor: Color.fromARGB(255, 185, 10, 86),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delete_forever),
            label: 'Deleted Service',
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
