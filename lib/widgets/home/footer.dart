import 'package:flutter/material.dart';
import '../../config/constants.dart';
import '../../utils/responsive.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 64,
        vertical: 48,
      ),
      decoration: const BoxDecoration(
        color: AppConstants.darkBg,
      ),
      child: Center(
        child: SizedBox(
          width: Responsive.contentWidth(context),
          child: Column(
            children: [
              isMobile
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildBrandSection(),
                        const SizedBox(height: 32),
                        _buildLinksSection('Quick Links', [
                          'Home',
                          'About Us',
                          'Courses',
                          'Contact',
                        ]),
                        const SizedBox(height: 32),
                        _buildLinksSection('Exams', [
                          'UPSC',
                          'SSC',
                          'Banking',
                          'Railways',
                        ]),
                        const SizedBox(height: 32),
                        _buildLinksSection('Support', [
                          'FAQ',
                          'Terms of Service',
                          'Privacy Policy',
                          'Refund Policy',
                        ]),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 2, child: _buildBrandSection()),
                        const SizedBox(width: 48),
                        Expanded(
                          child: _buildLinksSection('Quick Links', [
                            'Home',
                            'About Us',
                            'Courses',
                            'Contact',
                          ]),
                        ),
                        Expanded(
                          child: _buildLinksSection('Exams', [
                            'UPSC',
                            'SSC',
                            'Banking',
                            'Railways',
                          ]),
                        ),
                        Expanded(
                          child: _buildLinksSection('Support', [
                            'FAQ',
                            'Terms of Service',
                            'Privacy Policy',
                            'Refund Policy',
                          ]),
                        ),
                      ],
                    ),
              const SizedBox(height: 32),
              Divider(color: Colors.white.withValues(alpha: 0.1)),
              const SizedBox(height: 16),
              Text(
                '\u00A9 2024 Merit Zone. All rights reserved.',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.5),
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBrandSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppConstants.primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.school, color: Colors.white, size: 24),
            ),
            const SizedBox(width: 12),
            const Text(
              'Merit Zone',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          'Empowering students with quality education and expert guidance for competitive exam success.',
          style: TextStyle(
            color: Colors.white.withValues(alpha: 0.7),
            fontSize: 14,
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _buildLinksSection(String title, List<String> links) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
        ...links.map(
          (link) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              link,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.6),
                fontSize: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
