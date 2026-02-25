import 'package:flutter/material.dart';
import 'package:roadygo_website/theme.dart';
import 'package:roadygo_website/components/glass_panel.dart';

/// Coverage Map section
class CoverageSection extends StatelessWidget {
  const CoverageSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth >= Breakpoints.desktop;

    return Container(
      color: AppColors.backgroundDark,
      padding: EdgeInsets.symmetric(
        vertical: isDesktop ? 100 : 80,
        horizontal: ResponsiveLayout.contentPadding(context),
      ),
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: Breakpoints.maxContentWidth),
          child: Column(
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
                  'GLOBAL EXPANSION',
                  style: context.textStyles.labelSmall?.copyWith(
                    color: AppColors.accent,
                    letterSpacing: 3,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // Title
              Text(
                'Coverage Map',
                style: context.textStyles.displaySmall?.copyWith(
                  fontSize: isDesktop ? 40 : 32,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Active in 400+ cities across 3 continents.',
                style: context.textStyles.bodyMedium?.copyWith(
                  color: AppColors.textMuted,
                ),
              ),
              SizedBox(height: isDesktop ? 48 : 32),
              // Map placeholder
              AspectRatio(
                aspectRatio: isDesktop ? 21 / 9 : 16 / 9,
                child: GlassPanel(
                  child: Stack(
                    children: [
                      // Grid pattern
                      Positioned.fill(
                        child: CustomPaint(
                          painter: _GridPainter(),
                        ),
                      ),
                      // Pulsing dots representing locations - more on desktop
                      const Positioned(
                        top: 80,
                        left: 60,
                        child: _PulsingDot(),
                      ),
                      const Positioned(
                        top: 110,
                        left: 90,
                        child: _PulsingDot(delay: Duration(milliseconds: 300)),
                      ),
                      const Positioned(
                        top: 90,
                        right: 80,
                        child: _PulsingDot(delay: Duration(milliseconds: 600)),
                      ),
                      const Positioned(
                        top: 130,
                        right: 50,
                        child: _PulsingDot(delay: Duration(milliseconds: 900)),
                      ),
                      if (isDesktop) ...[
                        const Positioned(
                          top: 60,
                          left: 200,
                          child: _PulsingDot(delay: Duration(milliseconds: 200)),
                        ),
                        const Positioned(
                          top: 100,
                          left: 350,
                          child: _PulsingDot(delay: Duration(milliseconds: 500)),
                        ),
                        const Positioned(
                          top: 80,
                          right: 200,
                          child: _PulsingDot(delay: Duration(milliseconds: 700)),
                        ),
                        const Positioned(
                          top: 140,
                          right: 300,
                          child: _PulsingDot(delay: Duration(milliseconds: 400)),
                        ),
                      ],
                      // Status badge
                      Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.4),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColors.white10),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 8,
                                height: 8,
                                decoration: const BoxDecoration(
                                  color: AppColors.emerald,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'NETWORK STATUS: OPTIMAL',
                                style: context.textStyles.labelSmall?.copyWith(
                                  color: AppColors.textSecondary,
                                  fontFamily: 'monospace',
                                  letterSpacing: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.03)
      ..strokeWidth = 1;

    const spacing = 40.0;

    // Horizontal lines
    for (double y = 0; y < size.height; y += spacing) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }

    // Vertical lines
    for (double x = 0; x < size.width; x += spacing) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _PulsingDot extends StatefulWidget {
  final Duration delay;

  const _PulsingDot({this.delay = Duration.zero});

  @override
  State<_PulsingDot> createState() => _PulsingDotState();
}

class _PulsingDotState extends State<_PulsingDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.repeat(reverse: true);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: _animation.value),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.5 * _animation.value),
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ],
          ),
        );
      },
    );
  }
}
