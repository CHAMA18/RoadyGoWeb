import 'package:flutter/material.dart';
import 'package:roadygo_website/theme.dart';
import 'package:roadygo_website/components/glass_panel.dart';

/// Roady OS AI Features section
class RoadyOSSection extends StatelessWidget {
  const RoadyOSSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= Breakpoints.desktop;
    final isTablet = screenWidth >= Breakpoints.tablet;

    return Container(
      color: AppColors.backgroundDark,
      padding: EdgeInsets.symmetric(
        vertical: isDesktop ? 100 : 80,
        horizontal: ResponsiveLayout.contentPadding(context),
      ),
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: Breakpoints.maxContentWidth),
          child: Stack(
            children: [
              // Glow effect
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 256,
                  height: 256,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(128),
                  ),
                ),
              ),
              Column(
                children: [
                  // Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/images/RoadyGo.jpeg',
                              height: isDesktop ? 60 : 48,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'PROPRIETARY AI DISPATCHING',
                            style: context.textStyles.labelSmall?.copyWith(
                              color: AppColors.textMuted,
                              letterSpacing: 3,
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.memory,
                        color: AppColors.primary.withOpacity(0.5),
                        size: isDesktop ? 56 : 40,
                      ),
                    ],
                  ),
                  SizedBox(height: isDesktop ? 56 : 40),
                  // Content layout
                  isDesktop
                      ? _DesktopLayout()
                      : _MobileLayout(isTablet: isTablet),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DesktopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Main card
        Expanded(
          flex: 2,
          child: _PredictiveDeploymentCard(),
        ),
        const SizedBox(width: 24),
        // Feature grid
        Expanded(
          child: Column(
            children: [
              _FeatureSquare(
                icon: Icons.map,
                iconColor: AppColors.accent,
                title: 'Dynamic Routing',
                description:
                    'Sub-second path recalculation based on real-world traffic telemetry.',
              ),
              const SizedBox(height: 16),
              _FeatureSquare(
                icon: Icons.shield,
                iconColor: AppColors.emerald,
                title: 'Smart Verification',
                description:
                    'Biometric driver check-ins and live dashcam monitoring for 100% safety.',
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MobileLayout extends StatelessWidget {
  final bool isTablet;

  const _MobileLayout({this.isTablet = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Main card
        _PredictiveDeploymentCard(),
        const SizedBox(height: 16),
        // Feature grid
        Row(
          children: [
            Expanded(
              child: _FeatureSquare(
                icon: Icons.map,
                iconColor: AppColors.accent,
                title: 'Dynamic Routing',
                description:
                    'Sub-second path recalculation based on real-world traffic telemetry.',
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _FeatureSquare(
                icon: Icons.shield,
                iconColor: AppColors.emerald,
                title: 'Smart Verification',
                description:
                    'Biometric driver check-ins and live dashcam monitoring for 100% safety.',
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _PredictiveDeploymentCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      borderColor: AppColors.primary.withOpacity(0.2),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.primary.withOpacity(0.2),
                  ),
                ),
                child: const Icon(
                  Icons.analytics,
                  color: AppColors.primary,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Text(
                'Predictive Deployment',
                style: context.textStyles.titleLarge,
              ),
            ],
          ),
          const SizedBox(height: 16),
          RichText(
            text: TextSpan(
              style: context.textStyles.bodyMedium?.copyWith(
                color: AppColors.textMuted,
                height: 1.6,
              ),
              children: const [
                TextSpan(text: 'Our '),
                TextSpan(
                  text: 'Predictive Heatmapping',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text:
                      ' uses historical data and weather patterns to pre-stage our fleet in high-demand zones before accidents even happen.',
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.only(top: 16),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: AppColors.white05),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'LATENCY: <15ms',
                  style: context.textStyles.labelSmall?.copyWith(
                    color: AppColors.textMuted,
                    fontFamily: 'monospace',
                  ),
                ),
                Text(
                  'NEURAL CLUSTER ACTIVE',
                  style: context.textStyles.labelSmall?.copyWith(
                    color: AppColors.accent,
                    fontFamily: 'monospace',
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

class _FeatureSquare extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String description;

  const _FeatureSquare({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= Breakpoints.desktop;

    return isDesktop
        ? GlassPanel(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon, color: iconColor, size: 32),
                const SizedBox(height: 16),
                Text(
                  title,
                  style: context.textStyles.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: context.textStyles.bodySmall?.copyWith(
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ),
          )
        : AspectRatio(
            aspectRatio: 1,
            child: GlassPanel(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(icon, color: iconColor, size: 32),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: context.textStyles.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: context.textStyles.bodySmall?.copyWith(
                          color: AppColors.textMuted,
                          fontSize: 10,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
