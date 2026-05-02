import 'package:flutter/material.dart';

class TaskCenterContent extends StatelessWidget {
  const TaskCenterContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          _buildTitleSection(),
          const SizedBox(height: 16),
          _buildSearchBar(),
          const SizedBox(height: 16),
          _buildFilterTabs(),
          const SizedBox(height: 16),
          _buildOrderCard(
            id: 'ASN20231024001',
            supplier: '顺丰速运 (上海供应商)',
            icon: Icons.local_shipping,
            status: '待处理',
            qty: '1,240',
            progress: 0.0,
            time: '2023-10-24 09:30',
            badgeColor: const Color(0xFFFFDBCB),
            badgeTextColor: const Color(0xFF783100),
            actionLabel: '去处理',
            actionIcon: Icons.chevron_right,
          ),
          const SizedBox(height: 12),
          _buildOrderCard(
            id: 'ASN20231024005',
            supplier: '京东仓储中心',
            icon: Icons.factory,
            status: '进行中',
            qty: '850',
            progress: 0.65,
            time: '2023-10-24 08:15',
            badgeColor: const Color(0xFFD8E2FF),
            badgeTextColor: const Color(0xFF004493),
            actionLabel: '继续处理',
            actionIcon: Icons.play_arrow,
          ),
          const SizedBox(height: 16),
          _buildGuideCard(),
          const SizedBox(height: 12),
          _buildOrderCard(
            id: 'ASN20231023088',
            supplier: '溢丰国际贸易',
            icon: Icons.apartment,
            status: '已完成',
            qty: '500',
            progress: 1.0,
            time: '2023-10-23 16:40',
            badgeColor: const Color(0xFFE6E8F2),
            badgeTextColor: const Color(0xFF5F6368),
            actionLabel: '查看详情',
            isCompleted: true,
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _buildTitleSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          '入库任务',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Color(0xFF191C23)),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFFDDE0E6),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            '共 24 单',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Color(0xFF5B5F64)),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFC1C6D6)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: '搜索入库单号、供应商名称',
          hintStyle: TextStyle(color: Color(0xFF727785), fontSize: 16),
          prefixIcon: Icon(Icons.search, color: Color(0xFF727785)),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }

  Widget _buildFilterTabs() {
    final tabs = ['全部', '待处理', '进行中', '已完成'];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: tabs.map((label) {
          final isAll = label == '全部';
          return Container(
            margin: const EdgeInsets.only(right: 8),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isAll ? const Color(0xFF005BBF) : Colors.white,
              borderRadius: BorderRadius.circular(24),
              border: isAll ? null : Border.all(color: const Color(0xFFC1C6D6)),
            ),
            child: Text(
              label,
              style: TextStyle(
                color: isAll ? Colors.white : const Color(0xFF414754),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildOrderCard({
    required String id,
    required String supplier,
    required IconData icon,
    required String status,
    required String qty,
    required double progress,
    required String time,
    required Color badgeColor,
    required Color badgeTextColor,
    required String actionLabel,
    IconData? actionIcon,
    bool isCompleted = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(isCompleted ? 0.8 : 1.0),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFC1C6D6)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    id,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF191C23), fontFamily: 'monospace'),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(icon, size: 16, color: const Color(0xFF727785)),
                      const SizedBox(width: 4),
                      Text(
                        supplier,
                        style: const TextStyle(fontSize: 14, color: Color(0xFF414754)),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: badgeColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  status,
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: badgeTextColor),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Divider(height: 1, color: Color(0xFFECEDF7)),
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('预计入库', style: TextStyle(fontSize: 12, color: Color(0xFF727785))),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(text: qty, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF191C23))),
                          const TextSpan(text: ' 件', style: TextStyle(fontSize: 14, color: Color(0xFF5B5F64))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('入库进度', style: TextStyle(fontSize: 12, color: Color(0xFF727785))),
                    Row(
                      children: [
                        Expanded(
                          child: LinearProgressIndicator(
                            value: progress,
                            backgroundColor: const Color(0xFFE0E2EC),
                            valueColor: AlwaysStoppedAnimation<Color>(
                              isCompleted ? const Color(0xFF5B5F64).withOpacity(0.5) : const Color(0xFF1A73E8),
                            ),
                            minHeight: 6,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${(progress * 100).toInt()}%',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: isCompleted ? const Color(0xFF5B5F64) : const Color(0xFF1A73E8),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(time, style: const TextStyle(fontSize: 14, color: Color(0xFF414754))),
              if (!isCompleted)
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Text(actionLabel, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                  label: Icon(actionIcon, size: 18),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF005BBF),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  ),
                )
              else
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFF727785)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  ),
                  child: const Text('查看详情', style: TextStyle(fontSize: 14, color: Color(0xFF414754))),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGuideCard() {
    return Container(
      height: 160,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: const DecorationImage(
          image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuCXe4iuOeatRRRToo9lw-YxyLV4pz74YTAY510TCkqiX1navWABeBOZCVSNeNCPSEw588lLzzJvWa1u3ACIJuilg4TpPgi5_48gbRj2a7dVK6WgQHVN_sN3Q4qyYSoiAv-6idc470DyVZCOs2FN-vgYS1QmH3-4PlVLiMjUEdTk3PjYn31qQQflvbdGYvXw3A4uIJDL_darqhIRUl49-lr6Fz2KjZdNMfrlw5-rWVRNIlVL6t1SZp7oHaQCD8Iw7670QTLyu5ABIXQ'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.transparent, Colors.black.withOpacity(0.6)],
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('库位管理指南', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600)),
            Text('了解如何优化您的入库路径以提高 30% 效率', style: TextStyle(color: Colors.white70, fontSize: 14)),
          ],
        ),
      ),
    );
  }
}
