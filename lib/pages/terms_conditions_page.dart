import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roadygo_website/theme.dart';
import 'package:roadygo_website/components/glass_panel.dart';

/// Terms & Conditions page
class TermsConditionsPage extends StatelessWidget {
  const TermsConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: Stack(
        children: [
          // Main scrollable content
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 80), // Space for fixed header
                _TermsContent(),
                const SizedBox(height: 200), // Space for fixed bottom bar
              ],
            ),
          ),
          // Fixed header
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: _TermsHeader(),
          ),
          // Fixed bottom bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _BottomActionBar(),
          ),
        ],
      ),
    );
  }
}

class _TermsHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final headerContent = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.backgroundDark.withOpacity(kIsWeb ? 0.9 : 0.8),
        border: const Border(
          bottom: BorderSide(color: AppColors.white05, width: 1),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            // Back button
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => context.go('/'),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.white05,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.white10),
                  ),
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
            ),
            const Spacer(),
            // Title
            Text(
              'TERMS & CONDITIONS',
              style: context.textStyles.labelSmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.5,
              ),
            ),
            const Spacer(),
            const SizedBox(width: 40), // Balance the back button
          ],
        ),
      ),
    );

    if (kIsWeb) {
      return headerContent;
    }

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 25, sigmaY: 25),
        child: headerContent,
      ),
    );
  }
}

