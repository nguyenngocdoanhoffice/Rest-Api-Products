import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/product.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách sản phẩm'),
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'about') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('About'),
                    content: const Text('Ứng dụng demo bán hàng bằng Flutter'),
                  ),
                );
              } else if (value == 'contact') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Contact'),
                    content: const Text('Email: example@gmail.com'),
                  ),
                );
              } else if (value == 'policy') {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Policy'),
                    content: const Text('Chính sách bảo mật...'),
                  ),
                );
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'about', child: Text('About')),
              const PopupMenuItem(value: 'contact', child: Text('Contact')),
              const PopupMenuItem(value: 'policy', child: Text('Policy')),
            ],
          ),
        ],
      ),
      body: FutureBuilder<List<Product>>(
        future: ApiService.fetchProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Lỗi: ${snapshot.error}'));
          }

          final products = snapshot.data!;

          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final p = products[index];

              return Card(
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  leading: Image.network(
                    p.image,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(p.title),
                  subtitle: Text('\$${p.price}'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
