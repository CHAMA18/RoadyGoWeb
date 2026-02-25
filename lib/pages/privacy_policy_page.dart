import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roadygo_website/theme.dart';
import 'package:roadygo_website/components/glass_panel.dart';

/// Privacy Policy page matching the HTML design
class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

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
                _PrivacyPolicyHeader(),
                _PrivacyPolicyContent(),
                const SizedBox(height: 200), // Space for bottom bar
              ],
            ),
          ),
          // Fixed bottom action bar
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _BottomActionBar(),
          ),
        ],
      ),
    );
  }
}

class _PrivacyPolicyHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.backgroundDark.withOpacity(0.8),
        border: const Border(
          bottom: BorderSide(color: AppColors.white05),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Row(
          children: [
            // Back button
            GestureDetector(
              onTap: () => context.pop(),
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppColors.white05,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: AppColors.white10),
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.white,
                  size: 18,
                ),
              ),
            ),
            // Title
            Expanded(
              child: Text(
                'PRIVACY POLICY',
                textAlign: TextAlign.center,
                style: context.textStyles.labelSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1,
                ),
              ),
            ),
            // Spacer for balance
            const SizedBox(width: 40),
          ],
        ),
      ),
    );
  }
}

class _PrivacyPolicyContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final maxWidth = screenWidth >= 1200
        ? 900.0
        : screenWidth >= 900
            ? 750.0
            : screenWidth >= 600
                ? 600.0
                : double.infinity;
    final horizontalPadding = screenWidth >= 1200
        ? 48.0
        : screenWidth >= 900
            ? 40.0
            : screenWidth >= 600
                ? 32.0
                : 24.0;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Column(
            children: [
              const SizedBox(height: 24),
              // Version badge
              _VersionBadge(),
              const SizedBox(height: 16),
              // Last updated
              Text(
                'LAST UPDATED: OCTOBER 24, 2024',
                style: context.textStyles.labelSmall?.copyWith(
                  color: AppColors.textDark,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 3,
                ),
              ),
              const SizedBox(height: 40),
              // Content sections
              _PolicySection(
                title: '1. Information We Collect',
                content: [
                  _RichText(
                    'To provide elite roadside assistance, ',
                    highlight: 'Roady GO',
                    highlightColor: AppColors.primary,
                    continuation: ' collects personal data including your legal name, real-time precise location for rescue dispatch, and contact information.',
                  ),
                  'We also gather vehicle technical specifications to ensure the correct equipment is deployed to your exact coordinates during an emergency.',
                ],
              ),
              const SizedBox(height: 24),
              _PolicySection(
                title: '2. How We Use Data',
                content: [
                  _RichText(
                    'Your data powers our ',
                    highlight: 'AI Dispatching',
                    highlightColor: AppColors.accent,
                    continuation: ' engine for routing optimization, instant service dispatch, and critical safety communication.',
                  ),
                  'We utilize anonymized telematics to improve our response network and ensure that our rescue partners maintain the highest service level agreements.',
                ],
              ),
              const SizedBox(height: 24),
              _PolicySection(
                title: '3. Data Security',
                content: [
                  'Security is our core priority. We employ high-security AES-256 encryption and end-to-end protection for all data transmissions between your device and our secure servers.',
                  'Access to sensitive location data is restricted to verified rescue personnel only during active service windows.',
                ],
              ),
              const SizedBox(height: 24),
              _PolicySection(
                title: '4. Third-Party Integration',
                content: [
                  'We share necessary information with our network of towing partners only when a request is initiated. All partners are bound by strict confidentiality agreements and our premium data protection standards.',
                ],
              ),
              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }
}

class _VersionBadge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: AppColors.primary.withOpacity(0.2),
        ),
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
                  blurRadius: 4,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Text(
            'LEGAL FRAMEWORK V2.4',
            style: context.textStyles.labelSmall?.copyWith(
              color: AppColors.primary,
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 2,
            ),
          ),
        ],
      ),
    );
  }
}

class _RichText {
  final String prefix;
  final String highlight;
  final Color highlightColor;
  final String continuation;

  const _RichText(
    this.prefix, {
    required this.highlight,
    required this.highlightColor,
    required this.continuation,
  });
}

