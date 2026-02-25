import 'package:flutter/material.dart';
import 'package:roadygo_website/theme.dart';

/// Simple logo positioned at top left
class RoadyHeader extends StatelessWidget {
  const RoadyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.only(
          left: ResponsiveLayout.contentPadding(context),
          top: 16,
        ),
        child: Align(
          alignment: Alignment.topLeft,
          child: _Logo(),
        ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          'assets/images/RoadyGo.jpeg',
          height: 44,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
