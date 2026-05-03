import 'package:flutter/material.dart';
import 'screens/workbench_content.dart';
import 'screens/task_center_content.dart';
import 'screens/business_function_screen.dart';
import 'screens/profile_content.dart';
import 'screens/inbound_scan_screen.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const InventoryApp());
}

class InventoryApp extends StatelessWidget {
  const InventoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inventory App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF005BBF),
          primary: const Color(0xFF005BBF),
          primaryContainer: const Color(0xFF1A73E8),
          onPrimaryContainer: Colors.white,
          secondary: const Color(0xFF5B5F64),
          tertiary: const Color(0xFF9E4300),
          surface: const Color(0xFFF9F9FF),
          onSurface: const Color(0xFF191C23),
        ),
        scaffoldBackgroundColor: const Color(0xFFF9F9FF),
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const MainHomeScreen(),
      },
    );
  }
}

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const WorkbenchContent(),
    const TaskCenterContent(),
    const ProfileContent(),
  ];

  final List<String> _titles = ['工作台', '任务中心', '个人中心'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _pages[_currentIndex],
      bottomNavigationBar: _buildBottomNav(),
      floatingActionButton: _currentIndex != 2
          ? FloatingActionButton(
              onPressed: () => _navigateToScan(context),
              backgroundColor: const Color(0xFF005BBF),
              foregroundColor: Colors.white,
              shape: const CircleBorder(),
              child: const Icon(Icons.qr_code_scanner, size: 28),
            )
          : null,
    );
  }

  void _navigateToScan(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const InboundScanScreen()),
    );
  }

  void _navigateTo(BuildContext context, String title, IconData icon) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BusinessFunctionScreen(title: title, icon: icon),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Color(0xFF64748B)),
        onPressed: () {},
      ),
      title: Text(
        _titles[_currentIndex],
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF0F172A)),
      ),
      centerTitle: false,
      actions: [
        if (_currentIndex != 2)
          IconButton(
            icon: const Icon(Icons.qr_code_scanner, color: Color(0xFF1A73E8)),
            onPressed: () => _navigateToScan(context),
          )
        else
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Color(0xFF1A73E8)),
            onPressed: () {},
          ),
        const SizedBox(width: 8),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Divider(height: 1, color: Colors.grey.withOpacity(0.1)),
      ),
    );
  }

  Widget _buildBottomNav() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) => setState(() => _currentIndex = index),
      selectedFontSize: 10,
      unselectedFontSize: 10,
      selectedItemColor: const Color(0xFF1A73E8),
      unselectedItemColor: const Color(0xFF64748B),
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: '工作台'),
        BottomNavigationBarItem(icon: Icon(Icons.assignment), label: '任务中心'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: '个人中心'),
      ],
    );
  }
}
