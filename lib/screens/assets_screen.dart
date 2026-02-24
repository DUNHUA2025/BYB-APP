import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../data/mock_data.dart';
import '../widgets/common_widgets.dart';
import 'package:fl_chart/fl_chart.dart';

class AssetsScreen extends StatefulWidget {
  const AssetsScreen({super.key});

  @override
  State<AssetsScreen> createState() => _AssetsScreenState();
}

class _AssetsScreenState extends State<AssetsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _touchedIndex = -1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          '我的資產',
          style: GoogleFonts.playfairDisplay(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.charcoal,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.history_rounded, color: AppColors.charcoal),
            onPressed: () {},
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppColors.gold,
          unselectedLabelColor: AppColors.darkGray,
          indicatorColor: AppColors.gold,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 2,
          labelStyle: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
          tabs: const [
            Tab(text: '代幣'),
            Tab(text: 'NFT 收藏'),
            Tab(text: '收益記錄'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildTokensTab(),
          _buildNftsTab(),
          _buildEarningsTab(),
        ],
      ),
    );
  }

  Widget _buildTokensTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPortfolioSummary(),
          const SizedBox(height: 24),
          _buildDonutChart(),
          const SizedBox(height: 24),
          const SectionHeader(title: '持倉明細'),
          const SizedBox(height: 16),
          ...mockTokens.map((t) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: _buildTokenCard(t),
          )),
        ],
      ),
    );
  }

  Widget _buildPortfolioSummary() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: AppColors.darkGradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.charcoal.withValues(alpha: 0.15),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            '資產組合總值',
            style: GoogleFonts.inter(fontSize: 12, color: AppColors.mediumGray, letterSpacing: 1),
          ),
          const SizedBox(height: 8),
          Text(
            '\$12,531.73',
            style: GoogleFonts.playfairDisplay(
              fontSize: 36,
              fontWeight: FontWeight.w700,
              color: AppColors.white,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.trending_up, size: 14, color: AppColors.success),
              const SizedBox(width: 4),
              Text(
                '+\$801.42 (+6.8%) 今日',
                style: GoogleFonts.inter(
                  fontSize: 13,
                  color: AppColors.success,
                  fontWeight: FontWeight.w500,
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
              _assetStatItem('代幣', '\$8,342', '66.6%'),
              _assetStatItem('NFT', '\$3,240', '25.9%'),
              _assetStatItem('收益', '\$950', '7.5%'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _assetStatItem(String label, String value, String pct) {
    return Column(
      children: [
        Text(label, style: GoogleFonts.inter(fontSize: 11, color: AppColors.mediumGray)),
        const SizedBox(height: 4),
        Text(value, style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w700, color: AppColors.white)),
        Text(pct, style: GoogleFonts.inter(fontSize: 11, color: AppColors.goldLight)),
      ],
    );
  }

  Widget _buildDonutChart() {
    return PremiumCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const SectionHeader(title: '資產分佈'),
          const SizedBox(height: 16),
          Row(
            children: [
              SizedBox(
                width: 140,
                height: 140,
                child: PieChart(
                  PieChartData(
                    pieTouchData: PieTouchData(
                      touchCallback: (event, response) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              response == null ||
                              response.touchedSection == null) {
                            _touchedIndex = -1;
                            return;
                          }
                          _touchedIndex = response.touchedSection!.touchedSectionIndex;
                        });
                      },
                    ),
                    sections: [
                      PieChartSectionData(
                        value: 66.6,
                        color: AppColors.gold,
                        radius: _touchedIndex == 0 ? 55 : 48,
                        title: '',
                      ),
                      PieChartSectionData(
                        value: 25.9,
                        color: AppColors.charcoal,
                        radius: _touchedIndex == 1 ? 55 : 48,
                        title: '',
                      ),
                      PieChartSectionData(
                        value: 7.5,
                        color: AppColors.success,
                        radius: _touchedIndex == 2 ? 55 : 48,
                        title: '',
                      ),
                    ],
                    sectionsSpace: 3,
                    centerSpaceRadius: 32,
                  ),
                ),
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  children: [
                    _legend(AppColors.gold, '代幣持倉', '66.6%'),
                    const SizedBox(height: 12),
                    _legend(AppColors.charcoal, 'NFT 資產', '25.9%'),
                    const SizedBox(height: 12),
                    _legend(AppColors.success, '收益收入', '7.5%'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _legend(Color color, String label, String value) {
    return Row(
      children: [
        Container(width: 10, height: 10, decoration: BoxDecoration(color: color, shape: BoxShape.circle)),
        const SizedBox(width: 8),
        Expanded(
          child: Text(label, style: GoogleFonts.inter(fontSize: 13, color: AppColors.darkGray)),
        ),
        Text(value, style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w700, color: AppColors.charcoal)),
      ],
    );
  }

  Widget _buildTokenCard(TokenAsset token) {
    return PremiumCard(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              gradient: AppColors.goldGradient,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                token.symbol[0],
                style: GoogleFonts.playfairDisplay(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(token.symbol, style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w700, color: AppColors.charcoal)),
                Text(token.name, style: GoogleFonts.inter(fontSize: 12, color: AppColors.darkGray)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '\$${token.valueUsd.toStringAsFixed(2)}',
                style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w700, color: AppColors.charcoal),
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${token.balance.toStringAsFixed(0)} ${token.symbol}',
                    style: GoogleFonts.inter(fontSize: 11, color: AppColors.darkGray),
                  ),
                  const SizedBox(width: 8),
                  ChangeBadge(value: token.change24h),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNftsTab() {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.80,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: 3,
      itemBuilder: (context, index) {
        final nft = mockNfts[index];
        return Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.lightGray),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(
                  nft.imageUrl,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(height: 150, color: AppColors.lightGray),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(nft.title, style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w600), maxLines: 1, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: 4),
                    Text('${nft.price} BYB', style: GoogleFonts.inter(fontSize: 12, color: AppColors.gold, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(color: AppColors.goldLight, borderRadius: BorderRadius.circular(6)),
                      child: Text('已持有', style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w600, color: AppColors.goldDark)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEarningsTab() {
    final records = [
      {'type': 'NFT 出售', 'amount': '+0.8 BYB', 'date': '今天 14:23', 'positive': true},
      {'type': 'Staking 收益', 'amount': '+12.5 BYB', 'date': '今天 00:00', 'positive': true},
      {'type': '購買 NFT', 'amount': '-2.5 BYB', 'date': '昨天 18:40', 'positive': false},
      {'type': 'DAO 投票獎勵', 'amount': '+5.0 BYB', 'date': '昨天 10:00', 'positive': true},
      {'type': '充值', 'amount': '+100 BYB', 'date': '3天前 09:12', 'positive': true},
      {'type': 'IP 孵化收益', 'amount': '+28.3 BYB', 'date': '一週前', 'positive': true},
    ];
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemCount: records.length,
      separatorBuilder: (_, __) => const Divider(height: 1),
      itemBuilder: (context, index) {
        final r = records[index];
        final isPositive = r['positive'] as bool;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: isPositive ? AppColors.successLight : AppColors.errorLight,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isPositive ? Icons.arrow_downward_rounded : Icons.arrow_upward_rounded,
                  color: isPositive ? AppColors.success : AppColors.error,
                  size: 20,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(r['type'] as String, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.charcoal)),
                    Text(r['date'] as String, style: GoogleFonts.inter(fontSize: 12, color: AppColors.darkGray)),
                  ],
                ),
              ),
              Text(
                r['amount'] as String,
                style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: isPositive ? AppColors.success : AppColors.error,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
