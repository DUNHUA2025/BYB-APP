import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../data/mock_data.dart';
import '../widgets/common_widgets.dart';

class IncubatorScreen extends StatefulWidget {
  const IncubatorScreen({super.key});

  @override
  State<IncubatorScreen> createState() => _IncubatorScreenState();
}

class _IncubatorScreenState extends State<IncubatorScreen> {
  String _selectedStage = '全部';
  final List<String> _stages = ['全部', '早期融資', '孵化中', '已達標', '上市'];

  List<IpProject> get _filtered {
    if (_selectedStage == '全部') return mockIpProjects;
    return mockIpProjects.where((p) => p.stage == _selectedStage).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          'IP 孵化',
          style: GoogleFonts.playfairDisplay(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.charcoal,
          ),
        ),
        centerTitle: false,
        actions: [
          TextButton.icon(
            icon: const Icon(Icons.rocket_launch_outlined, size: 16),
            label: const Text('申請上鏈'),
            style: TextButton.styleFrom(foregroundColor: AppColors.gold),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: AppColors.white,
            child: Column(
              children: [
                _buildIncubatorHeader(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: SizedBox(
                    height: 36,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: _stages.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 8),
                      itemBuilder: (context, i) => CategoryChip(
                        label: _stages[i],
                        selected: _selectedStage == _stages[i],
                        onTap: () => setState(() => _selectedStage = _stages[i]),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: _filtered.isEmpty
                ? const EmptyState(
                    icon: Icons.rocket_launch_outlined,
                    title: '暫無項目',
                    subtitle: '此階段暫無 IP 孵化項目',
                  )
                : ListView.separated(
                    padding: const EdgeInsets.all(20),
                    itemCount: _filtered.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 16),
                    itemBuilder: (context, i) => _buildIpCard(_filtered[i]),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildIncubatorHeader() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppColors.darkGradient,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  gradient: AppColors.goldGradient,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.rocket_launch_rounded, color: Colors.white, size: 22),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '文化 IP 孵化平台',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                    ),
                    Text(
                      '真實資產上鏈 · 全球化流通',
                      style: GoogleFonts.inter(fontSize: 11, color: AppColors.mediumGray),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const GoldDivider(),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _headerStat('孵化項目', '28'),
              _headerStat('總融資額', '\$12.4M'),
              _headerStat('支持者', '6,840'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _headerStat(String label, String value) {
    return Column(
      children: [
        Text(value, style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.white)),
        Text(label, style: GoogleFonts.inter(fontSize: 11, color: AppColors.mediumGray)),
      ],
    );
  }

  Widget _buildIpCard(IpProject project) {
    final isCompleted = project.daysLeft == 0;
    return PremiumCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(
                  project.imageUrl,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    height: 180,
                    decoration: const BoxDecoration(
                      color: AppColors.lightGray,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                    ),
                    child: const Center(child: Icon(Icons.movie_creation_outlined, color: AppColors.mediumGray, size: 48)),
                  ),
                ),
              ),
              Positioned(
                top: 12,
                left: 12,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.charcoal.withValues(alpha: 0.85),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        project.category,
                        style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w500, color: AppColors.white),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        gradient: isCompleted ? null : AppColors.goldGradient,
                        color: isCompleted ? AppColors.success : null,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        project.stage,
                        style: GoogleFonts.inter(fontSize: 11, fontWeight: FontWeight.w700, color: AppColors.white),
                      ),
                    ),
                  ],
                ),
              ),
              if (!isCompleted)
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: AppColors.charcoal.withValues(alpha: 0.8),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.access_time_rounded, size: 12, color: AppColors.goldLight),
                        const SizedBox(width: 4),
                        Text(
                          '${project.daysLeft}天',
                          style: GoogleFonts.inter(fontSize: 11, color: AppColors.goldLight, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.name,
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.charcoal,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  project.description,
                  style: GoogleFonts.inter(fontSize: 13, color: AppColors.darkGray, height: 1.5),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('已融資', style: GoogleFonts.inter(fontSize: 11, color: AppColors.darkGray)),
                        Text(
                          '\$${(project.fundingRaised / 1000).toStringAsFixed(0)}K',
                          style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.gold),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('目標', style: GoogleFonts.inter(fontSize: 11, color: AppColors.darkGray)),
                        Text(
                          '\$${(project.fundingGoal / 1000).toStringAsFixed(0)}K',
                          style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.charcoal),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: LinearProgressIndicator(
                    value: project.fundingProgress.clamp(0.0, 1.0),
                    backgroundColor: AppColors.lightGray,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      isCompleted ? AppColors.success : AppColors.gold,
                    ),
                    minHeight: 8,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${(project.fundingProgress * 100).clamp(0, 100).toStringAsFixed(0)}% 達成',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: isCompleted ? AppColors.success : AppColors.gold,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.people_outline_rounded, size: 14, color: AppColors.darkGray),
                        const SizedBox(width: 4),
                        Text(
                          '${project.backers} 支持者',
                          style: GoogleFonts.inter(fontSize: 12, color: AppColors.darkGray),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                GoldButton(
                  text: isCompleted ? '查看詳情' : '立即支持',
                  width: double.infinity,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
