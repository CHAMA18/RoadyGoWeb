import 'package:flutter/material.dart';
import 'package:roadygo_website/theme.dart';
import 'package:roadygo_website/components/glass_panel.dart';

/// FAQ Section
class FAQSection extends StatefulWidget {
  const FAQSection({super.key});

  @override
  State<FAQSection> createState() => _FAQSectionState();
}

class _FAQSectionState extends State<FAQSection> {
  int? _expandedIndex = 0;

  final List<Map<String, String>> _faqs = const [
    {
      'question': 'What is the average wait time?',
      'answer':
          'Our global average is 12 minutes. In metropolitan areas, we typically arrive in under 8 minutes thanks to our AI-driven fleet pre-staging.',
    },
    {
      'question': 'Are all vehicle types covered?',
      'answer':
          'Yes, from high-voltage EVs and motorcycles to heavy commercial trucks and RVs. Our fleet is categorized to ensure the right tech for your specific vehicle.',
    },
    {
      'question': 'How does the insurance work?',
      'answer':
          'Every tow is covered by our \$5,000,000 global liability insurance policy. From the moment our driver hooks your vehicle until it is safely dropped off.',
    },
  ];

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
          child: isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Left side - title and description
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'QUESTIONS?',
                            style: context.textStyles.displaySmall?.copyWith(
                              letterSpacing: -1,
                              fontSize: 48,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Everything you need to know about our premium rescue service.',
                            style: context.textStyles.bodyLarge?.copyWith(
                              color: AppColors.textMuted,
                              height: 1.6,
                            ),
                          ),
                          const SizedBox(height: 32),
                          MouseRegion(
                            cursor: SystemMouseCursors.click,
                            child: GestureDetector(
                              onTap: () {},
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Contact Support',
                                    style: context.textStyles.titleSmall?.copyWith(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  const Icon(Icons.arrow_forward, color: AppColors.primary, size: 18),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 64),
                    // Right side - FAQ items
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: List.generate(_faqs.length, (index) {
                          final faq = _faqs[index];
                          final isExpanded = _expandedIndex == index;
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: _FAQItem(
                              question: faq['question']!,
                              answer: faq['answer']!,
                              isExpanded: isExpanded,
                              onTap: () {
                                setState(() {
                                  _expandedIndex = isExpanded ? null : index;
                                });
                              },
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'QUESTIONS?',
                      style: context.textStyles.displaySmall?.copyWith(
                        letterSpacing: -1,
                      ),
                    ),
                    const SizedBox(height: 32),
                    ...List.generate(_faqs.length, (index) {
                      final faq = _faqs[index];
                      final isExpanded = _expandedIndex == index;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: _FAQItem(
                          question: faq['question']!,
                          answer: faq['answer']!,
                          isExpanded: isExpanded,
                          onTap: () {
                            setState(() {
                              _expandedIndex = isExpanded ? null : index;
                            });
                          },
                        ),
                      );
                    }),
                  ],
                ),
        ),
      ),
    );
  }
}

class _FAQItem extends StatelessWidget {
  final String question;
  final String answer;
  final bool isExpanded;
  final VoidCallback onTap;

  const _FAQItem({
    required this.question,
    required this.answer,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      borderRadius: 16,
      hasBorder: true,
      child: Column(
        children: [
          // Question header
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: isExpanded ? AppColors.white05 : Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        question,
                        style: context.textStyles.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    AnimatedRotation(
                      turns: isExpanded ? 0.5 : 0,
                      duration: const Duration(milliseconds: 200),
                      child: const Icon(
                        Icons.expand_more,
                        color: AppColors.textMuted,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Answer
          AnimatedCrossFade(
            firstChild: const SizedBox.shrink(),
            secondChild: Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: AppColors.white05),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  answer,
                  style: context.textStyles.bodySmall?.copyWith(
                    color: AppColors.textMuted,
                    height: 1.6,
                  ),
                ),
              ),
            ),
            crossFadeState:
                isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 200),
          ),
        ],
      ),
    );
  }
}
