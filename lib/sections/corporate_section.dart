import 'package:flutter/material.dart';
import 'package:roadygo_website/theme.dart';

/// Corporate Fleet Solutions section
class CorporateSection extends StatelessWidget {
  const CorporateSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= Breakpoints.desktop;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveLayout.contentPadding(context),
        vertical: isDesktop ? 64 : 48,
      ),
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: Breakpoints.maxContentWidth),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF0F172A), Colors.black],
            ),
            borderRadius: BorderRadius.circular(40),
            border: Border.all(color: AppColors.white10),
          ),
          padding: EdgeInsets.all(isDesktop ? 48 : 32),
          child: isDesktop ? _DesktopLayout() : _MobileLayout(),
        ),
      ),
    );
  }
}

class _DesktopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background icon
        Positioned(
          top: 0,
          right: 0,
          child: Icon(
            Icons.business_center,
            size: 200,
            color: Colors.white.withOpacity(0.03),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Left content
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Badge
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: AppColors.white05,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.white10),
                    ),
                    child: Text(
                      'B2B PLATFORM',
                      style: context.textStyles.labelSmall?.copyWith(
                        color: AppColors.textMuted,
                        letterSpacing: 3,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Title
                  Text(
                    'Corporate Fleet',
                    style: context.textStyles.displaySmall?.copyWith(
                      height: 1.1,
                      fontSize: 48,
                    ),
                  ),
                  Text(
                    'Solutions',
                    style: context.textStyles.displaySmall?.copyWith(
                      height: 1.1,
                      fontSize: 48,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Description
                  SizedBox(
                    width: 400,
                    child: Text(
                      'Enterprise-grade roadside assistance for logistics, rental agencies, and corporate car pools. Centralized billing & analytics.',
                      style: context.textStyles.bodyLarge?.copyWith(
                        color: AppColors.textMuted,
                        height: 1.6,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  // CTA Button
                  _LearnMoreButton(),
                ],
              ),
            ),
            // Right side - stats
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _StatItem(value: '500+', label: 'Enterprise Clients'),
                  const SizedBox(height: 32),
                  _StatItem(value: '24/7', label: 'Dedicated Support'),
                  const SizedBox(height: 32),
                  _StatItem(value: '99.9%', label: 'Uptime SLA'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _MobileLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background icon
        Positioned(
          top: 0,
          right: 0,
          child: Icon(
            Icons.business_center,
            size: 120,
            color: Colors.white.withOpacity(0.03),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.white05,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.white10),
              ),
              child: Text(
                'B2B PLATFORM',
                style: context.textStyles.labelSmall?.copyWith(
                  color: AppColors.textMuted,
                  letterSpacing: 3,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Title
            Text(
              'Corporate Fleet',
              style: context.textStyles.displaySmall?.copyWith(
                height: 1.1,
              ),
            ),
            Text(
              'Solutions',
              style: context.textStyles.displaySmall?.copyWith(
                height: 1.1,
              ),
            ),
            const SizedBox(height: 16),
            // Description
            SizedBox(
              width: 240,
              child: Text(
                'Enterprise-grade roadside assistance for logistics, rental agencies, and corporate car pools. Centralized billing & analytics.',
                style: context.textStyles.bodyMedium?.copyWith(
                  color: AppColors.textMuted,
                  height: 1.6,
                ),
              ),
            ),
            const SizedBox(height: 32),
            // CTA Button
            _LearnMoreButton(),
          ],
        ),
      ],
    );
  }
}

class _LearnMoreButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          decoration: BoxDecoration(
            color: AppColors.white05,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.white10),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Learn More',
                style: context.textStyles.titleSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.arrow_forward, color: Colors.white, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String value;
  final String label;

  const _StatItem({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          value,
          style: context.textStyles.displaySmall?.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: context.textStyles.bodySmall?.copyWith(
            color: AppColors.textMuted,
          ),
        ),
      ],
    );
  }
}
