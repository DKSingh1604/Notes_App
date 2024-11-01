// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:isar_crud/components/drawer_tile.dart';
import 'package:isar_crud/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          //header
          DrawerHeader(
            child: Icon(Icons.note),
          ),

          //notes tile
          DrawerTile(
            title: "Notes",
            leading: Icon(Icons.home),
            onTap: () {
              //pop the dialog
              Navigator.pop(context);
            },
          ),

          //settings tile
          DrawerTile(
            title: "Settings",
            leading: Icon(Icons.settings),
            onTap: () {
              //pop the dialog
              Navigator.pop(context);

              //navigate to settings page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
