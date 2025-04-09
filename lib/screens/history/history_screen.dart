import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lịch sử đặt lịch'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 0, // Tạm thời để 0, sẽ cập nhật sau khi có dữ liệu
        itemBuilder: (context, index) {
          return const SizedBox(); // Placeholder
        },
      ),
    );
  }
}
