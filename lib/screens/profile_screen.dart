import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../widgets/common_widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: CustomScrollView(
        slivers: [
          _buildHeader(context),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                const SizedBox(height: 20),
                _buildVerificationCard(context),
                const SizedBox(height: 20),
                _buildWalletCard(context),
                const SizedBox(height: 24),
                _buildMenuSection(context, '帳戶設置', [
                  _MenuItem(Icons.person_outline_rounded, '個人資料', '查看並編輯個人資訊'),
                  _MenuItem(Icons.security_rounded, '安全設置', '密碼、2FA 認證'),
                  _MenuItem(Icons.language_rounded, '語言與地區', '繁體中文 · 香港'),
                ]),
                const SizedBox(height: 16),
                _buildMenuSection(context, '平台功能', [
                  _MenuItem(Icons.receipt_long_rounded, '交易記錄', '查看所有交易歷史'),
                  _MenuItem(Icons.card_giftcard_rounded, '邀請好友', '推薦獎勵計劃'),
                  _MenuItem(Icons.how_to_vote_outlined, '治理記錄', '我的投票歷史'),
                ]),
                const SizedBox(height: 16),
                _buildMenuSection(context, '幫助與支持', [
                  _MenuItem(Icons.help_outline_rounded, '幫助中心', 'FAQ 與使用指南'),
                  _MenuItem(Icons.chat_bubble_outline_rounded, '聯繫客服', '24/7 在線支持'),
                  _MenuItem(Icons.description_outlined, '服務條款', '用戶協議 · 隱私政策'),
                ]),
                const SizedBox(height: 24),
                _buildLogoutButton(context),
                const SizedBox(height: 40),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: AppColors.white,
        padding: const EdgeInsets.fromLTRB(20, 60, 20, 24),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 88,
                  height: 88,
                  decoration: BoxDecoration(
                    gradient: AppColors.goldGradient,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.gold.withValues(alpha: 0.3),
                        blurRadius: 20,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'W',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 36,
                        fontWeight: FontWeight.w700,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: AppColors.success,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.white, width: 2),
                    ),
                    child: const Icon(Icons.check, size: 14, color: AppColors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'Wang Wei',
              style: GoogleFonts.playfairDisplay(
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: AppColors.charcoal,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '@wangwei · BYB2025',
              style: GoogleFonts.inter(fontSize: 13, color: AppColors.darkGray),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  decoration: BoxDecoration(
                    gradient: AppColors.goldGradient,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.star_rounded, size: 14, color: AppColors.white),
                      const SizedBox(width: 4),
                      Text(
                        'Gold 會員',
                        style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  decoration: BoxDecoration(
                    color: AppColors.lightGray,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'UID: BYB-28472',
                    style: GoogleFonts.inter(fontSize: 12, color: AppColors.charcoal),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _profileStat('持有 NFT', '3'),
                Container(width: 1, height: 40, color: AppColors.lightGray),
                _profileStat('代幣持倉', '4 種'),
                Container(width: 1, height: 40, color: AppColors.lightGray),
                _profileStat('參與提案', '12'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileStat(String label, String value) {
    return Column(
      children: [
        Text(value, style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.charcoal)),
        Text(label, style: GoogleFonts.inter(fontSize: 11, color: AppColors.darkGray)),
      ],
    );
  }

  Widget _buildVerificationCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: AppColors.goldGradient,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.gold.withValues(alpha: 0.25),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.verified_rounded, color: AppColors.white, size: 28),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'KYC 已完成驗證',
                  style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.white),
                ),
                Text(
                  '您的帳號已通過身份認證，可享受全部功能',
                  style: GoogleFonts.inter(fontSize: 11, color: AppColors.white.withValues(alpha: 0.85)),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right_rounded, color: AppColors.white),
        ],
      ),
    );
  }

  Widget _buildWalletCard(BuildContext context) {
    return PremiumCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('連接的錢包', style: Theme.of(context).textTheme.titleLarge),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.successLight,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(color: AppColors.success, shape: BoxShape.circle),
                    ),
                    const SizedBox(width: 4),
                    Text('已連接', style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.success)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.lightGray,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Icon(Icons.account_balance_wallet_outlined, size: 20, color: AppColors.gold),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('MetaMask', style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600)),
                      Text(
                        '0x7f4...2c9a',
                        style: GoogleFonts.inter(fontSize: 12, color: AppColors.darkGray),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.copy_outlined, size: 18, color: AppColors.darkGray),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuSection(BuildContext context, String title, List<_MenuItem> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4, bottom: 12),
          child: Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.darkGray,
              letterSpacing: 1,
            ),
          ),
        ),
        PremiumCard(
          padding: EdgeInsets.zero,
          child: Column(
            children: items.asMap().entries.map((entry) {
              final i = entry.key;
              final item = entry.value;
              return Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    leading: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: AppColors.lightGray,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(item.icon, size: 18, color: AppColors.charcoal),
                    ),
                    title: Text(item.label, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.charcoal)),
                    subtitle: Text(item.subtitle, style: GoogleFonts.inter(fontSize: 12, color: AppColors.darkGray)),
                    trailing: const Icon(Icons.chevron_right_rounded, color: AppColors.mediumGray),
                    onTap: () {},
                  ),
                  if (i < items.length - 1)
                    const Divider(height: 1, indent: 68),
                ],
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildLogoutButton(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        height: 52,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.error.withValues(alpha: 0.3)),
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.logout_rounded, color: AppColors.error, size: 18),
            const SizedBox(width: 8),
            Text(
              '退出登錄',
              style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.error),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuItem {
  final IconData icon;
  final String label;
  final String subtitle;
  const _MenuItem(this.icon, this.label, this.subtitle);
}
