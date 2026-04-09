import 'package:flutter/material.dart';
import '../screens/about_screen.dart';
import '../screens/contact_screen.dart';
import '../screens/policy_screen.dart';

class AppMenu extends StatelessWidget {
  const AppMenu({super.key});

  void _open(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  @override
  Widget build(BuildContext context) {
    final drawerWidth = MediaQuery.of(context).size.width * 0.5;

    return Drawer(
      width: drawerWidth,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.deepOrange),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Danh mục',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('Giới thiệu'),
            onTap: () {
              Navigator.pop(context);
              _open(context, const AboutScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.phone_outlined),
            title: const Text('Liên hệ'),
            onTap: () {
              Navigator.pop(context);
              _open(context, const ContactScreen());
            },
          ),
          ListTile(
            leading: const Icon(Icons.policy_outlined),
            title: const Text('Chính sách'),
            onTap: () {
              Navigator.pop(context);
              _open(context, const PolicyScreen());
            },
          ),
        ],
      ),
    );
  }
}
