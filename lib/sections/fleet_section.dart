import 'package:flutter/material.dart';
import 'package:roadygo_website/theme.dart';
import 'package:roadygo_website/components/glass_panel.dart';

/// Elite Fleet horizontal scrolling section
class FleetSection extends StatelessWidget {
  const FleetSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= Breakpoints.desktop;

    return Container(
      color: AppColors.backgroundDark,
      padding: const EdgeInsets.only(top: 64, bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          ContentContainer(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ELITE FLEET',
                      style: context.textStyles.headlineMedium?.copyWith(
                        letterSpacing: -0.5,
                        fontSize: isDesktop ? 32 : 24,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'SPECIALIZED RESPONSE UNITS',
                      style: context.textStyles.labelSmall?.copyWith(
                        color: AppColors.textMuted,
                        letterSpacing: 3,
                      ),
                    ),
                  ],
                ),
                // Dots indicator
                Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: AppColors.primaryGlow,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: AppColors.white10,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: AppColors.white10,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          // Fleet cards - Grid on desktop, horizontal scroll on mobile
          isDesktop
              ? ContentContainer(
                  child: Row(
                    children: const [
                      Expanded(
                        child: FleetCard(
                          title: 'Cyber-Response Unit',
                          description: 'Precision extraction for luxury EVs & motorcycles.',
                          badgeText: 'LIGHT DUTY',
                          badgeColor: AppColors.accent,
                          icon: Icons.local_shipping,
                          stat1Label: 'Max Lift',
                          stat1Value: '4,000 LBS',
                          stat2Label: 'Response',
                          stat2Value: 'ULTRA-FAST',
                        ),
                      ),
                      SizedBox(width: 24),
                      Expanded(
                        child: FleetCard(
                          title: 'Titan Hauler X2',
                          description: 'Multi-purpose recovery for SUVs and 4x4 vehicles.',
                          badgeText: 'BEST SELLER',
                          badgeColor: AppColors.primary,
                          icon: Icons.airport_shuttle,
                          stat1Label: 'Capacity',
                          stat1Value: '15,000 LBS',
                          stat2Label: 'Suspension',
                          stat2Value: 'MAGNETIC',
                          isFeatured: true,
                        ),
                      ),
                      SizedBox(width: 24),
                      Expanded(
                        child: FleetCard(
                          title: 'Mammoth 5000',
                          description: 'Commercial-grade extraction for rigs & buses.',
                          badgeText: 'HEAVY DUTY',
                          badgeColor: AppColors.accent,
                          icon: Icons.rv_hookup,
                          stat1Label: 'Payload',
                          stat1Value: '60,000 LBS',
                          stat2Label: 'Boom',
                          stat2Value: '360 ROTATE',
                        ),
                      ),
                    ],
                  ),
                )
              : SizedBox(
                  height: 380,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(
                      horizontal: ResponsiveLayout.contentPadding(context),
                    ),
                    children: const [
                      SizedBox(
                        width: 300,
                        child: FleetCard(
                          title: 'Cyber-Response Unit',
                          description: 'Precision extraction for luxury EVs & motorcycles.',
                          badgeText: 'LIGHT DUTY',
                          badgeColor: AppColors.accent,
                          icon: Icons.local_shipping,
                          stat1Label: 'Max Lift',
                          stat1Value: '4,000 LBS',
                          stat2Label: 'Response',
                          stat2Value: 'ULTRA-FAST',
                        ),
                      ),
                      SizedBox(width: 24),
                      SizedBox(
                        width: 300,
                        child: FleetCard(
                          title: 'Titan Hauler X2',
                          description: 'Multi-purpose recovery for SUVs and 4x4 vehicles.',
                          badgeText: 'BEST SELLER',
                          badgeColor: AppColors.primary,
                          icon: Icons.airport_shuttle,
                          stat1Label: 'Capacity',
                          stat1Value: '15,000 LBS',
                          stat2Label: 'Suspension',
                          stat2Value: 'MAGNETIC',
                          isFeatured: true,
                        ),
                      ),
                      SizedBox(width: 24),
                      SizedBox(
                        width: 300,
                        child: FleetCard(
                          title: 'Mammoth 5000',
                          description: 'Commercial-grade extraction for rigs & buses.',
                          badgeText: 'HEAVY DUTY',
                          badgeColor: AppColors.accent,
                          icon: Icons.rv_hookup,
                          stat1Label: 'Payload',
                          stat1Value: '60,000 LBS',
                          stat2Label: 'Boom',
                          stat2Value: '360 ROTATE',
                        ),
                      ),
                      SizedBox(width: 24),
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}

class FleetCard extends StatelessWidget {
  final String title;
  final String description;
  final String badgeText;
  final Color badgeColor;
  final IconData icon;
  final String stat1Label;
  final String stat1Value;
  final String stat2Label;
  final String stat2Value;
  final bool isFeatured;

  const FleetCard({
    super.key,
    required this.title,
    required this.description,
    required this.badgeText,
    required this.badgeColor,
    required this.icon,
    required this.stat1Label,
    required this.stat1Value,
    required this.stat2Label,
    required this.stat2Value,
    this.isFeatured = false,
  });

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      borderColor: isFeatured ? AppColors.primary.withOpacity(0.3) : null,
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image placeholder
          Container(
            height: 180,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF1E293B), Colors.black],
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Stack(
              children: [
                Center(
                  child: Icon(
                    icon,
                    size: 72,
                    color: Colors.white.withOpacity(0.1),
                  ),
                ),
                // Badge
                Positioned(
                  top: 16,
                  left: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: isFeatured
                          ? badgeColor.withOpacity(0.2)
                          : Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: badgeColor.withOpacity(isFeatured ? 0.3 : 0.2),
                      ),
                    ),
                    child: Text(
                      badgeText,
                      style: context.textStyles.labelSmall?.copyWith(
                        color: badgeColor,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          // Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.textStyles.titleLarge,
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: context.textStyles.bodySmall?.copyWith(
                    color: AppColors.textMuted,
                  ),
                ),
                const SizedBox(height: 16),
                // Stats
                Row(
                  children: [
                    Expanded(child: _StatBox(label: stat1Label, value: stat1Value)),
                    const SizedBox(width: 12),
                    Expanded(child: _StatBox(label: stat2Label, value: stat2Value)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatBox extends StatelessWidget {
  final String label;
  final String value;

  const _StatBox({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.white05,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.white05),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: context.textStyles.labelSmall?.copyWith(
              color: AppColors.textMuted,
              fontSize: 9,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: context.textStyles.bodySmall?.copyWith(
              color: AppColors.textSecondary,
              fontFamily: 'monospace',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
