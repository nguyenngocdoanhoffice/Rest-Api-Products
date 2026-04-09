import 'package:flutter/material.dart';

class PolicyScreen extends StatelessWidget {
  const PolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chính sách')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          'Ứng dụng tôn trọng quyền riêng tư và lưu dữ liệu tại chỗ.',
        ),
      ),
    );
  }
}
