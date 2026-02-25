import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:roadygo_website/pages/landing_page.dart';
import 'package:roadygo_website/pages/terms_conditions_page.dart';
import 'package:roadygo_website/pages/privacy_policy_page.dart';

/// GoRouter configuration for Roady GO navigation
class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.home,
    routes: [
      GoRoute(
        path: AppRoutes.home,
        name: 'home',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: LandingPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.termsConditions,
        name: 'terms-conditions',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: TermsConditionsPage(),
        ),
      ),
      GoRoute(
        path: AppRoutes.privacyPolicy,
        name: 'privacy-policy',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: PrivacyPolicyPage(),
        ),
      ),
    ],
  );
}

/// Route path constants
class AppRoutes {
  static const String home = '/';
  static const String termsConditions = '/terms-conditions';
  static const String privacyPolicy = '/privacy-policy';
}
