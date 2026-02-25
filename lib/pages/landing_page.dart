import 'package:flutter/material.dart';
import 'package:roadygo_website/components/roady_header.dart';
import 'package:roadygo_website/sections/hero_section.dart';

import 'package:roadygo_website/sections/how_it_works_section.dart';
import 'package:roadygo_website/sections/roady_os_section.dart';
import 'package:roadygo_website/sections/safety_section.dart';
import 'package:roadygo_website/sections/faq_section.dart';
import 'package:roadygo_website/sections/coverage_section.dart';
import 'package:roadygo_website/sections/footer_section.dart';
import 'package:roadygo_website/theme.dart';

/// Main landing page for Roady GO
class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final ScrollController _scrollController = ScrollController();

  static const String heroImageUrl =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuCkPlzB5WqfnyFgyL42T4Efwju2YFDXvB9CmOwVUzETIWhhtreyV57QInVckktTQLw0ErbLtsdTsEs0jRpov0ghubqqkDM_ZRMlK5tivwuZGcYEMDkJCakxZK6jwvaxePmPNaAF7B2jvwhu5z7Eijqfd98HrYXCZfWYS3pPrrjrjjaL5ZJLKiaP2B0G2Nw9-4ryOC3aWykhh-f84-BLeCAc0POOISANjIpDfH3mT9djfXVAL_fJQCGCTGZsrvA4x13Lcs4zpZ916g';

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      body: Stack(
        children: [
          // Main content
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              // Hero Section
              SliverToBoxAdapter(
                child: HeroSection(heroImageUrl: heroImageUrl),
              ),

              // How it Works Section
              const SliverToBoxAdapter(
                child: HowItWorksSection(),
              ),
              // Roady OS Section
              const SliverToBoxAdapter(
                child: RoadyOSSection(),
              ),
              // Safety Section
              const SliverToBoxAdapter(
                child: SafetySection(),
              ),
              // FAQ Section
              const SliverToBoxAdapter(
                child: FAQSection(),
              ),
              // Coverage Section
              const SliverToBoxAdapter(
                child: CoverageSection(),
              ),
              // Footer Section
              const SliverToBoxAdapter(
                child: FooterSection(),
              ),
            ],
          ),
          // Fixed Header
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: RoadyHeader(),
          ),
        ],
      ),
    );
  }
}
