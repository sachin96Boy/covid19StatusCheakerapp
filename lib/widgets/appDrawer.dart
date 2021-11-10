import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  static const routeName = '/customDrawer';

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 8.0,
      child: Column(
        children: [
          AppBar(
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "Telehealth Services",
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            backgroundColor: Colors.purple,
            automaticallyImplyLeading: false,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text("1990"),
            subtitle: Text("Ambulance Services"),
            onTap: () => Navigator.of(context).pop(),
          ),
          Divider(
            thickness: 1,
            indent: 20.0,
            endIndent: 20.0,
            color: Colors.grey,
          ),
          ListTile(
            leading: Icon(Icons.health_and_safety),
            title: Text("117"),
            subtitle: Text("Covid-related complaints"),
            onTap: () => Navigator.of(context).pop(),
          ),
          Divider(
            thickness: 1,
            indent: 20.0,
            endIndent: 20.0,
            color: Colors.grey,
          ),
          ListTile(
            leading: Icon(Icons.catching_pokemon_outlined),
            title: Text("0112112705"),
            subtitle: Text("Quarantine Unit"),
            onTap: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}
