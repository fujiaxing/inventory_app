import 'package:flutter/material.dart';

class InboundScanScreen extends StatelessWidget {
  const InboundScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9FF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8FAFC),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF64748B)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          '入库确认',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF0F172A)),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline, color: Color(0xFF1A73E8)),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Divider(height: 1, color: Colors.grey.withOpacity(0.1)),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            _buildScannerArea(),
            const SizedBox(height: 24),
            _buildProgressSummary(),
            const SizedBox(height: 16),
            _buildScannedItemsList(),
            const SizedBox(height: 100),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomActions(context),
    );
  }

  Widget _buildScannerArea() {
    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFFC1C6D6), width: 2),
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://lh3.googleusercontent.com/aida-public/AB6AXuCSsUj_M9Y_xiUMO52ODu6Q1ixNRL1cqbj9bU58VT_KyaN7qbnCSEvnnYkFH5fNuopkKSm71dxHtOcpNhYPFIHnXEiYCxP8eYSq1ccgpUueUVYqhie51S11c3C8hottuo4WJuMAQMDKadEorsmc6P1SzSJOwykJd-5knJpANAj3BZWo0jJQp3R8MuWC0u1kRfEDXnMUw_vEnBFvWq-rN5bJV-WBshQUyivdyAL6j46ozmMs4gVJ5uJwI7QMtKvM6-AjAc2xVzLFEGk',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  opacity: const AlwaysStoppedAnimation(0.6),
                ),
              ),
              // Scan line animation placeholder
              Container(
                width: double.infinity,
                height: 2,
                decoration: BoxDecoration(
                  color: const Color(0xFF1A73E8),
                  boxShadow: [
                    BoxShadow(color: const Color(0xFF1A73E8).withOpacity(0.5), blurRadius: 10, spreadRadius: 2),
                  ],
                ),
              ),
              // Target Reticle
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white24, width: 2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Stack(
                  children: [
                    _buildReticleCorner(top: true, left: true),
                    _buildReticleCorner(top: true, right: true),
                    _buildReticleCorner(bottom: true, left: true),
                    _buildReticleCorner(bottom: true, right: true),
                  ],
                ),
              ),
              // Controls
              Positioned(
                bottom: 12,
                child: Row(
                  children: [
                    _buildScannerControlButton(Icons.flashlight_on),
                    const SizedBox(width: 24),
                    _buildScannerControlButton(Icons.photo_library),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        const Center(
          child: Text(
            '请将条码/二维码放入框内',
            style: TextStyle(fontSize: 12, color: Color(0xFF5B5F64)),
          ),
        ),
      ],
    );
  }

  Widget _buildReticleCorner({bool top = false, bool bottom = false, bool left = false, bool right = false}) {
    return Positioned(
      top: top ? -2 : null,
      bottom: bottom ? -2 : null,
      left: left ? -2 : null,
      right: right ? -2 : null,
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          border: Border(
            top: top ? const BorderSide(color: Color(0xFF1A73E8), width: 4) : BorderSide.none,
            bottom: bottom ? const BorderSide(color: Color(0xFF1A73E8), width: 4) : BorderSide.none,
            left: left ? const BorderSide(color: Color(0xFF1A73E8), width: 4) : BorderSide.none,
            right: right ? const BorderSide(color: Color(0xFF1A73E8), width: 4) : BorderSide.none,
          ),
        ),
      ),
    );
  }

  Widget _buildScannerControlButton(IconData icon) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: Colors.white, size: 20),
    );
  }

  Widget _buildProgressSummary() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              '已扫描物品',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFF191C23)),
            ),
            Text(
              '入库批次: IN20231024001',
              style: TextStyle(fontSize: 14, color: Color(0xFF5B5F64)),
            ),
          ],
        ),
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: '3',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Color(0xFF005BBF)),
              ),
              TextSpan(
                text: ' / 12',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xFFC1C6D6)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildScannedItemsList() {
    return Column(
      children: [
        _buildScannedItemCard(
          title: '高性能锂电池组件',
          spec: '规格: 5000mAh / 48V',
          location: 'A-02-12-C',
          count: '50',
          total: '50',
          status: '已完成',
          statusColor: Colors.green,
          statusBg: Colors.green.shade50,
          icon: Icons.inventory_2,
        ),
        const SizedBox(height: 12),
        _buildScannedItemCard(
          title: '控制主板模组',
          spec: '规格: V3.2 企业版',
          location: 'B-05-01-A',
          count: '12',
          total: '30',
          status: '拣选中',
          statusColor: Colors.blue,
          statusBg: Colors.blue.shade50,
          icon: Icons.settings_input_component,
          progress: 0.4,
        ),
        const SizedBox(height: 12),
        _buildScannedItemCard(
          title: '密封胶条(卷)',
          spec: '规格: 10m/卷 黑色',
          location: 'C-01-08-E',
          count: '0',
          total: '100',
          status: '异常',
          statusColor: const Color(0xFFBA1A1A),
          statusBg: const Color(0xFFFFDAD6),
          icon: Icons.warning,
          isError: true,
        ),
      ],
    );
  }

  Widget _buildScannedItemCard({
    required String title,
    required String spec,
    required String location,
    required String count,
    required String total,
    required String status,
    required Color statusColor,
    required Color statusBg,
    required IconData icon,
    double? progress,
    bool isError = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isError ? const Color(0xFFBA1A1A).withOpacity(0.2) : const Color(0xFFC1C6D6).withOpacity(0.5)),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 2)),
        ],
      ),
      child: Column(
        children: [
          if (progress != null)
            LinearProgressIndicator(
              value: progress,
              minHeight: 4,
              backgroundColor: Colors.transparent,
              valueColor: const AlwaysStoppedAnimation(Color(0xFF005BBF)),
            ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: isError ? const Color(0xFFFFDAD6) : const Color(0xFFF2F3FD),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(icon, color: isError ? const Color(0xFFBA1A1A) : const Color(0xFF005BBF)),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              title,
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF191C23)),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: statusBg,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              status,
                              style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: statusColor),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(spec, style: const TextStyle(fontSize: 12, color: Color(0xFF5B5F64))),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.location_on, size: 14, color: Color(0xFF727785)),
                              const SizedBox(width: 4),
                              Text(location, style: const TextStyle(fontSize: 12, color: Color(0xFF414754), fontFamily: 'monospace')),
                            ],
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: count,
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: isError ? const Color(0xFFBA1A1A) : const Color(0xFF005BBF)),
                                ),
                                TextSpan(
                                  text: ' / $total',
                                  style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF5B5F64)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomActions(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Color(0xFFECEDF7))),
      ),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.edit_square, size: 18),
              label: const Text('手动输入'),
              style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(48),
                foregroundColor: const Color(0xFF191C23),
                side: const BorderSide(color: Color(0xFF727785)),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 2,
            child: ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF005BBF),
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(48),
                elevation: 4,
                shadowColor: const Color(0xFF005BBF).withOpacity(0.3),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('完成入库 (3/12)', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
