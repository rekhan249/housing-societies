import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:housing_society/administer/add_services.dart';
import 'package:housing_society/administer/dashboard.dart';
import 'package:housing_society/administer/delete_services.dart';
import 'package:housing_society/administer/update_services.dart';

class AdminPanel extends StatefulWidget {
  static const routeName = "/admin-panel";
  const AdminPanel({super.key});

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  Widget selectedScreen = const Dashboard();
  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 14, 53, 85),
          title: const Text('Admin Panel',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
      sideBar: SideBar(
        activeBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        items: const [
          AdminMenuItem(
              title: 'Dashboard',
              route: Dashboard.routeName,
              icon: Icons.dashboard),
          AdminMenuItem(
              title: 'Add Services',
              route: AddServices.routeName,
              icon: Icons.add),
          AdminMenuItem(
              title: 'Update Services',
              route: UpdateServices.routeName,
              icon: Icons.update),
          AdminMenuItem(
              title: 'Delete Services',
              route: DeletedServices.routeName,
              icon: Icons.delete),
        ],
        selectedRoute: Dashboard.routeName,
        activeIconColor: const Color.fromARGB(255, 185, 10, 86),
        activeTextStyle:
            const TextStyle(color: Color.fromARGB(255, 185, 10, 86)),
        onSelected: (item) {
          if (item.route == Dashboard.routeName) {
            setState(() {
              selectedScreen = const Dashboard();
            });
          } else if (item.route == AddServices.routeName) {
            setState(() {
              selectedScreen = const AddServices();
            });
          } else if (item.route == UpdateServices.routeName) {
            setState(() {
              selectedScreen = const UpdateServices();
            });
          } else if (item.route == DeletedServices.routeName) {
            setState(() {
              selectedScreen = const DeletedServices();
            });
          }
        },
      ),
      body: selectedScreen,
    );
  }
}