class _PolicySection extends StatelessWidget {
  final String title;
  final List<dynamic> content;

  const _PolicySection({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      padding: const EdgeInsets.all(24),
      borderRadius: 40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: context.textStyles.titleMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.3,
            ),
          ),
          const SizedBox(height: 16),
          ...content.map((item) {
            if (item is _RichText) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text.rich(
                  TextSpan(
                    style: context.textStyles.bodySmall?.copyWith(
                      color: AppColors.textMuted,
                      height: 1.6,
                    ),
                    children: [
                      TextSpan(text: item.prefix),
                      TextSpan(
                        text: item.highlight,
                        style: TextStyle(
                          color: item.highlightColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(text: item.continuation),
                    ],
                  ),
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  item as String,
                  style: context.textStyles.bodySmall?.copyWith(
                    color: AppColors.textMuted,
                    height: 1.6,
                  ),
                ),
              );
            }
          }),
        ],
      ),
    );
  }
}

class _BottomActionBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final maxWidth = screenWidth >= 1200
        ? 900.0
        : screenWidth >= 900
            ? 750.0
            : screenWidth >= 600
                ? 600.0
                : double.infinity;
    final horizontalPadding = screenWidth >= 1200
        ? 48.0
        : screenWidth >= 900
            ? 40.0
            : screenWidth >= 600
                ? 32.0
                : 24.0;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.backgroundDark.withOpacity(0.0),
            AppColors.backgroundDark.withOpacity(0.95),
            AppColors.backgroundDark,
          ],
          stops: const [0.0, 0.3, 0.6],
        ),
      ),
      padding: EdgeInsets.fromLTRB(horizontalPadding, 40, horizontalPadding, 40),
      child: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // App store badges
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _AppStoreBadge(
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuCJF_W5VKccq_pkqyFGcjxZBLwq4Ed_dYUXEcWl0nLhKN18h93PipzjMkbjlXmRT_CyotfxHFhTQXOfyWiGJyWhbcpChW4K1U1U7uPLJpcmHJundnrZmx53_p98OAmIZqWhx8x0lqkBdOA9o21uI3i0CbEP4BS28pcRF37avCnFGDoKGqkSOODVWsswY8cJpdO45pxOb3Eeh9YpdcSU5GrZuPjTwJVPGDL3p38_UUwP4-PJW9jcMkHhfHfFHeY3QHCJ6o6noAgeDQ',
                    alt: 'App Store',
                  ),
                  const SizedBox(width: 16),
                  _AppStoreBadge(
                    imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuC3dbVGHzkBNcxj88kxbXE8ciDt2dOwfFOhO8EDCytHj9ChoBrExxbehIy376O8zG41Y0rh-ovbHsoAlmGcSE27aOnZ97VdB3UUUs_5sE85mPJo_rPMvUqJvlYWQlMXmPVUxLY1LUjYUZ_UDQAsZVAqxmwALHvtLC5CrilerAUIOW56FDoVgBun_UQgofX0aVYfmw6iptZw4-oSfDyTTywlbzGKmL5lpG7N6WQvzmETtTWJxfZ9SkyTSWdaxLmtLF8GxLw1LD3lfw',
                    alt: 'Google Play',
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
    );
  }
}

class _AppStoreBadge extends StatelessWidget {
  final String imageUrl;
  final String alt;

  const _AppStoreBadge({required this.imageUrl, required this.alt});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: Image.network(
          imageUrl,
          height: 40,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) => Container(
            height: 40,
            width: 120,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                alt,
                style: context.textStyles.labelSmall?.copyWith(
                  color: AppColors.textMuted,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AcceptButton extends StatefulWidget {
  @override
  State<_AcceptButton> createState() => _AcceptButtonState();
}

class _AcceptButtonState extends State<_AcceptButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => context.pop(),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.primary,
                AppColors.primaryDark,
              ],
            ),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Stack(
            children: [
              // Hover overlay
              if (_isHovered)
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              // Content
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'ACCEPT PRIVACY POLICY',
                    style: context.textStyles.labelSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Icon(
                    Icons.shield,
                    color: Colors.white,
                    size: 20,
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
