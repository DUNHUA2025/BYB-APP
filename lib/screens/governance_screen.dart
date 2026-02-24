import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/app_theme.dart';
import '../data/mock_data.dart';
import '../widgets/common_widgets.dart';

class GovernanceScreen extends StatefulWidget {
  const GovernanceScreen({super.key});

  @override
  State<GovernanceScreen> createState() => _GovernanceScreenState();
}

class _GovernanceScreenState extends State<GovernanceScreen> {
  final Map<String, bool?> _votes = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: Text(
          'DAO 治理',
          style: GoogleFonts.playfairDisplay(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.charcoal,
          ),
        ),
        centerTitle: false,
        actions: [
          TextButton.icon(
            icon: const Icon(Icons.add_circle_outline_rounded, size: 18),
            label: const Text('發起提案'),
            style: TextButton.styleFrom(foregroundColor: AppColors.gold),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildGovernanceStats(),
            const SizedBox(height: 28),
            const SectionHeader(title: '進行中的提案'),
            const SizedBox(height: 16),
            ...mockProposals.where((p) => p.status == 'active').map((p) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _buildProposalCard(p),
            )),
            const SizedBox(height: 12),
            const SectionHeader(title: '已完成提案'),
            const SizedBox(height: 16),
            ...mockProposals.where((p) => p.status != 'active').map((p) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _buildProposalCard(p),
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildGovernanceStats() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppColors.darkGradient,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('我的治理票權', style: GoogleFonts.inter(fontSize: 11, color: AppColors.mediumGray, letterSpacing: 0.5)),
                  const SizedBox(height: 4),
                  Text(
                    '9,000 DAO',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                  gradient: AppColors.goldGradient,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Text('投票排名', style: GoogleFonts.inter(fontSize: 10, color: AppColors.white.withValues(alpha: 0.8))),
                    Text(
                      '#284',
                      style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.white),
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
              _govStat('參與提案', '12'),
              _govStat('投票次數', '28'),
              _govStat('已通過', '9'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _govStat(String label, String value) {
    return Column(
      children: [
        Text(value, style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.white)),
        Text(label, style: GoogleFonts.inter(fontSize: 11, color: AppColors.mediumGray)),
      ],
    );
  }

  Widget _buildProposalCard(DaoProposal proposal) {
    final userVote = _votes[proposal.id];
    final isActive = proposal.status == 'active';

    return PremiumCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: isActive ? AppColors.successLight : AppColors.lightGray,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  proposal.category,
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: isActive ? AppColors.success : AppColors.darkGray,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: isActive
                      ? AppColors.goldLight
                      : proposal.status == 'passed'
                          ? AppColors.successLight
                          : AppColors.errorLight,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  isActive
                      ? '進行中'
                      : proposal.status == 'passed'
                          ? '已通過'
                          : '已否決',
                  style: GoogleFonts.inter(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: isActive
                        ? AppColors.goldDark
                        : proposal.status == 'passed'
                            ? AppColors.success
                            : AppColors.error,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            proposal.title,
            style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w700, color: AppColors.charcoal),
          ),
          const SizedBox(height: 8),
          Text(
            proposal.description,
            style: GoogleFonts.inter(fontSize: 12, color: AppColors.darkGray, height: 1.5),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 16),
          _buildVoteBar(proposal),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(Icons.how_to_vote_outlined, size: 14, color: AppColors.darkGray),
                  const SizedBox(width: 4),
                  Text(
                    '${(proposal.votesFor + proposal.votesAgainst).toString()} 票',
                    style: GoogleFonts.inter(fontSize: 12, color: AppColors.darkGray),
                  ),
                ],
              ),
              if (isActive)
                Row(
                  children: [
                    const Icon(Icons.access_time_rounded, size: 14, color: AppColors.darkGray),
                    const SizedBox(width: 4),
                    Text(
                      '剩餘 ${proposal.endDate.difference(DateTime.now()).inDays} 天',
                      style: GoogleFonts.inter(fontSize: 12, color: AppColors.darkGray),
                    ),
                  ],
                ),
            ],
          ),
          if (isActive) ...[
            const SizedBox(height: 16),
            if (userVote == null)
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _castVote(proposal.id, true),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          gradient: AppColors.goldGradient,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '贊成',
                          style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _castVote(proposal.id, false),
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppColors.lightGray,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.mediumGray),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '反對',
                          style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.charcoal),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            else
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: (userVote == true) ? AppColors.successLight : AppColors.errorLight,
                  borderRadius: BorderRadius.circular(10),
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      (userVote == true) ? Icons.check_circle_outline : Icons.cancel_outlined,
                      size: 16,
                      color: (userVote == true) ? AppColors.success : AppColors.error,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      (userVote == true) ? '您已投票：贊成' : '您已投票：反對',
                      style: GoogleFonts.inter(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: (userVote == true) ? AppColors.success : AppColors.error,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ],
      ),
    );
  }

  Widget _buildVoteBar(DaoProposal proposal) {
    final forPct = proposal.approvalRate;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '贊成 ${(forPct * 100).toStringAsFixed(1)}%',
              style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.success),
            ),
            Text(
              '反對 ${((1 - forPct) * 100).toStringAsFixed(1)}%',
              style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.error),
            ),
          ],
        ),
        const SizedBox(height: 6),
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: Row(
            children: [
              Expanded(
                flex: (forPct * 100).round(),
                child: Container(height: 8, color: AppColors.success),
              ),
              Expanded(
                flex: ((1 - forPct) * 100).round(),
                child: Container(height: 8, color: AppColors.error.withValues(alpha: 0.3)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _castVote(String proposalId, bool inFavor) {
    setState(() {
      _votes[proposalId] = inFavor;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(inFavor ? '您已成功投票：贊成' : '您已成功投票：反對'),
        backgroundColor: inFavor ? AppColors.success : AppColors.error,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
