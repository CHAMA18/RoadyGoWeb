import 'package:flutter/material.dart';
import 'package:roadygo_website/theme.dart';
import 'package:roadygo_website/components/glass_panel.dart';

/// Safety Standards section
class SafetySection extends StatelessWidget {
  const SafetySection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= Breakpoints.desktop;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isDesktop ? 100 : 80,
        horizontal: ResponsiveLayout.contentPadding(context),
      ),
      decoration: BoxDecoration(
        color: AppColors.backgroundDark,
        border: const Border(
          top: BorderSide(color: AppColors.white05),
        ),
      ),
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: Breakpoints.maxContentWidth),
          child: Column(
            children: [
              // Header
              Text(
                'SAFETY STANDARDS',
                style: context.textStyles.headlineMedium?.copyWith(
                  letterSpacing: -0.5,
                  fontSize: isDesktop ? 32 : 24,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'ZERO-COMPROMISE PROTECTION',
                style: context.textStyles.labelSmall?.copyWith(
                  color: AppColors.textMuted,
                  letterSpacing: 3,
                ),
              ),
              SizedBox(height: isDesktop ? 64 : 48),
              // Certification badges
              isDesktop
                  ? Row(
                      children: [
                        Expanded(
                          child: _CertificationCard(
                            icon: Icons.verified,
                            iconColor: AppColors.accent,
                            title: 'ISO 9001',
                            subtitle: 'Certified Quality Mgmt',
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: _CertificationCard(
                            icon: Icons.security,
                            iconColor: AppColors.primary,
                            title: '\$5M LIABILITY',
                            subtitle: 'Premium Coverage',
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          flex: 2,
                          child: _VettedProfessionalsCard(),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: _CertificationCard(
                                icon: Icons.verified,
                                iconColor: AppColors.accent,
                                title: 'ISO 9001',
                                subtitle: 'Certified Quality Mgmt',
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: _CertificationCard(
                                icon: Icons.security,
                                iconColor: AppColors.primary,
                                title: '\$5M LIABILITY',
                                subtitle: 'Premium Coverage',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        _VettedProfessionalsCard(),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CertificationCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;

  const _CertificationCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      borderRadius: AppRadius.xl,
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.white05,
              borderRadius: BorderRadius.circular(28),
              border: Border.all(color: AppColors.white10),
            ),
            child: Icon(icon, color: iconColor, size: 28),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: context.textStyles.labelSmall?.copyWith(
              color: Colors.white,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: context.textStyles.labelSmall?.copyWith(
              color: AppColors.textMuted,
              letterSpacing: 0,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class _VettedProfessionalsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      borderRadius: AppRadius.xl,
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: AppColors.white05,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.gpp_good,
              color: AppColors.emerald,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Vetted Professionals',
                  style: context.textStyles.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  'Every driver undergoes rigorous background checks and 50+ hours of technical training.',
                  style: context.textStyles.bodySmall?.copyWith(
                    color: AppColors.textMuted,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
