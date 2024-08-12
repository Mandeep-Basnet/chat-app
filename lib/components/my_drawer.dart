import 'package:flutter/material.dart';
import 'package:flutter_application_2/services/auth/auth_Service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Drawer(
      backgroundColor: theme.colorScheme.surface,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                  child: Icon(
                Icons.chat,
                color: theme.colorScheme.tertiary,
              )),
              Text(
                "Chat App",
                style: theme.textTheme.displayMedium,
              ),
              Text(AuthService().getCurrentUser()?.email ?? "No User"),
            ],
          ),
          Column(
            children: [
              ListTile(
                  leading: Icon(
                    Icons.home,
                    color: theme.colorScheme.tertiary,
                  ),
                  title: Text("H O M E"),
                  onTap: () => Navigator.pop(context)),
              ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: theme.colorScheme.tertiary,
                  ),
                  title: Text("S E T T I N G"),
                  onTap: () => Navigator.pop(context)),
            ],
          ),
          Column(
            children: [
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: theme.colorScheme.tertiary,
                ),
                title: Text("L O G O U T"),
                onTap: () => AuthService().signOut(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
