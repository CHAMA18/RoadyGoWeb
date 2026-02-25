import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roadygo_website/theme.dart';
import 'package:roadygo_website/nav.dart';

/// Footer section
class FooterSection extends StatelessWidget {
const FooterSection({super.key});

@override
Widget build(BuildContext context) {
final screenWidth = MediaQuery.of(context).size.width;
final isDesktop = screenWidth >= Breakpoints.desktop;

return Container(
padding: EdgeInsets.fromLTRB(
ResponsiveLayout.contentPadding(context),
isDesktop ? 100 : 80,
ResponsiveLayout.contentPadding(context),
48,
),
decoration: const BoxDecoration(
color: Colors.black,
border: Border(
top: BorderSide(color: AppColors.white05),
),
),
child: Center(
child: Container(
constraints: BoxConstraints(maxWidth: Breakpoints.maxContentWidth),
child: isDesktop ? _DesktopFooter() : _MobileFooter(),
),
),
);
}
}

class _DesktopFooter extends StatelessWidget {
@override
Widget build(BuildContext context) {
return Column(
children: [
Row(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
// Logo and description
Expanded(
flex: 2,
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
_LogoWidget(),
const SizedBox(height: 24),
SizedBox(
width: 280,
child: Text(
'The world\'s most advanced autonomous rescue network. Available 24/7 across 400+ cities worldwide.',
style: context.textStyles.bodySmall?.copyWith(
color: AppColors.textMuted,
height: 1.6,
),
),
),
const SizedBox(height: 32),
// Social links
Row(
children: [
_SocialButton(icon: Icons.share),
const SizedBox(width: 12),
_SocialButton(icon: Icons.alternate_email),
const SizedBox(width: 12),
_SocialButton(icon: Icons.language),
],
),
],
),
),
// Company links
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
'COMPANY',
style: context.textStyles.labelSmall?.copyWith(
color: Colors.white,
letterSpacing: 3,
fontWeight: FontWeight.w800,
),
),
const SizedBox(height: 24),
_FooterLink(text: 'Our Story'),
const SizedBox(height: 16),
_FooterLink(text: 'Careers'),
const SizedBox(height: 16),
_FooterLink(text: 'Press Kit'),
const SizedBox(height: 16),
_FooterLink(text: 'Become a Driver', isHighlighted: true),
],
),
),
// Support links
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
'SUPPORT',
style: context.textStyles.labelSmall?.copyWith(
color: Colors.white,
letterSpacing: 3,
fontWeight: FontWeight.w800,
),
),
const SizedBox(height: 24),
_FooterLink(text: 'Contact Us'),
const SizedBox(height: 16),
_FooterLink(text: 'Terms & Conditions', route: AppRoutes.termsConditions),
const SizedBox(height: 16),
_FooterLink(text: 'Privacy Policy', route: AppRoutes.privacyPolicy),
],
),
),
],
),
const SizedBox(height: 64),
_BottomBar(),
],
);
}
}

class _MobileFooter extends StatelessWidget {
@override
Widget build(BuildContext context) {
return Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
// Logo and description
_LogoWidget(),
const SizedBox(height: 24),
SizedBox(
width: 200,
child: Text(
'The world\'s most advanced autonomous rescue network.',
style: context.textStyles.bodySmall?.copyWith(
color: AppColors.textMuted,
height: 1.5,
),
),
),
const SizedBox(height: 48),
// Links grid
Row(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
// Company
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
'COMPANY',
style: context.textStyles.labelSmall?.copyWith(
color: Colors.white,
letterSpacing: 3,
fontWeight: FontWeight.w800,
),
),
const SizedBox(height: 16),
_FooterLink(text: 'Our Story'),
const SizedBox(height: 12),
_FooterLink(text: 'Careers'),
const SizedBox(height: 12),
_FooterLink(
text: 'Become a Driver',
isHighlighted: true,
),
],
),
),
// Support
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(
'SUPPORT',
style: context.textStyles.labelSmall?.copyWith(
color: Colors.white,
letterSpacing: 3,
fontWeight: FontWeight.w800,
),
),
const SizedBox(height: 16),
_FooterLink(text: 'Contact Us'),
const SizedBox(height: 12),
_FooterLink(text: 'Terms & Conditions', route: AppRoutes.termsConditions),
const SizedBox(height: 12),
_FooterLink(text: 'Privacy Policy', route: AppRoutes.privacyPolicy),
],
),
),
],
),
const SizedBox(height: 32),
// Social
Row(
children: [
_SocialButton(icon: Icons.share),
const SizedBox(width: 12),
_SocialButton(icon: Icons.alternate_email),
const SizedBox(width: 12),
_SocialButton(icon: Icons.language),
],
),
const SizedBox(height: 64),
_BottomBar(),
],
);
}
}

