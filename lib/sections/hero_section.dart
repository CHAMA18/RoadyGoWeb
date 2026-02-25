import 'package:flutter/material.dart';
import 'package:roadygo_website/theme.dart';

/// Hero section with background image and CTA
class HeroSection extends StatelessWidget {
  final String heroImageUrl;

  const HeroSection({super.key, required this.heroImageUrl});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= Breakpoints.desktop;
    final isTablet = screenWidth >= Breakpoints.tablet;
    
    return SizedBox(
      height: isDesktop ? 700 : MediaQuery.of(context).size.height * 0.92,
      child: Stack(
        children: [
          // Background image with gradient fallback
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFF1A0A0A),
                    AppColors.backgroundDark,
                  ],
                ),
              ),
              child: Image.network(
                heroImageUrl,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(color: Colors.transparent);
                },
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
          // Red overlay
          Positioned.fill(
            child: Container(
              color: AppColors.primary.withOpacity(0.08),
            ),
          ),
          // Gradient overlay
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: const [0.0, 0.4, 0.85, 1.0],
                  colors: [
                    AppColors.backgroundDark.withOpacity(0.1),
                    AppColors.backgroundDark.withOpacity(0.4),
                    AppColors.backgroundDark.withOpacity(0.95),
                    AppColors.backgroundDark,
                  ],
                ),
              ),
            ),
          ),
          // Content
          Positioned.fill(
            child: SafeArea(
              child: Center(
                child: Container(
                  constraints: BoxConstraints(maxWidth: Breakpoints.maxContentWidth),
                  padding: EdgeInsets.symmetric(
                    horizontal: ResponsiveLayout.contentPadding(context),
                  ),
                  child: isDesktop
                      ? _DesktopHeroContent()
                      : _MobileHeroContent(isTablet: isTablet),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DesktopHeroContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Left side - Text content
        Expanded(
          flex: 3,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _StatusBadge(),
              const SizedBox(height: 32),
              Text(
                'Future of',
                style: context.textStyles.displayLarge?.copyWith(
                  fontSize: 72,
                  height: 0.95,
                  shadows: [
                    Shadow(
                      color: Colors.white.withOpacity(0.3),
                      blurRadius: 20,
                    ),
                  ],
                ),
              ),
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Colors.white, Color(0xFFE2E8F0), Color(0xFF64748B)],
                ).createShader(bounds),
                child: Text(
                  'Rescue.',
                  style: context.textStyles.displayLarge?.copyWith(
                    fontSize: 72,
                    height: 0.95,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Container(
                padding: const EdgeInsets.only(left: 16),
                decoration: const BoxDecoration(
                  border: Border(
                    left: BorderSide(color: AppColors.primary, width: 2),
                  ),
                ),
                child: Text(
                  'AI-dispatched elite recovery fleet.\nPrecision engineering for your peace of mind.',
                  style: context.textStyles.bodyLarge?.copyWith(
                    color: AppColors.textSecondary,
                    height: 1.6,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Row(
                children: [
                  SizedBox(
                    width: 280,
                    child: _GetHelpButton(),
                  ),
                  const SizedBox(width: 24),
                  _QuickStats(isHorizontal: true),
                ],
              ),
            ],
          ),
        ),
        // Right side - spacer for balance
        const Expanded(flex: 2, child: SizedBox()),
      ],
    );
  }
}

class _MobileHeroContent extends StatelessWidget {
  final bool isTablet;

  const _MobileHeroContent({this.isTablet = false});

  @override
  Widget build(BuildContext context) {
    final titleSize = isTablet ? 52.0 : 36.0;
    final spacing = isTablet ? 24.0 : 16.0;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _StatusBadge(),
        SizedBox(height: spacing),
        Text(
          'Future of',
          style: context.textStyles.displayLarge?.copyWith(
            fontSize: titleSize,
            height: 0.95,
            shadows: [
              Shadow(
                color: Colors.white.withOpacity(0.3),
                blurRadius: 20,
              ),
            ],
          ),
        ),
        ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [Colors.white, Color(0xFFE2E8F0), Color(0xFF64748B)],
          ).createShader(bounds),
          child: Text(
            'Rescue.',
            style: context.textStyles.displayLarge?.copyWith(
              fontSize: titleSize,
              height: 0.95,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(height: spacing),
        Container(
          padding: const EdgeInsets.only(left: 16),
          decoration: const BoxDecoration(
            border: Border(
              left: BorderSide(color: AppColors.primary, width: 2),
            ),
          ),
          child: Text(
            'AI-dispatched elite recovery fleet.\nPrecision engineering for your peace of mind.',
            style: context.textStyles.bodyLarge?.copyWith(
              color: AppColors.textSecondary,
              height: 1.6,
            ),
          ),
        ),
        SizedBox(height: spacing * 1.3),
        isTablet
            ? Row(
                children: [
                  Expanded(child: _GetHelpButton()),
                  const SizedBox(width: 24),
                  _QuickStats(isHorizontal: true),
                ],
              )
            : Column(
                children: [
                  _GetHelpButton(),
                  const SizedBox(height: 16),
                  _QuickStats(),
                ],
              ),
        const SizedBox(height: 40),
      ],
    );
  }
}

