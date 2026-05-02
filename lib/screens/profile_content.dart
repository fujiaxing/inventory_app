import 'package:flutter/material.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        children: [
          _buildProfileHeader(),
          const SizedBox(height: 8),
          _buildStatsGrid(),
          const SizedBox(height: 8),
          _buildMenuList(),
          const SizedBox(height: 24),
          _buildLogoutButton(),
        ],
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFF2F3FD))),
      ),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFC1C6D6)),
              image: const DecorationImage(
                image: NetworkImage('https://lh3.googleusercontent.com/aida-public/AB6AXuBbQTEJKGeDf6EPbDaEfK0Re17YceXJHyFABywzbJ4SIRZH-g6Bd7XBW5YcBIORvxyjSJjpivcEjokT5LxBLU6nWpTVlz3ThokYKZFKMk8gMrAJNvNOOj7O7aiqtun2S5-KUjM7XCzYMcWuBFoUN5G9_VhXT-yEfJt79Bh9ztUkQCS1Q5Nxy5GjNfWLnzhMrFYn5oN1sOKDeVoHnXwCPk7ZAEL3BWjokpFgJn9rFA3UjPtUI6eLLEfI9nzRNpmllOKDC28-od22eOg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    const Text(
                      '张利民',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: Color(0xFF191C23)),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: const Color(0xFF1A73E8),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        '高级组长',
                        style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text('ID: 9527', style: TextStyle(color: Color(0xFF5B5F64), fontSize: 14)),
                const Text('物流一课', style: TextStyle(color: Color(0xFF5B5F64), fontSize: 14)),
              ],
            ),
          ),
          const Icon(Icons.chevron_right, color: Color(0xFF727785)),
        ],
      ),
    );
  }

  Widget _buildStatsGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: _buildStatItem(Icons.login, '今日完成入库', '128', '单')),
              const SizedBox(width: 12),
              Expanded(child: _buildStatItem(Icons.logout, '今日完成出库', '94', '单')),
            ],
          ),
          const SizedBox(height: 12),
          _buildMonthlyPerformance(),
        ],
      ),
    );
  }

  Widget _buildStatItem(IconData icon, String label, String value, String unit) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFC1C6D6)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 14, color: const Color(0xFF005BBF)),
              const SizedBox(width: 4),
              Text(label, style: const TextStyle(color: Color(0xFF5B5F64), fontSize: 12)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(value, style: const TextStyle(color: Color(0xFF005BBF), fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(width: 4),
              Text(unit, style: const TextStyle(color: Color(0xFF5B5F64), fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMonthlyPerformance() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF005BBF),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Icon(Icons.stars, color: Colors.white, size: 14),
                  SizedBox(width: 4),
                  Text('本月绩效评分', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500)),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: const [
                  Text('98.5', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
                  SizedBox(width: 8),
                  Text('排名 前2%', style: TextStyle(color: Colors.white70, fontSize: 14)),
                ],
              ),
            ],
          ),
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white24, width: 2),
            ),
            child: const Icon(Icons.trending_up, color: Colors.white, size: 24),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuList() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border.symmetric(horizontal: BorderSide(color: Color(0xFFC1C6D6))),
      ),
      child: Column(
        children: [
          _buildMenuItem(Icons.account_circle, '个人资料'),
          _buildMenuItem(Icons.chat_bubble, '消息中心', badge: '3'),
          _buildMenuItem(Icons.security, '安全设置'),
          _buildMenuItem(Icons.update, '版本更新', trailing: 'V2.4.0'),
          _buildMenuItem(Icons.rate_review, '意见反馈', isLast: true),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, {String? badge, String? trailing, bool isLast = false}) {
    return Container(
      decoration: BoxDecoration(
        border: isLast ? null : const Border(bottom: BorderSide(color: Color(0xFFF2F3FD))),
      ),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF5B5F64)),
        title: Text(title, style: const TextStyle(fontSize: 16, color: Color(0xFF191C23))),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (badge != null)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: const Color(0xFFBA1A1A),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(badge, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
              ),
            if (trailing != null)
              Text(trailing, style: const TextStyle(color: Color(0xFF005BBF), fontSize: 14, fontWeight: FontWeight.bold)),
            const SizedBox(width: 8),
            const Icon(Icons.chevron_right, color: Color(0xFF727785), size: 18),
          ],
        ),
        onTap: () {},
      ),
    );
  }

  Widget _buildLogoutButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        height: 48,
        child: OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.power_settings_new, size: 18),
          label: const Text('退出登录', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          style: OutlinedButton.styleFrom(
            foregroundColor: const Color(0xFFBA1A1A),
            side: const BorderSide(color: Color(0xFFBA1A1A)),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          ),
        ),
      ),
    );
  }
}
