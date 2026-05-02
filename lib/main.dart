import 'package:flutter/material.dart';

void main() {
  runApp(const InventoryApp());
}

class InventoryApp extends StatelessWidget {
  const InventoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inventory Workbench',
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
      home: const WorkbenchScreen(),
    );
  }
}

class WorkbenchScreen extends StatefulWidget {
  const WorkbenchScreen({super.key});

  @override
  State<WorkbenchScreen> createState() => _WorkbenchScreenState();
}

class _WorkbenchScreenState extends State<WorkbenchScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            _buildStatsDashboard(),
            const SizedBox(height: 24),
            _buildQuickActions(context),
            const SizedBox(height: 24),
            _buildTaskList(),
            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateTo(context, '扫码识别', Icons.qr_code_scanner),
        backgroundColor: const Color(0xFF005BBF),
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
        child: const Icon(Icons.qr_code_scanner, size: 28),
      ),
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
      title: const Text(
        '工作台',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF0F172A)),
      ),
      centerTitle: false,
      actions: [
        IconButton(
          icon: const Icon(Icons.qr_code_scanner, color: Color(0xFF1A73E8)),
          onPressed: () => _navigateTo(context, '扫码识别', Icons.qr_code_scanner),
        ),
        const SizedBox(width: 8),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Divider(height: 1, color: Colors.grey.withOpacity(0.1)),
      ),
    );
  }

  Widget _buildStatsDashboard() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF1A73E8),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Stack(
            children: [
              Positioned(
                right: -20,
                bottom: -20,
                child: Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.1), shape: BoxShape.circle),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('待办任务', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
                      const SizedBox(height: 4),
                      const Text('24', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 4),
                      Row(
                        children: const [
                          Icon(Icons.schedule, color: Colors.white, size: 14),
                          SizedBox(width: 4),
                          Text('需在 2 小时内完成', style: TextStyle(color: Colors.white, fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), shape: BoxShape.circle),
                    child: const Icon(Icons.assignment_late, color: Colors.white, size: 32),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(child: _buildSmallStatCard('今日入库', '1,280', 'SKU', const Color(0xFF005BBF))),
            const SizedBox(width: 8),
            Expanded(child: _buildSmallStatCard('今日出库', '956', 'SKU', const Color(0xFF9E4300))),
          ],
        ),
      ],
    );
  }

  Widget _buildSmallStatCard(String label, String value, String unit, Color color) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFC1C6D6)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Color(0xFF414754), fontSize: 14, fontWeight: FontWeight.w500)),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(value, style: TextStyle(color: color, fontSize: 18, fontWeight: FontWeight.w600)),
              const SizedBox(width: 4),
              Text(unit, style: const TextStyle(color: Color(0xFF414754), fontSize: 10, fontWeight: FontWeight.w500)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActions(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('业务中心', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFC1C6D6)),
          ),
          child: GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 3,
            mainAxisSpacing: 16,
            crossAxisSpacing: 8,
            childAspectRatio: 0.85,
            children: [
              _buildActionItem(context, Icons.input, '入库管理', const Color(0xFFD8E2FF), const Color(0xFF005BBF)),
              _buildActionItem(context, Icons.output, '出库管理', const Color(0xFFDFE3E8), const Color(0xFF43474C)),
              _buildActionItem(context, Icons.inventory_2, '库存盘点', const Color(0xFFFFDBCB), const Color(0xFF9E4300)),
              _buildActionItem(context, Icons.swap_horiz, '移库管理', const Color(0xFFE6E8F2), const Color(0xFF414754)),
              _buildActionItem(context, Icons.search, '库存查询', const Color(0xFFE6E8F2), const Color(0xFF414754)),
              _buildActionItem(context, Icons.analytics, '报表统计', const Color(0xFFE6E8F2), const Color(0xFF414754)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionItem(BuildContext context, IconData icon, String label, Color bgColor, Color iconColor) {
    return InkWell(
      onTap: () => _navigateTo(context, label, icon),
      borderRadius: BorderRadius.circular(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
            child: Icon(icon, color: iconColor),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Color(0xFF191C23))),
        ],
      ),
    );
  }

  Widget _buildTaskList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('最近任务', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            TextButton(onPressed: () {}, child: const Text('查看全部', style: TextStyle(color: Color(0xFF1A73E8), fontSize: 12))),
          ],
        ),
        const SizedBox(height: 8),
        _buildTaskCard('IN20231027001', '待收货', '库位: A-12-05 | 数量: 450 件', '10 分钟前更新', 'https://images.unsplash.com/photo-1586528116311-ad8dd3c8310d?w=200', badgeColor: const Color(0xFFD8E2FF), badgeTextColor: const Color(0xFF004493), icon: Icons.schedule),
        const SizedBox(height: 12),
        _buildTaskCard('CK20231027042', '盘点中', '库区: 电子元件区 | 完成度: 65%', '', 'https://images.unsplash.com/photo-1553413077-190dd305871c?w=200', badgeColor: const Color(0xFFFFDBCB), badgeTextColor: const Color(0xFF783100), progress: 0.65),
      ],
    );
  }

  Widget _buildTaskCard(String id, String status, String detail, String time, String imageUrl, {required Color badgeColor, required Color badgeTextColor, IconData? icon, double? progress}) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), border: Border.all(color: const Color(0xFFC1C6D6))),
      child: Row(
        children: [
          ClipRRect(borderRadius: BorderRadius.circular(8), child: Image.network(imageUrl, width: 64, height: 64, fit: BoxFit.cover)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('单号: $id', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF191C23))),
                    Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2), decoration: BoxDecoration(color: badgeColor, borderRadius: BorderRadius.circular(12)), child: Text(status, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: badgeTextColor))),
                  ],
                ),
                const SizedBox(height: 4),
                Text(detail, style: const TextStyle(fontSize: 12, color: Color(0xFF414754))),
                const SizedBox(height: 8),
                if (progress != null) LinearProgressIndicator(value: progress, backgroundColor: const Color(0xFFECEDF7), valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF9E4300)), minHeight: 4) else Row(children: [if (icon != null) Icon(icon, size: 14, color: const Color(0xFF414754)), if (icon != null) const SizedBox(width: 4), Text(time, style: const TextStyle(fontSize: 10, color: Color(0xFF414754)))]),
              ],
            ),
          ),
        ],
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
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: '工作台'),
        BottomNavigationBarItem(icon: Icon(Icons.assignment), label: '任务中心'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: '个人中心'),
      ],
    );
  }
}

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