class _StatusBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.white05,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.white10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _PulsatingDot(),
          const SizedBox(width: 8),
          Text(
            'AUTONOMOUS NETWORK ACTIVE',
            style: context.textStyles.labelSmall?.copyWith(
              color: AppColors.textSecondary,
              letterSpacing: 2,
            ),
          ),
        ],
      ),
    );
  }
}

class _PulsatingDot extends StatefulWidget {
  @override
  State<_PulsatingDot> createState() => _PulsatingDotState();
}

class _PulsatingDotState extends State<_PulsatingDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();
    _animation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 10,
      height: 10,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primary.withOpacity(0.75 * _animation.value),
                ),
              );
            },
          ),
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class _GetHelpButton extends StatefulWidget {
  @override
  State<_GetHelpButton> createState() => _GetHelpButtonState();
}

class _GetHelpButtonState extends State<_GetHelpButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController;

  @override
  void initState() {
    super.initState();
    _shimmerController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.primary, AppColors.primaryDark],
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: AppColors.primaryGlow,
          ),
          child: Stack(
            children: [
              AnimatedBuilder(
                animation: _shimmerController,
                builder: (context, child) {
                  return Positioned.fill(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Transform.translate(
                        offset: Offset(
                          (-1 + 2 * _shimmerController.value) * 400,
                          0,
                        ),
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.transparent,
                                Colors.white.withOpacity(0.2),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.emergency_share, color: Colors.white, size: 28),
                  const SizedBox(width: 12),
                  Text(
                    'GET HELP NOW',
                    style: context.textStyles.titleMedium?.copyWith(
                      color: Colors.white,
                      letterSpacing: 2,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _QuickStats extends StatelessWidget {
  final bool isHorizontal;

  const _QuickStats({this.isHorizontal = false});

  @override
  Widget build(BuildContext context) {
    final items = [
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.bolt, color: AppColors.accent, size: 14),
          const SizedBox(width: 4),
          Text(
            '12m Avg Arrival',
            style: context.textStyles.bodySmall?.copyWith(
              color: AppColors.textMuted,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      Container(
        width: 4,
        height: 4,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.textDark,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.verified, color: AppColors.accent, size: 14),
          const SizedBox(width: 4),
          Text(
            '100% Insured',
            style: context.textStyles.bodySmall?.copyWith(
              color: AppColors.textMuted,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ];

    return Row(
      mainAxisAlignment: isHorizontal ? MainAxisAlignment.start : MainAxisAlignment.center,
      children: items,
    );
  }
}
