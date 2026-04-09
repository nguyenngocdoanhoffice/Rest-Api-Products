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
    return PopupMenuButton<String>(
      onSelected: (value) {
        if (value == 'about') {
          _open(context, const AboutScreen());
        } else if (value == 'contact') {
          _open(context, const ContactScreen());
        } else if (value == 'policy') {
          _open(context, const PolicyScreen());
        }
      },
      itemBuilder: (context) => const [
        PopupMenuItem(value: 'about', child: Text('About')),
        PopupMenuItem(value: 'contact', child: Text('Contact')),
        PopupMenuItem(value: 'policy', child: Text('Policy')),
      ],
    );
  }
}
