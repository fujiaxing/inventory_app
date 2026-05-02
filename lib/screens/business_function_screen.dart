import 'package:flutter/material.dart';

class BusinessFunctionScreen extends StatelessWidget {
  final String title;
  final IconData icon;

  const BusinessFunctionScreen({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 80, color: Theme.of(context).colorScheme.primary.withOpacity(0.5)),
            const SizedBox(height: 24),
            Text('$title 功能开发中...', style: const TextStyle(fontSize: 16, color: Colors.grey)),
            const SizedBox(height: 48),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('返回工作台'),
            ),
          ],
        ),
      ),
    );
  }
}
