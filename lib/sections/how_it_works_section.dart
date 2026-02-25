import 'package:flutter/material.dart';
import 'package:roadygo_website/theme.dart';
import 'package:roadygo_website/components/glass_panel.dart';

/// How it Works timeline section
class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= Breakpoints.desktop;

    return Container(
      color: AppColors.surface,
      padding: EdgeInsets.symmetric(
        vertical: isDesktop ? 100 : 80,
        horizontal: ResponsiveLayout.contentPadding(context),
      ),
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: Breakpoints.maxContentWidth),
          child: Column(
            children: [
              // Header
              Text(
                'THE EXPERIENCE',
                style: context.textStyles.labelSmall?.copyWith(
                  color: AppColors.primary,
                  letterSpacing: 4,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'How it Works',
                style: context.textStyles.displaySmall?.copyWith(
                  fontSize: isDesktop ? 40 : 32,
                ),
              ),
              SizedBox(height: isDesktop ? 64 : 48),
              // Timeline - horizontal on desktop, vertical on mobile
              isDesktop
                  ? _DesktopTimeline()
                  : _MobileTimeline(),
            ],
          ),
        ),
      ),
    );
  }
}

class _DesktopTimeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: _TimelineCard(
            phase: '01',
            title: 'Smart Request',
            description:
                'Open the app and tap SOS. Our system instantly identifies your vehicle type, GPS coordinates, and diagnostic status through vehicle telemetry.',
            icon: Icons.touch_app,
            isActive: true,
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: _TimelineCard(
            phase: '02',
            title: 'AI Dispatch',
            description:
                'Neural-Net algorithms analyze real-time traffic and fleet positioning to assign the closest specialized unit within milliseconds.',
            icon: Icons.psychology,
            isActive: false,
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: _TimelineCard(
            phase: '03',
            title: 'Elite Rescue',
            description:
                'A certified technician arrives in a high-tech recovery vehicle. Watch the approach in real-time with 2s precision tracking.',
            icon: Icons.minor_crash,
            isActive: false,
          ),
        ),
      ],
    );
  }
}

class _TimelineCard extends StatelessWidget {
  final String phase;
  final String title;
  final String description;
  final IconData icon;
  final bool isActive;

  const _TimelineCard({
    required this.phase,
    required this.title,
    required this.description,
    required this.icon,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Icon circle
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: isActive ? AppColors.primary : AppColors.white10,
            borderRadius: BorderRadius.circular(28),
            border: Border.all(
              color: AppColors.surface,
              width: 4,
            ),
            boxShadow: isActive ? AppColors.primaryGlow : null,
          ),
          child: Icon(icon, color: Colors.white, size: 24),
        ),
        const SizedBox(height: 24),
        // Content
        GlassPanel(
          borderRadius: AppRadius.xl,
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'PHASE $phase',
                style: context.textStyles.labelSmall?.copyWith(
                  color: isActive ? AppColors.primary : AppColors.textMuted,
                  letterSpacing: 3,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: context.textStyles.titleLarge,
              ),
              const SizedBox(height: 12),
              Text(
                description,
                style: context.textStyles.bodyMedium?.copyWith(
                  color: AppColors.textMuted,
                  height: 1.6,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MobileTimeline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Timeline line
        Positioned(
          left: 21,
          top: 24,
          bottom: 24,
          child: Container(
            width: 2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.primary,
                  AppColors.primary.withValues(alpha: 0.1),
                ],
              ),
              borderRadius: BorderRadius.circular(1),
            ),
          ),
        ),
        // Steps
        Column(
          children: const [
            _TimelineStep(
              phase: '01',
              title: 'Smart Request',
              description:
                  'Open the app and tap SOS. Our system instantly identifies your vehicle type, GPS coordinates, and diagnostic status through vehicle telemetry.',
              icon: Icons.touch_app,
              isActive: true,
            ),
            SizedBox(height: 64),
            _TimelineStep(
              phase: '02',
              title: 'AI Dispatch',
              description:
                  'Neural-Net algorithms analyze real-time traffic and fleet positioning to assign the closest specialized unit within milliseconds.',
              icon: Icons.psychology,
              isActive: false,
            ),
            SizedBox(height: 64),
            _TimelineStep(
              phase: '03',
              title: 'Elite Rescue',
              description:
                  'A certified technician arrives in a high-tech recovery vehicle. Watch the approach in real-time with 2s precision tracking.',
              icon: Icons.minor_crash,
              isActive: false,
            ),
          ],
        ),
      ],
    );
  }
}

class _TimelineStep extends StatelessWidget {
  final String phase;
  final String title;
  final String description;
  final IconData icon;
  final bool isActive;

  const _TimelineStep({
    required this.phase,
    required this.title,
    required this.description,
    required this.icon,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon circle
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: isActive ? AppColors.primary : AppColors.white10,
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: AppColors.surface,
              width: 4,
            ),
            boxShadow: isActive ? AppColors.primaryGlow : null,
          ),
          child: Icon(icon, color: Colors.white, size: 20),
        ),
        const SizedBox(width: 24),
        // Content
        Expanded(
          child: GlassPanel(
            borderRadius: AppRadius.xl,
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PHASE $phase',
                  style: context.textStyles.labelSmall?.copyWith(
                    color: isActive ? AppColors.primary : AppColors.textMuted,
                    letterSpacing: 3,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  title,
                  style: context.textStyles.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: context.textStyles.bodyMedium?.copyWith(
                    color: AppColors.textMuted,
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
