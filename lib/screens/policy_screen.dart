import 'package:flutter/material.dart';

class PolicyScreen extends StatelessWidget {
  const PolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Policy')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text('This app respects user privacy and uses data locally.'),
      ),
    );
  }
}
