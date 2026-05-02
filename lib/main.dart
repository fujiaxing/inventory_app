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
        // 映射 HTML 中的配色方案
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF005BBF),
          primary: const Color(0xFF005BBF),
          onPrimary: Colors.white,
          surface: Colors.white,
          background: const Color(0xFFF9F9FF),
          outlineVariant: const Color(0xFFC1C6D6),
          errorContainer: const Color(0xFFFFDAD6),
          onErrorContainer: const Color(0xFF93000A),
        ),
        scaffoldBackgroundColor: const Color(0xFFF9F9FF),
        // 设置默认字体
        fontFamily: 'sans-serif',
      ),
      home: const WorkbenchScreen(),
    );
  }
}

class WorkbenchScreen extends StatelessWidget {
  const WorkbenchScreen({super.key});

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
            _buildSearchBar(),
            const SizedBox(height: 12),
            _buildFilterChips(),
            const SizedBox(height: 24),
            _buildStatsCard(),
            const SizedBox(height: 24),
            _buildListHeader(),
            const SizedBox(height: 12),
            // 列表项
            _buildInventoryItem(
              title: '激光传感器 XJ-400',
              code: 'SN-2023-001',
              imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAJhpYvOFNsbDLitBzaFS-21e1IpuElw__ARR1SxXkzi-90ZrLikh0HzI73aFXuq6VRI9j735JikgkT5RGpyGjtWNyG5wbopDDGYfeZdoamqPDdvic_SQA4W357VOu5UyjUDbmOo6sHUy38bhk56b9-DoVTTp-ko6hRSumSGPGqEKAEebMeSCIBQfWlE6CQ8AcqQmdkwIB_sMrroFABcmCd1pUyibnr-XBlHvtjTlNEsidpTMaSsfF04MJpZ_G5s2uqG1XGEMvWJ44',
              status: '库存低',
              isWarning: true,
              location: 'A-12-04',
              warehouse: '一号总仓',
              quantity: '42',
              unit: 'pcs',
            ),
            const SizedBox(height: 12),
            _buildInventoryItem(
              title: '主控板 CPU-V5',
              code: 'PCB-99-ALPHA',
              imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAOXsw0qY3NumsvGesOCH08TxByQT44d6QGX14rBjJEKdu8vKY-jAgaZjecym6u0a2jY7_Rdx527axxoHJGNXMtphSBVelUErwenylahlRjMBIYqDBNVGobC6ll9seLtZ-mc_O6hwIeXDvctLBSk79o7WjYx3lDwJxYxsq7FZyKdxa1ZkyigdKRE84HmsLI8wIcJ7x3-C45tYuLeRhquAO7ablFHaGFzR283T-fdFXAN731NTtgaRgZLxN1FUUL6vQB4OBjt27yd50',
              status: '正常',
              isWarning: false,
              location: 'B-01-22',
              warehouse: '二号副仓',
              quantity: '1,120',
              unit: 'pcs',
            ),
            const SizedBox(height: 12),
            _buildInventoryItem(
              title: '合金齿轮 GR-88',
              code: 'MEC-GEAR-88',
              imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCWUa8rO2BSxbcSktt23IlBjUboWkA5S7XHixlCJaAzI-st3vQaOPv8KeakRl9-iDN52QH7_MENRGB8Hx3dHz-nIOGDx_7AexjprAb3mmvIiKrsHz8l9N7ndKd4swWvzqrQEJE-MUdhvWx7b-ZJdXVIivzt5mWId6YcuZNy9adHkYgjZEdvPeWB0aE1s1nHbyJDwE6amTnbll-x4osgwepEp8nDMN-0W1bup9gL2Jq7qKxxc-Vg4NChw7ZEUQ42tiGqkFP2Q6k7RcA',
              status: '正常',
              isWarning: false,
              location: 'C-05-10',
              warehouse: '一号总仓',
              quantity: '355',
              unit: 'set',
            ),
            const SizedBox(height: 100), // 底部留白
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF005BBF),
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.white),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  // AppBar 实现
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Color(0xFF1A73E8)),
        onPressed: () {},
      ),
      title: const Text(
        '工作台',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Color(0xFF191C23),
        ),
      ),
      centerTitle: false,
      actions: [
        IconButton(
          icon: const Icon(Icons.qr_code_scanner, color: Color(0xFF1A73E8)),
          onPressed: () {},
        ),
        const SizedBox(width: 8),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Divider(height: 1, color: Colors.grey.withOpacity(0.2)),
      ),
    );
  }

  // 搜索框
  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFC1C6D6)),
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: '搜索品名、编码、库位',
          hintStyle: TextStyle(color: Color(0xFF727785), fontSize: 16),
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search, color: Color(0xFF727785)),
          suffixIcon: Icon(Icons.filter_list, color: Color(0xFF1A73E8)),
        ),
      ),
    );
  }

  // 横向标签
  Widget _buildFilterChips() {
    final chips = ['全部品类', '一号仓库', '库存预警', '电子原件'];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: chips.map((label) {
          final isActive = label == '全部品类';
          return Container(
            margin: const EdgeInsets.only(right: 8),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isActive ? const Color(0xFF1A73E8) : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: isActive ? null : Border.all(color: const Color(0xFFC1C6D6)),
            ),
            child: Text(
              label,
              style: TextStyle(
                color: isActive ? Colors.white : const Color(0xFF414754),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  // 统计卡片
  Widget _buildStatsCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFC1C6D6)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('当前库存品项', style: TextStyle(color: Color(0xFF414754), fontSize: 14)),
              Text('1,284', style: TextStyle(color: Color(0xFF005BBF), fontSize: 30, fontWeight: FontWeight.w700)),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Color(0xFFD8E2FF),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.inventory_2, color: Color(0xFF005BBF)),
          ),
        ],
      ),
    );
  }

  // 列表标题
  Widget _buildListHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text('库存清单', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF191C23))),
        Text('共 42 条结果', style: TextStyle(fontSize: 14, color: Color(0xFF727785))),
      ],
    );
  }

  // 清单项组件
  Widget _buildInventoryItem({
    required String title,
    required String code,
    required String imageUrl,
    required String status,
    required bool isWarning,
    required String location,
    required String warehouse,
    required String quantity,
    required String unit,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFC1C6D6)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 图片
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(imageUrl, width: 80, height: 80, fit: BoxFit.cover),
          ),
          const SizedBox(width: 16),
          // 信息
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF191C23))),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: isWarning ? const Color(0xFFFFDAD6) : const Color(0xFFE6E8F2),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        status,
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: isWarning ? const Color(0xFF93000A) : const Color(0xFF5F6368),
                        ),
                      ),
                    ),
                  ],
                ),
                Text('CODE: $code', style: const TextStyle(color: Color(0xFF727785), fontSize: 14, fontFamily: 'monospace')),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildIconLabel(Icons.location_on, '库位: $location'),
                        _buildIconLabel(Icons.warehouse, warehouse),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text('当前总数', style: TextStyle(fontSize: 10, color: Color(0xFF414754), fontWeight: FontWeight.bold)),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: quantity,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                  color: isWarning ? const Color(0xFF005BBF) : const Color(0xFF191C23),
                                ),
                              ),
                              TextSpan(
                                text: ' $unit',
                                style: const TextStyle(fontSize: 14, color: Color(0xFF414754)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIconLabel(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Icon(icon, size: 16, color: const Color(0xFF414754)),
          const SizedBox(width: 4),
          Text(label, style: const TextStyle(fontSize: 14, color: Color(0xFF414754))),
        ],
      ),
    );
  }

  // 底部导航栏
  Widget _buildBottomNav() {
    return Container(
      height: 64,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.withOpacity(0.2))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.dashboard, '工作台', isActive: true),
          _buildNavItem(Icons.assignment, '任务中心'),
          _buildNavItem(Icons.person, '个人中心'),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, {bool isActive = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          decoration: isActive
              ? BoxDecoration(color: const Color(0xFFE3F2FD), borderRadius: BorderRadius.circular(12))
              : null,
          child: Icon(icon, color: isActive ? const Color(0xFF1A73E8) : const Color(0xFF5F6368)),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
            color: isActive ? const Color(0xFF1A73E8) : const Color(0xFF5F6368),
          ),
        ),
      ],
    );
  }
}
