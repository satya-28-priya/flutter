import 'package:flutter/material.dart';
import '../../config/constants.dart';
import '../../utils/responsive.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final String? subtitle;

  const SectionTitle({super.key, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: Responsive.fontSize(context, base: 36),
            fontWeight: FontWeight.bold,
            color: AppConstants.textDark,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Container(
          width: 60,
          height: 4,
          decoration: BoxDecoration(
            color: AppConstants.accentColor,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 16),
          Text(
            subtitle!,
            style: TextStyle(
              fontSize: Responsive.fontSize(context, base: 16),
              color: AppConstants.textLight,
            ),
            textAlign: TextAlign.center,
          ),
        ],
        const SizedBox(height: 40),
      ],
    );
  }
}