class _LogoWidget extends StatelessWidget {
@override
Widget build(BuildContext context) {
return ClipRRect(
borderRadius: BorderRadius.circular(8),
child: Image.asset(
'assets/images/RoadyGo.jpeg',
height: 48,
fit: BoxFit.contain,
),
);
}
}

class _BottomBar extends StatelessWidget {
@override
Widget build(BuildContext context) {
final isDesktop = MediaQuery.of(context).size.width >= Breakpoints.desktop;

return Container(
padding: const EdgeInsets.only(top: 32),
decoration: const BoxDecoration(
border: Border(
top: BorderSide(color: AppColors.white05),
),
),
child: isDesktop
? Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Text(
'© 2024 ROADY GO INC. ENGINEERED FOR THE FUTURE.',
style: context.textStyles.labelSmall?.copyWith(
color: AppColors.textDark,
letterSpacing: 2,
fontSize: 10,
),
),
Row(
children: [
_BottomLink(text: 'PRIVACY', route: AppRoutes.privacyPolicy),
const SizedBox(width: 32),
_BottomLink(text: 'TERMS', route: AppRoutes.termsConditions),
const SizedBox(width: 32),
_BottomLink(text: 'SECURITY'),
],
),
],
)
: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Row(
children: [
_BottomLink(text: 'PRIVACY', route: AppRoutes.privacyPolicy),
const SizedBox(width: 24),
_BottomLink(text: 'TERMS', route: AppRoutes.termsConditions),
const SizedBox(width: 24),
_BottomLink(text: 'SECURITY'),
],
),
const SizedBox(height: 24),
Text(
'© 2024 ROADY GO INC. ENGINEERED FOR THE FUTURE.',
style: context.textStyles.labelSmall?.copyWith(
color: AppColors.textDark,
letterSpacing: 2,
fontSize: 9,
),
),
],
),
);
}
}

class _BottomLink extends StatelessWidget {
final String text;
final String? route;

const _BottomLink({required this.text, this.route});

@override
Widget build(BuildContext context) {
return MouseRegion(
cursor: SystemMouseCursors.click,
child: GestureDetector(
onTap: route != null ? () => context.go(route!) : null,
child: Text(
text,
style: context.textStyles.labelSmall?.copyWith(
color: AppColors.textMuted,
letterSpacing: 2,
),
),
),
);
}
}

class _FooterLink extends StatelessWidget {
final String text;
final bool isHighlighted;
final String? route;

const _FooterLink({
required this.text,
this.isHighlighted = false,
this.route,
});

@override
Widget build(BuildContext context) {
return MouseRegion(
cursor: SystemMouseCursors.click,
child: GestureDetector(
onTap: route != null ? () => context.go(route!) : null,
child: Text(
text,
style: context.textStyles.bodySmall?.copyWith(
color: isHighlighted ? AppColors.primary : AppColors.textMuted,
fontWeight: FontWeight.w500,
),
),
),
);
}
}

class _SocialButton extends StatelessWidget {
final IconData icon;

const _SocialButton({required this.icon});

@override
Widget build(BuildContext context) {
return MouseRegion(
cursor: SystemMouseCursors.click,
child: Container(
width: 40,
height: 40,
decoration: BoxDecoration(
color: AppColors.white05,
borderRadius: BorderRadius.circular(12),
border: Border.all(color: AppColors.white10),
),
child: Icon(icon, color: Colors.white, size: 20),
),
);
}
}