class _TermsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // Responsive maxWidth: wider for larger screens
    final double maxWidth;
    final double horizontalPadding;
    
    if (screenWidth >= 1200) {
      maxWidth = 900.0;
      horizontalPadding = 48.0;
    } else if (screenWidth >= 900) {
      maxWidth = 750.0;
      horizontalPadding = 40.0;
    } else if (screenWidth >= 600) {
      maxWidth = 600.0;
      horizontalPadding = 32.0;
    } else {
      maxWidth = double.infinity;
      horizontalPadding = 24.0;
    }

    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: maxWidth),
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Column(
          children: [
            const SizedBox(height: 24),
            // Version badge and date
            _VersionBadge(),
            const SizedBox(height: 32),
            // Terms sections
            _TermsSection(
              number: '1',
              title: 'Agreement to Terms',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _TermsParagraph(
                    children: [
                      const TextSpan(text: 'By accessing the '),
                      TextSpan(
                        text: 'Roady GO',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const TextSpan(
                        text: ' platform, you agree to be bound by these elite service standards. These terms constitute a legally binding agreement between you and our global rescue network.',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _TermsParagraph(
                    children: [
                      const TextSpan(
                        text: 'If you do not agree with all of these terms, then you are expressly prohibited from using the application and must ',
                      ),
                      TextSpan(
                        text: 'discontinue use immediately.',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _TermsSection(
              number: '2',
              title: 'Intellectual Property Rights',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _TermsParagraph(
                    children: [
                      const TextSpan(
                        text: 'Unless otherwise indicated, the platform is our proprietary property and all ',
                      ),
                      TextSpan(
                        text: 'source code, databases, functionality, software, website designs, audio, video, text, and graphics',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const TextSpan(text: ' are owned or controlled by us.'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _TermsParagraph(
                    children: [
                      const TextSpan(text: 'The '),
                      TextSpan(
                        text: 'ROADY GO',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.5,
                          fontSize: 11,
                        ),
                      ),
                      const TextSpan(
                        text: ' trademarks and logos are protected by international copyright laws and treaty provisions.',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _TermsSection(
              number: '3',
              title: 'User Representations',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'By using the platform, you represent and warrant that:',
                    style: context.textStyles.bodySmall?.copyWith(
                      color: AppColors.textSecondary,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 16),
                  _ChecklistItem(text: 'You have the legal capacity to comply with these terms.'),
                  const SizedBox(height: 12),
                  _ChecklistItem(text: 'You are not a minor in the jurisdiction in which you reside.'),
                  const SizedBox(height: 12),
                  _ChecklistItem(text: 'Your use of the services will not violate any applicable law.'),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _TermsSection(
              number: '4',
              title: 'Service Limitations',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _TermsParagraph(
                    children: [
                      const TextSpan(text: 'While our '),
                      TextSpan(
                        text: 'AI Dispatching Algorithm',
                        style: TextStyle(
                          color: AppColors.accent,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const TextSpan(
                        text: ' aims for sub-12 minute arrival times, factors such as extreme weather, catastrophic traffic events, or remote locations may affect performance.',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _TermsParagraph(
                    children: [
                      const TextSpan(text: 'We reserve the right to prioritize '),
                      TextSpan(
                        text: 'Emergency Safety Requests',
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.primary.withOpacity(0.3),
                        ),
                      ),
                      const TextSpan(
                        text: ' over standard vehicle relocations during peak demand periods.',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            _TermsSection(
              number: '5',
              title: 'Payment & Refunds',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _TermsParagraph(
                    children: [
                      const TextSpan(
                        text: 'All service fees are calculated dynamically based on vehicle type, distance, and specialized equipment requirements. All payments are processed through encrypted, high-security gateways.',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _TermsParagraph(
                    children: [
                      const TextSpan(text: 'Cancellations made after a rescue unit has been '),
                      TextSpan(
                        text: 'Dispatched',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const TextSpan(text: ' may incur a standard mobilization fee.'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}

class _VersionBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Version badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.primary.withOpacity(0.2)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 6,
                height: 6,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.5),
                      blurRadius: 6,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'LEGAL FRAMEWORK V2.4',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        // Last updated
        Text(
          'LAST UPDATED: OCTOBER 24, 2024',
          style: TextStyle(
            color: AppColors.textMuted,
            fontSize: 11,
            fontWeight: FontWeight.w600,
            letterSpacing: 3,
          ),
        ),
      ],
    );
  }
}

class _TermsSection extends StatelessWidget {
  final String number;
  final String title;
  final Widget content;

  const _TermsSection({
    required this.number,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      borderRadius: 40,
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$number. $title',
            style: context.textStyles.titleMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 16),
          content,
        ],
      ),
    );
  }
}

class _TermsParagraph extends StatelessWidget {
  final List<InlineSpan> children;

  const _TermsParagraph({required this.children});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: context.textStyles.bodySmall?.copyWith(
          color: AppColors.textSecondary,
          height: 1.6,
        ),
        children: children,
      ),
    );
  }
}

class _ChecklistItem extends StatelessWidget {
  final String text;

  const _ChecklistItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.check_circle,
          color: AppColors.primary,
          size: 18,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: context.textStyles.bodySmall?.copyWith(
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}

class _BottomActionBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    // Match the content maxWidth for consistency
    final double maxWidth;
    final double horizontalPadding;
    
    if (screenWidth >= 1200) {
      maxWidth = 900.0;
      horizontalPadding = 48.0;
    } else if (screenWidth >= 900) {
      maxWidth = 750.0;
      horizontalPadding = 40.0;
    } else if (screenWidth >= 600) {
      maxWidth = 600.0;
      horizontalPadding = 32.0;
    } else {
      maxWidth = double.infinity;
      horizontalPadding = 24.0;
    }
    
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.backgroundDark.withOpacity(0),
            AppColors.backgroundDark.withOpacity(0.95),
            AppColors.backgroundDark,
          ],
          stops: const [0.0, 0.3, 1.0],
        ),
      ),
      child: SafeArea(
        top: false,
        child: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: maxWidth),
            padding: EdgeInsets.fromLTRB(horizontalPadding, 32, horizontalPadding, 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // App store badges
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _AppStoreBadge(
                      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCJF_W5VKccq_pkqyFGcjxZBLwq4Ed_dYUXEcWl0nLhKN18h93PipzjMkbjlXmRT_CyotfxHFhTQXOfyWiGJyWhbcpChW4K1U1U7uPLJpcmHJundnrZmx53_p98OAmIZqWhx8x0lqkBdOA9o21uI3i0CbEP4BS28pcRF37avCnFGDoKGqkSOODVWsswY8cJpdO45pxOb3Eeh9YpdcSU5GrZuPjTwJVPGDL3p38_UUwP4-PJW9jcMkHhfHfFHeY3QHCJ6o6noAgeDQ',
                    ),
                    const SizedBox(width: 16),
                    _AppStoreBadge(
                      imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuC3dbVGHzkBNcxj88kxbXE8ciDt2dOwfFOhO8EDCytHj9ChoBrExxbehIy376O8zG41Y0rh-ovbHsoAlmGcSE27aOnZ97VdB3UUUs_5sE85mPJo_rPMvUqJvlYWQlMXmPVUxLY1LUjYUZ_UDQAsZVAqxmwALHvtLC5CrilerAUIOW56FDoVgBun_UQgofX0aVYfmw6iptZw4-oSfDyTTywlbzGKmL5lpG7N6WQvzmETtTWJxfZ9SkyTSWdaxLmtLF8GxLw1LD3lfw',
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // Accept button
                _AcceptButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _AppStoreBadge extends StatelessWidget {
  final String imageUrl;

  const _AppStoreBadge({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Image.network(
        imageUrl,
        height: 40,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) => const SizedBox(height: 40, width: 120),
      ),
    );
  }
}

class _AcceptButton extends StatefulWidget {
  @override
  State<_AcceptButton> createState() => _AcceptButtonState();
}

class _AcceptButtonState extends State<_AcceptButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) {
          setState(() => _isPressed = false);
          // Navigate back to home when accepted
          context.go('/');
        },
        onTapCancel: () => setState(() => _isPressed = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20),
          transform: Matrix4.identity()..scale(_isPressed ? 0.98 : 1.0),
          transformAlignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.primary, AppColors.primaryDark],
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.3),
                blurRadius: 40,
                offset: const Offset(0, 20),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'ACCEPT ALL CONDITIONS',
                style: context.textStyles.labelSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(width: 12),
              const Icon(
                Icons.verified_user,
                color: Colors.white,
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
